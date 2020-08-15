[CmdletBinding()]
param
(
    [Parameter(Mandatory)]
    $TestFolder,

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

if ($TargetPesterVersion -match '^4') {
    Write-Host "##vso[task.logissue type=error]This version of the task does not support Pester V4, please use task version 9."
    exit 1
}

Write-Host "TestFolder $TestFolder"
Write-Host "resultsFile $resultsFile"
Write-Host "run32Bit $run32Bit"
Write-Host "additionalModulePath $additionalModulePath"
Write-Host "tag $Tag"
Write-Host "ExcludeTag $ExcludeTag"
Write-Host "CodeCoverageOutputFile $CodeCoverageOutputFile"
Write-Host "CodeCoverageFolder $CodeCoverageFolder"
Write-Host "ScriptBlock $ScriptBlock"

Import-Module -Name (Join-Path $PSScriptRoot "HelperModule.psm1") -Force
Import-Pester -Version $TargetPesterVersion

if ($run32Bit -eq $true -and $env:Processor_Architecture -ne "x86") {
    Write-Warning "32bit support is considered deprecated in this version of the task and will be removed in a future major version."
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
    write-warning "Re-launching in x86 PowerShell with $($args -join ' ')"
    &"$env:windir\syswow64\windowspowershell\v1.0\powershell.exe" -noprofile -executionpolicy bypass -file $myinvocation.Mycommand.path $args
    exit
}
Write-Host "Running in $($env:Processor_Architecture) PowerShell"

if ($PSBoundParameters.ContainsKey('additionalModulePath')) {
    Write-Host "Adding additional module path [$additionalModulePath] to `$env:PSModulePath"
    $env:PSModulePath = $additionalModulePath + [System.IO.Path]::PathSeparator + $env:PSModulePath
}
$PesterConfig = [PesterConfiguration]::Default

$PesterConfig.run = @{
    Path     = $TestFolder
    PassThru = $true
}
$PesterConfig.TestResult = @{
    Enabled      = $true
    OutputFormat = 'NUnit2.5'
    OutputPath   = $resultsFile
}


$Filter = @{}
if ($Tag) {
    $Tag = $Tag.Split(',').Replace('"', '').Replace("'", "")
    $Filter.Add('Tag', $Tag)
}
if ($ExcludeTag) {
    $ExcludeTag = $ExcludeTag.Split(',').Replace('"', '').Replace("'", "")
    $Filter.Add('ExcludeTag', $ExcludeTag)
}

$PesterConfig.Filter = $Filter

if ($CodeCoverageOutputFile) {
    $PesterConfig.CodeCoverage.Enabled = $True
    $PesterConfig.CodeCoverage.OutputFormat = "JaCoCo"

    if (-not $PSBoundParameters.ContainsKey('CodeCoverageFolder')) {
        $CodeCoverageFolder = $TestFolder
    }
    $Files = Get-ChildItem -Path $CodeCoverageFolder -include *.ps1, *.psm1 -Exclude *.Tests.ps1 -Recurse |
        Select-object -ExpandProperty Fullname

    if ($Files) {
        $PesterConfig.CodeCoverage.Path = $Files
        $PesterConfig.CodeCoverage.OutputPath = $CodeCoverageOutputFile
    }
    else {
        Write-Warning -Message "No PowerShell files found under [$CodeCoverageFolder] to analyse for code coverage."
    }
}

if (-not([String]::IsNullOrWhiteSpace($ScriptBlock))) {
    if (Test-Path $ScriptBlock) {
        $ScriptBlock = Get-Content -Path $ScriptBlock -Raw
    }
    $ScriptBlockObject = [ScriptBlock]::Create($ScriptBlock)

    $ScriptBlockObject.Invoke()
}

$result = Invoke-Pester -Configuration  ([PesterConfiguration]$PesterConfig)

if ($Result.Failed.Count -gt 0) {
    Write-Error "Pester Failed at least one test. Please see results for details."
}
