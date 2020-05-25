
Describe "Testing Helper Functions" {

    BeforeAll {
        Import-Module -Name (Resolve-Path "$PSScriptRoot/../../task/HelperModule.psm1") -Force
    }
    Context "Testing Get-HashtableFromString" {

        It "Can parse empty block" {
            $actual = Get-HashtableFromString -line ""
            $actual.GetType() | Should -Be @{}.GetType()
            $actual.count | Should -Be 0
        }

        It "Can parse block with no values but delimiter" {
            $actual = Get-HashtableFromString -line ";"
            $actual.GetType() | Should -Be @{}.GetType()
            $actual.count | Should -Be 0
        }

        It "Cannot parse block with invalid string" {
            $actual = Get-HashtableFromString -line ";"
            $actual.GetType() | Should -Be @{}.GetType()
            $actual.count | Should -Be 0
        }

        It "Can parse two part block" {
            $actual = Get-HashtableFromString -line "@{Path='C:\path\123'; Parameters=@{param1='111'; param2='222'}}"
            $actual.Path | Should -Be "C:\path\123"
            $actual.Parameters.param1 | Should -Be "111"
            $actual.Parameters.param2 | Should -Be "222"
        }

        It "Can parse two hashtable part block" {
            $actual = Get-HashtableFromString -line "@{Parameters1=@{param1='111'; param2='222'}; Parameters2=@{param1='111'; param2='222'}}"
            $actual.Parameters1.param1 | Should -Be "111"
            $actual.Parameters1.param2 | Should -Be "222"
            $actual.Parameters2.param1 | Should -Be "111"
            $actual.Parameters2.param2 | Should -Be "222"
        }

        It "Can parse block with trailing ;" {
            $actual = Get-HashtableFromString -line "@{Path='C:\path\123'; Parameters=@{param1='111'; param2='222'}};"
            $actual.Path | Should -Be "C:\path\123"
            $actual.Parameters.param1 | Should -Be "111"
            $actual.Parameters.param2 | Should -Be "222"
        }

        It "Can parse three part block 1" {
            $actual = Get-HashtableFromString -line "@{Path='C:\path\123';  x='y'; Parameters=@{param1='111'; param2='222'}}"
            $actual.Path | Should -Be "C:\path\123"
            $actual.Parameters.param1 | Should -Be "111"
            $actual.Parameters.param2 | Should -Be "222"
            $actual.x | Should -Be "y"
        }

        It "Can parse three part block 2" {
            $actual = Get-HashtableFromString -line "@{Path='C:\path\123'; Parameters=@{param1='111'; param2='222'}; x='y'}"
            $actual.Path | Should -Be "C:\path\123"
            $actual.Parameters.param1 | Should -Be "111"
            $actual.Parameters.param2 | Should -Be "222"
            $actual.x | Should -Be "y"
        }
        It "Can parse hashtable with ; in a value" {
            $actual = Get-HashtableFromString -line "@{Path='.\tests\script.tests.ps1'; Parameters=@{someVar='this'}},@{Path='.\tests\script2.tests.ps1'; Parameters=@{otherparam='foo.txt;bar.txt'}}"
            $actual.GetType().BaseType | Should -Be "Array"
            $actual[0].Path | Should -Be '.\tests\script.tests.ps1'
            $actual[0].Parameters.SomeVar | Should -Be 'this'
            $actual[1].Path | Should -Be '.\tests\script2.tests.ps1'
            $actual[1].Parameters.otherparam | Should -Be 'foo.txt;bar.txt'
        }
        It "Can parse hashtable with commas in a value" {
            $actual = Get-HashtableFromString -line "@{Path='.\tests\script.tests.ps1'; Parameters=@{someVar='this'}},@{Path='.\tests\script2.tests.ps1'; Parameters=@{otherparam='foo.txt;bar.txt';Param2='ValueGoesHere'}},@{path='.\tests\script3.tests.ps1';Parameters=@{inputvar='var,this,string'}}"
            $actual.GetType().BaseType | Should -Be "Array"
            $actual[0].Path | Should -Be '.\tests\script.tests.ps1'
            $actual[0].Parameters.SomeVar | Should -Be 'this'
            $actual[1].Path | Should -Be '.\tests\script2.tests.ps1'
            $actual[1].Parameters.otherparam | Should -Be 'foo.txt;bar.txt'
            $actual[1].Parameters.Param2 | Should -Be 'ValueGoesHere'
            $actual[2].Path | Should -Be '.\tests\script3.tests.ps1'
            $actual[2].Parameters.inputvar | Should -Be 'var,this,string'
        }
    }

    Context "Testing Import-Pester" {

        BeforeAll {
            Mock -CommandName Import-Module -MockWith { }
            Mock -CommandName Install-Module -MockWith { $true }
            Mock -CommandName Write-host -MockWith { }
            Mock -CommandName Get-PSRepository -MockWith {[PSCustomObject]@{Name = 'PSGallery'}}
            Mock -CommandName Get-Command -MockWith { [PsCustomObject]@{Parameters=@{SkipPublisherCheck='SomeValue'}}} -ParameterFilter {$Name -eq 'Install-Module'}
            Mock -CommandName Get-Command -MockWith { [PsCustomObject]@{Parameters=@{AllowPrerelease='SomeValue'}}} -ParameterFilter {$Name -eq 'Find-Module'}
        }

        It "Installs the latest version of Pester when on PS5+ and PowerShellGet is available" {
            Mock -CommandName Find-Module -MockWith { [PsCustomObject]@{Version=[version]::new(9,9,9);Repository='PSGallery'}}
            Mock -CommandName Get-PackageProvider -MockWith { $True }

            Import-Pester -Version "latest"
            
            Assert-MockCalled -CommandName Import-Module -ParameterFilter {$RequiredVersion -eq "9.9.9"} -Scope It -Times 1
        }

        It "Installs the latest version of Pester from PSGallery when multiple repositories are available" {
            Mock -CommandName Find-Module -MockWith { @(
                    [PsCustomObject]@{Version=[version]::new(4,3,0);Repository='OtherRepository'}
                    [PsCustomObject]@{Version=[version]::new(9,9,9);Repository='PSGallery'}
                )
            }
            Mock -CommandName Get-PackageProvider -MockWith { $True }

            Import-Pester -Version "latest"

            Assert-MockCalled -CommandName Install-Module -Scope It -ParameterFilter {$Repository -eq 'PSGallery'}
        }

        It "Installs the required version of NuGet provider when PowerShellGet is available and NuGet isn't already installed" {
            Mock -CommandName Find-Module -MockWith { [PsCustomObject]@{Version=[version]::new(9,9,9);Repository='PSGallery'}}
            Mock -CommandName Get-PackageProvider -MockWith { throw }
            Mock -CommandName Install-PackageProvider -MockWith {}

            Import-Pester -Version "latest"

            Assert-MockCalled -CommandName Install-PackageProvider
        }

        It "Should not install a new version of Pester when the latest is already installed" {
            Mock -CommandName Find-Module -MockWith { [PsCustomObject]@{Version=(Get-Module Pester).Version;Repository='PSGallery'}}
            Mock -CommandName Get-PackageProvider -MockWith { $True }

            Import-Pester -Version "latest"

            Assert-MockCalled -CommandName Install-Module -Times 0 -Scope It
        }

        It "Should install and import the specified version of Pester regardless of what is avaialble locally" {
            Mock -CommandName Find-Module -MockWith { [PsCustomObject]@{Version=[version]::new(4,2,0);Repository='PSGallery'}}
            Mock -CommandName Get-PackageProvider -MockWith { $True }

            Import-Pester -Version 4.2.0

            Assert-MockCalled -CommandName Install-Module -Times 1 -ParameterFilter { $RequiredVersion -eq "4.2.0"}
            Assert-MockCalled -CommandName Import-Module -Times 1 -ParameterFilter {$RequiredVersion -eq "4.2.0"}
        }

        It "Should not Install the latest version of Pester when on PowerShellGet is available but SkipPublisherCheck is not available" {
            Mock -CommandName Find-Module -MockWith { [PsCustomObject]@{Version=[version]::new(9,9,9);Repository='PSGallery'}}
            Mock -CommandName Get-PackageProvider -MockWith { $True }
            Mock -CommandName Get-Command -MockWith { [PsCustomObject]@{Parameters=@{OtherProperty='SomeValue'}} } -ParameterFilter {$Name -eq 'Install-Module'}

            Import-Pester -Version "latest"

            Assert-MockCalled -CommandName Install-Module -Times 0 -Scope It
            Assert-MockCalled -CommandName Import-Module -Times 1 -ParameterFilter {$Name -like '*\4.10.1\Pester.psd1'}
        }

        It "Should fall back to build in version of Pester when no repositories are available" {
            Mock -CommandName Get-PSRepository -MockWith {}
            Mock -CommandName Get-Command -MockWith { [PsCustomObject]@{Parameters=@{SkipPublisherCheck='SomeValue'}}} -ParameterFilter {$Name -eq 'Install-Module'}

            Import-Pester -Version "latest"

            Assert-MockCalled -CommandName Install-Module -Times 0 -Scope It
            Assert-MockCalled -CommandName Write-Host -Times 1 -Scope It -ParameterFilter {
                $Object -eq "##vso[task.logissue type=warning]Falling back to version of Pester shipped with extension. To use a newer version please update the version of PowerShellGet available on this machine."
            }
            Assert-MockCalled -CommandName Import-Module -Times 1 -ParameterFilter {$Name -like '*\4.10.1\Pester.psd1'}
        }

        <#It "Loads Pester version that ships with task when not on PS5+ or PowerShellGet is unavailable" {
            Mock -CommandName Invoke-Pester -MockWith { }
            Mock -CommandName Import-Module -MockWith { }
            Mock -CommandName Write-Host -MockWith { }
            Mock -CommandName Write-Warning -MockWith { }
            Mock -CommandName Write-Error -MockWith { }
            Mock -CommandName Get-Module -MockWith { }

            &$sut -ScriptFolder TestDrive:\ -ResultsFile TestDrive:\output.xml
            Assert-MockCalled  Import-Module -ParameterFilter { $Name -eq "$pwd\4.10.1\Pester.psd1" }
            Assert-MockCalled Invoke-Pester
        }#>
    }
}
