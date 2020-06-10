[CmdletBinding()]
param
(
    [Parameter(Mandatory)]
    $scriptFolder,

    [Parameter(Mandatory)]
    [ValidateScript( {
            if ((Test-Path (Split-Path $_ -Parent)) -and ($_.split('.')[-1] -eq 'xml')) {
                $true
            }
            else {
                Throw "Path is invalid or results file does not end in .xml ($_)"
            }
        })]
    [string]$resultsFile,

    [string]$run32Bit,

    [string]$additionalModulePath,

    [string[]]$Tag,

    [String[]]$ExcludeTag,

    [validateScript( {
            if ([string]::IsNullOrWhiteSpace($_)) {
                $true
            }
            else {
                if (-not($_.Split('.')[-1] -eq 'xml')) {
                    throw "Extension must be XML"
                }
                $true
            }
        })]
    [string]$CodeCoverageOutputFile,

    [string]$CodeCoverageFolder,

    [string]$ScriptBlock,

    [string]$TargetPesterVersion = "latest"
)

if ($TargetPesterVersion -match '^5') {
    Write-Host "##vso[task.logissue type=error]This version of the task does not support Pester V5, please use task version 10 or higher."
    exit 1
}
if ($TargetPesterVersion -match 'latest') {
    Write-Host "##vso[task.logissue type=warning]Task version not properly set so defaulting to enforcing it to be the latest possible v4 that we will support in this version of the task - v4.99.99"
    $TargetPesterVersion = '4.99.99'
}
Write-Host "scriptFolder $scriptFolder"
Write-Host "resultsFile $resultsFile"
Write-Host "run32Bit $run32Bit"
Write-Host "additionalModulePath $additionalModulePath"
Write-Host "tag $Tag"
Write-Host "ExcludeTag $ExcludeTag"
Write-Host "CodeCoverageOutputFile $CodeCoverageOutputFile"
Write-Host "CodeCoverageFolder $CodeCoverageFolder"
Write-Host "ScriptBlock $ScriptBlock"

Import-Module -Name (Join-Path $PSScriptRoot "HelperModule.psm1") -Force
If ($TargetPesterVersion -eq '4.99.99') {
    Import-Pester -MaximumVersion $TargetPesterVersion
} 
else {
    Import-Pester -Version $TargetPesterVersion
} 


if ($run32Bit -eq $true -and $env:Processor_Architecture -ne "x86") {
    # Get the command parameters
    $args = $myinvocation.BoundParameters.GetEnumerator() | ForEach-Object {
        if (-not([string]::IsNullOrWhiteSpace($_.Value))) {
            If ($_.Value -eq 'True' -and $_.Key -ne 'run32Bit' -and $_.Key -ne 'ForceUseOfPesterInTasks') {
                "-$($_.Key)"
            }
            else {
                "-$($_.Key)"
                "$($_.Value)"
            }
        }

    }
    Write-Warning "Re-launching in x86 PowerShell with $($args -join ' ')"
    &"$env:windir\syswow64\windowspowershell\v1.0\powershell.exe" -noprofile -executionpolicy bypass -file $myinvocation.Mycommand.path $args
    exit
}
Write-Host "Running in $($env:Processor_Architecture) PowerShell"

if ($PSBoundParameters.ContainsKey('additionalModulePath')) {
    Write-Host "Adding additional module path [$additionalModulePath] to `$env:PSModulePath"
    $env:PSModulePath = $additionalModulePath + ';' + $env:PSModulePath
}


$Parameters = @{
    PassThru     = $True
    OutputFile   = $resultsFile
    OutputFormat = 'NUnitXml'
}

if (Test-Path -path $scriptFolder) {
    Write-Host "Running Pester from the folder [$scriptFolder] output sent to [$resultsFile]"
    $Parameters.Add("Script", $scriptFolder)
}
elseif ($ScriptFolder -is [String] -and $scriptFolder -match '@{') {
    Write-Host "Running Pester using the script parameter [$scriptFolder] output sent to [$resultsFile]"
    $Parameters.Add("Script", (Get-HashtableFromString -line $scriptFolder))
}
else {
    Write-Host "Running Pester using the script parameter [$($scriptFolder | Format-Table | Out-String)] output sent to [$resultsFile]"
    $Parameters.Add("Script", $scriptFolder)
}

if ($Tag) {
    $Tag = $Tag.Split(',').Replace('"', '').Replace("'", "")
    $Parameters.Add('Tag', $Tag)
}
if ($ExcludeTag) {
    $ExcludeTag = $ExcludeTag.Split(',').Replace('"', '').Replace("'", "")
    $Parameters.Add('ExcludeTag', $ExcludeTag)
}
if ($CodeCoverageOutputFile -and (Get-Module Pester).Version -ge [Version]::Parse('4.0.4')) {
    if (-not $PSBoundParameters.ContainsKey('CodeCoverageFolder')) {
        $CodeCoverageFolder = $scriptFolder
    }
    $Files = Get-ChildItem -Path $CodeCoverageFolder -include *.ps1, *.psm1 -Exclude *.Tests.ps1 -Recurse |
        Select-Object -ExpandProperty Fullname

    if ($Files) {
        $Parameters.Add('CodeCoverage', $Files)
        $Parameters.Add('CodeCoverageOutputFile', $CodeCoverageOutputFile)
    }
    else {
        Write-Warning -Message "No PowerShell files found under [$CodeCoverageFolder] to analyse for code coverage."
    }
}
elseif ($CodeCoverageOutputFile -and (Get-Module Pester).Version -lt [Version]::Parse('4.0.4')) {
    Write-Warning -Message "Code coverage output not supported on Pester versions before 4.0.4."
}

if (-not([String]::IsNullOrWhiteSpace($ScriptBlock))) {
    $ScriptBlockObject = [ScriptBlock]::Create($ScriptBlock)

    $ScriptBlockObject.Invoke()
}

$result = Invoke-Pester @Parameters

if ($result.failedCount -ne 0) {
    Write-Error "Pester returned errors"
}
