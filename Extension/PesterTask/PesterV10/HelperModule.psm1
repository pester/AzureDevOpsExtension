function Get-HashtableFromString
{
    param
    (
        [string]$lineInput
    )

    # check for empty first
    If ([String]::IsNullOrEmpty($lineInput.trim(';'))) {
        return @{}
    }

    Foreach ($line in ($lineInput -split '(?<=}\s*),')) {
        $Hashtable = [System.Management.Automation.Language.Parser]::ParseInput($line, [Ref]$null, [Ref]$null).Find({
            $args[0] -is [System.Management.Automation.Language.HashtableAst]
        }, $false)

        if ($PSVersionTable.PSVersion.Major -ge 5) {
            # Use the language parser to safely parse the hashtable string into a real hashtable.
            $Hashtable.SafeGetValue()
        }
        else {
            Write-Warning -Message "PowerShell Version lower than 5 detected. Performing Unsafe hashtable conversion. Please update to version 5 or above when possible for safe conversion of hashtable."
            Invoke-Expression -Command $Hashtable.Extent
        }
    }
}

function Import-Pester {
    [cmdletbinding()]
    param (
        [string]$Version
    )


    if ((Get-Module -Name PowerShellGet -ListAvailable) -and
        (Get-Command Install-Module).Parameters.ContainsKey('SkipPublisherCheck') -and
        (Get-PSRepository)) {

        try {
            $null = Get-PackageProvider -Name NuGet -ErrorAction Stop
        }
        catch {
            try {
                Install-PackageProvider -Name Nuget -RequiredVersion 2.8.5.208 -Scope CurrentUser -Force -Confirm:$false -ErrorAction Stop
            }
            catch {
                Write-Host "##vso[task.logissue type=warning]Falling back to version of Pester shipped with extension. To use a newer version please update the version of PowerShellGet available on this machine."
                Import-Module -Name (Join-Path $PSScriptRoot "4.10.1\Pester.psd1") -Force -Verbose:$false -Global
            }
        }

        if ($Version -eq "latest") {
            $NewestPester = Find-Module -Name Pester -MinimumVersion 5.0.0 | Sort-Object Version -Descending | Select-Object -First 1

            If ((Get-Module Pester -ListAvailable | Sort-Object Version -Descending| Select-Object -First 1).Version -lt $NewestPester.Version) {
                Install-Module -Name Pester -RequiredVersion $NewestPester.Version -Scope CurrentUser -Force -Repository $NewestPester.Repository -SkipPublisherCheck
            }
        }
        else {
            $NewestPester = Find-Module -Name Pester -RequiredVersion $Version | Select-Object -First 1

            Install-Module -Name Pester -RequiredVersion $NewestPester.Version -Scope CurrentUser -Force -Repository $NewestPester.Repository -SkipPublisherCheck
        }

        Import-Module -Name Pester -RequiredVersion $NewestPester.Version -Verbose:$false -Global
    }
    else {
        Write-Host "##vso[task.logissue type=warning]Falling back to version of Pester shipped with extension. To use a newer version please update the version of PowerShellGet available on this machine."
        Import-Module -Name (Join-Path $PSScriptRoot "4.10.1\Pester.psd1") -Force -Verbose:$false -Global
    }

}
