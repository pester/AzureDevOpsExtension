# file src\functions\Pester.SafeCommands.ps1
# Tried using $ExecutionState.InvokeCommand.GetCmdlet() here, but it does not trigger module auto-loading the way
# Get-Command does.  Since this is at import time, before any mocks have been defined, that's probably acceptable.
# If someone monkeys with Get-Command before they import Pester, they may break something.

# The -All parameter is required when calling Get-Command to ensure that PowerShell can find the command it is
# looking for. Otherwise, if you have modules loaded that define proxy cmdlets or that have cmdlets with the same
# name as the safe cmdlets, Get-Command will return null.
$safeCommandLookupParameters = @{
    CommandType = 'Cmdlet'
    ErrorAction = 'Stop'
    All         = $true
}

$Get_Command = Get-Command Get-Command -CommandType Cmdlet -ErrorAction 'Stop'
$script:SafeCommands = @{
    'Get-Command'          = $Get_Command
    'Add-Member'           = & $Get_Command -Name Add-Member           -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Add-Type'             = & $Get_Command -Name Add-Type             -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Compare-Object'       = & $Get_Command -Name Compare-Object       -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Export-ModuleMember'  = & $Get_Command -Name Export-ModuleMember  -Module Microsoft.PowerShell.Core       @safeCommandLookupParameters
    'ForEach-Object'       = & $Get_Command -Name ForEach-Object       -Module Microsoft.PowerShell.Core       @safeCommandLookupParameters
    'Format-Table'         = & $Get_Command -Name Format-Table         -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Get-Alias'            = & $Get_Command -Name Get-Alias            -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Get-ChildItem'        = & $Get_Command -Name Get-ChildItem        -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Get-Content'          = & $Get_Command -Name Get-Content          -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Get-Date'             = & $Get_Command -Name Get-Date             -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Get-Item'             = & $Get_Command -Name Get-Item             -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Get-ItemProperty'     = & $Get_Command -Name Get-ItemProperty     -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Get-Location'         = & $Get_Command -Name Get-Location         -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Get-Member'           = & $Get_Command -Name Get-Member           -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Get-Module'           = & $Get_Command -Name Get-Module           -Module Microsoft.PowerShell.Core       @safeCommandLookupParameters
    'Get-PSDrive'          = & $Get_Command -Name Get-PSDrive          -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Get-PSCallStack'      = & $Get_Command -Name Get-PSCallStack      -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Get-Unique'           = & $Get_Command -Name Get-Unique           -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Get-Variable'         = & $Get_Command -Name Get-Variable         -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Group-Object'         = & $Get_Command -Name Group-Object         -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Import-LocalizedData' = & $Get_Command -Name Import-LocalizedData -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Import-Module'        = & $Get_Command -Name Import-Module        -Module Microsoft.PowerShell.Core       @safeCommandLookupParameters
    'Join-Path'            = & $Get_Command -Name Join-Path            -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Measure-Object'       = & $Get_Command -Name Measure-Object       -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'New-Item'             = & $Get_Command -Name New-Item             -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'New-ItemProperty'     = & $Get_Command -Name New-ItemProperty     -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'New-Module'           = & $Get_Command -Name New-Module           -Module Microsoft.PowerShell.Core       @safeCommandLookupParameters
    'New-Object'           = & $Get_Command -Name New-Object           -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'New-PSDrive'          = & $Get_Command -Name New-PSDrive          -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'New-Variable'         = & $Get_Command -Name New-Variable         -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Out-Host'             = & $Get_Command -Name Out-Host             -Module Microsoft.PowerShell.Core       @safeCommandLookupParameters
    'Out-File'             = & $Get_Command -Name Out-File             -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Out-Null'             = & $Get_Command -Name Out-Null             -Module Microsoft.PowerShell.Core       @safeCommandLookupParameters
    'Out-String'           = & $Get_Command -Name Out-String           -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Pop-Location'         = & $Get_Command -Name Pop-Location         -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Push-Location'        = & $Get_Command -Name Push-Location        -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Remove-Item'          = & $Get_Command -Name Remove-Item          -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Remove-PSBreakpoint'  = & $Get_Command -Name Remove-PSBreakpoint  -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Remove-PSDrive'       = & $Get_Command -Name Remove-PSDrive       -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Remove-Variable'      = & $Get_Command -Name Remove-Variable      -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Resolve-Path'         = & $Get_Command -Name Resolve-Path         -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Select-Object'        = & $Get_Command -Name Select-Object        -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Set-Alias'            = & $Get_Command -Name Set-Alias            -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Set-Content'          = & $Get_Command -Name Set-Content          -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Set-Location'         = & $Get_Command -Name Set-Location         -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Set-PSBreakpoint'     = & $Get_Command -Name Set-PSBreakpoint     -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Set-StrictMode'       = & $Get_Command -Name Set-StrictMode       -Module Microsoft.PowerShell.Core       @safeCommandLookupParameters
    'Set-Variable'         = & $Get_Command -Name Set-Variable         -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Sort-Object'          = & $Get_Command -Name Sort-Object          -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Split-Path'           = & $Get_Command -Name Split-Path           -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Start-Sleep'          = & $Get_Command -Name Start-Sleep          -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Test-Path'            = & $Get_Command -Name Test-Path            -Module Microsoft.PowerShell.Management @safeCommandLookupParameters
    'Where-Object'         = & $Get_Command -Name Where-Object         -Module Microsoft.PowerShell.Core       @safeCommandLookupParameters
    'Write-Error'          = & $Get_Command -Name Write-Error          -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Write-Host'           = & $Get_Command -Name Write-Host           -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Write-Progress'       = & $Get_Command -Name Write-Progress       -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Write-Verbose'        = & $Get_Command -Name Write-Verbose        -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
    'Write-Warning'        = & $Get_Command -Name Write-Warning        -Module Microsoft.PowerShell.Utility    @safeCommandLookupParameters
}

# Not all platforms have Get-WmiObject (Nano or PSCore 6.0.0-beta.x on Linux)
# Get-CimInstance is preferred, but we can use Get-WmiObject if it exists
# Moreover, it shouldn't really be fatal if neither of those cmdlets
# exist
if (($cim = & $Get_Command -Name Get-CimInstance -Module CimCmdlets -CommandType Cmdlet -ErrorAction Ignore)) {
    $script:SafeCommands['Get-CimInstance'] = $cim
}
elseif (($wmi = & $Get_Command -Name Get-WmiObject -Module Microsoft.PowerShell.Management -CommandType Cmdlet -ErrorAction Ignore)) {
    $script:SafeCommands['Get-WmiObject'] = $wmi
}
elseif (($unames = & $Get_Command -Name uname -CommandType Application -ErrorAction Ignore)) {
    $script:SafeCommands['uname'] = if ($null -ne $unames -and 0 -lt @($unames).Count) { $unames[0] }
    if  (($ids = & $Get_Command -Name id -CommandType Application -ErrorAction Ignore)) {
        $script:SafeCommands['id'] = if ($null -ne $ids -and 0 -lt @($ids).Count) { $ids[0] }
    }
}
else {
    Write-Warning "OS Information retrieval is not possible, reports will contain only partial system data"
}

# little sanity check to make sure we don't blow up a system with a typo up there
# (not that I've EVER done that by, for example, mapping New-Item to Remove-Item...)

foreach ($keyValuePair in $script:SafeCommands.GetEnumerator()) {
    if ($keyValuePair.Key -ne $keyValuePair.Value.Name) {
        throw "SafeCommands entry for $($keyValuePair.Key) does not hold a reference to the proper command."
    }
}

# file src\Pester.Types.ps1
if ($PSVersionTable.PSVersion.Major -ge 6) {
    Add-Type -Path "$PSScriptRoot/bin/netstandard2.0/Pester.dll"
}
else {
    Add-Type -Path "$PSScriptRoot/bin/net452/Pester.dll"
}
# file src\Pester.State.ps1
$script:AssertionOperators = [Collections.Generic.Dictionary[string,object]]([StringComparer]::InvariantCultureIgnoreCase)
$script:AssertionAliases = [Collections.Generic.Dictionary[string,object]]([StringComparer]::InvariantCultureIgnoreCase)
$script:AssertionDynamicParams = [Pester.Factory]::CreateRuntimeDefinedParameterDictionary()
$script:DisableScopeHints = $true
# file src\Pester.Utility.ps1
function or {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        $DefaultValue,
        [Parameter(ValueFromPipeline = $true)]
        $InputObject
    )

    if ($InputObject) {
        $InputObject
    }
    else {
        $DefaultValue
    }
}

# looks for a property on object that might be null
function tryGetProperty {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        $InputObject,
        [Parameter(Mandatory = $true, Position = 1)]
        $PropertyName
    )
    if ($null -eq $InputObject) {
        return
    }

    $InputObject.$PropertyName

    # this would be useful if we looked for property that might not exist
    # but that is not the case so-far. Originally I implemented this incorrectly
    # so I will keep this here for reference in case I was wrong the second time as well
    # $property = $InputObject.PSObject.Properties.Item($PropertyName)
    # if ($null -ne $property) {
    #     $property.Value
    # }
}

function trySetProperty {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        $InputObject,
        [Parameter(Mandatory = $true, Position = 1)]
        $PropertyName,
        [Parameter(Mandatory = $true, Position = 2)]
        $Value
    )

    if ($null -eq $InputObject) {
        return
    }

    $InputObject.$PropertyName = $Value
}


# combines collections that are not null or empty, but does not remove null values
# from collections so e.g. combineNonNull @(@(1,$null), @(1,2,3), $null, $null, 10)
# returns 1, $null, 1, 2, 3, 10
function combineNonNull ($Array) {
    foreach ($i in $Array) {

        $arr = @($i)
        if ($null -ne $i -and $arr.Length -gt 0) {
            foreach ($a in $arr) {
                $a
            }
        }
    }
}


filter selectNonNull {
    param($Collection)
    @(foreach ($i in $Collection) {
        if ($i) { $i }
    })
}

function any ($InputObject) {
    # inlining version
    $(<# any #> if (-not ($s = $InputObject)) { return $false } else { @($s).Length -gt 0 })
    # if (-not $InputObject) {
    #     return $false
    # }

    # @($InputObject).Length -gt 0
}

function none ($InputObject) {
    -not (any $InputObject)
}

function defined {
    param(
        [Parameter(Mandatory)]
        [String] $Name
    )
    # gets a variable via the provider and returns it's value, the name is slightly misleading
    # because it indicates that the variable is not defined when it is null, but that is fine
    # the call to the provider is slightly more expensive (at least it seems) so this should be
    # used only when we want a value that we will further inspect, and we don't want to add the overhead of
    # first checking that the variable exists and then getting it's value like here:
    # defined v & hasValue v & $v.Name -eq "abc"
    $ExecutionContext.SessionState.PSVariable.GetValue($Name)
}

function notDefined {
    param(
        [Parameter(Mandatory)]
        [String] $Name
    )
    # gets a variable via the provider and returns it's value, the name is slightly misleading
    # because it indicates that the variable is not defined when it is null, but that is fine
    # the call to the provider is slightly more expensive (at least it seems) so this should be
    # used only when we want a value that we will further inspect
    $null -eq ($ExecutionContext.SessionState.PSVariable.GetValue($Name))
}


function sum ($InputObject, $PropertyName, $Zero) {
    if (none $InputObject.Length) {
        return $Zero
    }

    $acc = $Zero
    foreach ($i in $InputObject) {
        $acc += $i.$PropertyName
    }

    $acc
}

function tryGetValue {
    [CmdletBinding()]
    param(
        $Hashtable,
        $Key
    )

    if ($Hashtable.ContainsKey($Key)) {
        # do not enumerate so we get the same thing back
        # even if it is a collection
        $PSCmdlet.WriteObject($Hashtable.$Key, $false)
    }
}

function tryAddValue {
    [CmdletBinding()]
    param(
        $Hashtable,
        $Key,
        $Value
    )

    if (-not $Hashtable.ContainsKey($Key)) {
        $null = $Hashtable.Add($Key, $Value)
    }
}

function getOrUpdateValue {
    [CmdletBinding()]
    param(
        $Hashtable,
        $Key,
        $DefaultValue
    )

    if ($Hashtable.ContainsKey($Key)) {
        # do not enumerate so we get the same thing back
        # even if it is a collection
        $PSCmdlet.WriteObject($Hashtable.$Key, $false)
    }
    else {
        $Hashtable.Add($Key, $DefaultValue)
        # do not enumerate so we get the same thing back
        # even if it is a collection
        $PSCmdlet.WriteObject($DefaultValue, $false)
    }
}

function tryRemoveKey ($Hashtable, $Key) {
    if ($Hashtable.ContainsKey($Key)) {
        $Hashtable.Remove($Key)
    }
}


function Merge-Hashtable ($Source, $Destination) {
    foreach ($p in $Source.GetEnumerator()) {
        # only add non existing keys so in case of conflict
        # the framework name wins, as if we had explicit parameters
        # on a scriptblock, then the parameter would also win
        if (-not $Destination.ContainsKey($p.Key)) {
            $Destination.Add($p.Key, $p.Value)
        }
    }
}


function Merge-HashtableOrObject ($Source, $Destination) {
    if ($Source -isnot [Collections.IDictionary] -and $Source -isnot [PSObject]) {
        throw "Source must be a Hashtable, IDictionary or a PSObject."
    }

    if ($Destination -isnot [PSObject]) {
        throw "Destination must be a PSObject."
    }


    $sourceIsPSObject = $Source -is [PSObject]
    $sourceIsDictionary = $Source -is [Collections.IDictionary]
    $destinationIsPSObject = $Destination -is [PSObject]
    $destinationIsDictionary = $Destination -is [Collections.IDictionary]

    $items = if ($sourceIsDictionary) { $Source.GetEnumerator() } else { $Source.PSObject.Properties }
    foreach ($p in $items) {
        if ($null -eq $Destination.PSObject.Properties.Item($p.Key)) {
            $Destination.PSObject.Properties.Add([Pester.Factory]::CreateNoteProperty($p.Key, $p.Value))
        }
        else {
            if ($p.Value -is [hashtable] -or $p.Value -is [PSObject]) {
                Merge-HashtableOrObject -Source $p.Value -Destination $Destination.($p.Key)
            }
            else {
                $Destination.($p.Key) = $p.Value
            }

        }
    }
}

function Write-PesterDebugMessage {
    [CmdletBinding(DefaultParameterSetName = "Default")]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateSet("Filter", "Skip", "Runtime", "RuntimeCore", "Mock", "MockCore", "Discovery", "DiscoveryCore", "SessionState", "Timing", "TimingCore", "Plugin", "PluginCore", "CodeCoverage")]
        [String[]] $Scope,
        [Parameter(Mandatory = $true, Position = 1, ParameterSetName = "Default")]
        [String] $Message,
        [Parameter(Mandatory = $true, Position = 1, ParameterSetName = "Lazy")]
        [ScriptBlock] $LazyMessage,
        [Parameter(Position = 2)]
        [Management.Automation.ErrorRecord] $ErrorRecord
    )

    if (-not $PesterPreference.Debug.WriteDebugMessages.Value) {
        throw "This should never happen. All calls to Write-PesterDebugMessage should be wrapped in `if` to avoid perfomace hit of allocating the message and calling the function. Inspect the call stack to know where this call came from. This can also happen if `$PesterPreference is different from the `$PesterPreference that utilities see because of incorrect scoping."
    }

    $messagePreference = $PesterPreference.Debug.WriteDebugMessagesFrom.Value
    $any = $false
    foreach ($s in $Scope) {
        if ($any) {
            break
        }
        foreach ($p in $messagePreference) {
            if ($s -like $p) {
                $any = $true
                break
            }
        }
    }

    if (-not $any) {
        return
    }

    $color = if ($null -ne $ErrorRecord) {
            "Red"
        }
        else {
            switch ($Scope) {
                "Filter" { "Cyan" }
                "Skip" { "Cyan" }
                "Runtime" { "DarkGray" }
                "RuntimeCore" { "Cyan" }
                "Mock" { "DarkYellow" }
                "Discovery" { "DarkMagenta" }
                "DiscoveryCore" { "DarkMagenta" }
                "SessionState" { "Gray" }
                "Timing" { "Gray" }
                "TimingCore" { "Gray" }
                "PluginCore" { "Blue" }
                "Plugin" { "Blue" }
                "CodeCoverage" { "Yellow" }
                default { "Cyan" }
            }
        }

    # this evaluates a message that is expensive to produce so we only evaluate it
    # when we know that we will write it. All messages could be provided as scriptblocks
    # but making a script block is slightly more expensive than making a string, so lazy approach
    # is used only when the message is obviously expensive, like folding the whole tree to get
    # count of found tests
    #TODO: remove this, it was clever but the best performance is achieved by putting an if around the whole call which is what I do in hopefully all places, that way the scriptblock nor the string are allocated
    if ($null -ne $LazyMessage) {
        $Message = (&$LazyMessage) -join "`n"
    }

    & $script:SafeCommands['Write-Host'] -ForegroundColor Black -BackgroundColor $color  "${Scope}: $Message "
    if ($null -ne $ErrorRecord) {
        & $script:SafeCommands['Write-Host'] -ForegroundColor Black -BackgroundColor $color "$ErrorRecord"
    }
}

function Fold-Block {
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        $Block,
        $OnBlock = {},
        $OnTest = {},
        $Accumulator
    )
    process {
        foreach ($b in $Block) {
            $Accumulator = & $OnBlock $Block $Accumulator
            foreach ($test in $Block.Tests) {
                $Accumulator = &$OnTest $test $Accumulator
            }

            foreach ($b in $Block.Blocks) {
                Fold-Block -Block $b -OnTest $OnTest -OnBlock $OnBlock -Accumulator $Accumulator
            }
        }
    }
}

function Fold-Container {
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        $Container,
        $OnContainer = {},
        $OnBlock = {},
        $OnTest = {},
        $Accumulator
    )

    process {
        foreach ($c in $Container) {
            $Accumulator = & $OnContainer $c $Accumulator
            foreach ($block in $c.Blocks) {
                Fold-Block -Block $block -OnBlock $OnBlock -OnTest $OnTest -Accumulator $Accumulator
            }
        }
    }
}

function Fold-Run {
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        $Run,
        $OnRun = {},
        $OnContainer = {},
        $OnBlock = {},
        $OnTest = {},
        $Accumulator
    )

    process {
        foreach ($r in $Run) {
            $Accumulator = & $OnRun $r $Accumulator
            foreach ($container in $r.Containers) {
                Fold-Container -Container $container -OnContainer $OnContainer -OnBlock $OnBlock -OnTest $OnTest -Accumulator $Accumulator
            }
        }
    }
}
# file src\Pester.Runtime.psm1

# instances
$flags = [System.Reflection.BindingFlags]'Instance,NonPublic'
$script:SessionStateInternalProperty = [System.Management.Automation.SessionState].GetProperty('Internal', $flags)
$script:ScriptBlockSessionStateInternalProperty = [System.Management.Automation.ScriptBlock].GetProperty('SessionStateInternal', $flags)
$script:ScriptBlockSessionStateProperty = [System.Management.Automation.ScriptBlock].GetProperty("SessionState", $flags)

if (notDefined PesterPreference) {
    $PesterPreference = [PesterConfiguration]::Default
}
else {
    $PesterPreference = [PesterConfiguration] $PesterPreference
}

$state = [PSCustomObject] @{
    # indicate whether or not we are currently
    # running in discovery mode se we can change
    # behavior of the commands appropriately
    Discovery           = $false

    CurrentBlock        = $null
    CurrentTest         = $null

    Plugin              = $null
    PluginConfiguration = $null
    Configuration       = $null

    TotalStopWatch      = $null
    UserCodeStopWatch   = $null
    FrameworkStopWatch  = $null
    Stack               = [Collections.Stack]@()

    ExpandName          = {
        param([string]$Name, [HashTable]$Data)

        $n = $Name
        foreach ($pair in $Data.GetEnumerator()) {
            $n = $n -replace "<$($pair.Key)>", "$($pair.Value)"
        }
        $n
    }
}

function Reset-TestSuiteState {
    # resets the module state to the default
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Runtime "Resetting all state to default."
    }
    $state.Discovery = $false

    $state.Plugin = $null
    $state.PluginConfiguration = $null
    $state.Configuration = $null

    $state.CurrentBlock = $null
    $state.CurrentTest = $null
    $state.Stack.Clear()
    Reset-TestSuiteTimer
}

function Reset-PerContainerState {
    param(
        [Parameter(Mandatory = $true)]
        $RootBlock
    )
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Runtime "Resetting per container state."
    }
    $state.CurrentBlock = $RootBlock
    $state.Stack.Clear()
}

function Find-Test {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [PSObject[]] $BlockContainer,
        $Filter,
        [Parameter(Mandatory = $true)]
        [Management.Automation.SessionState] $SessionState
    )

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope DiscoveryCore "Running just discovery."
    }
    $found = Discover-Test -BlockContainer $BlockContainer -Filter $Filter -SessionState $SessionState

    foreach ($f in $found) {
        ConvertTo-DiscoveredBlockContainer -Block $f
    }
}

function ConvertTo-DiscoveredBlockContainer {
    param (
        [Parameter(Mandatory = $true)]
        $Block
    )

    # takes a root block and converts it to a discovered block container
    # that we can publish from Find-Test, because keeping everything a block makes the internal
    # code simpler
    $container = $Block.BlockContainer
    $content = tryGetProperty $container Content
    $type = tryGetProperty $container Type

    # TODO: Add other properties that are relevant to found tests
    $b = $Block | &$SafeCommands['Select-Object'] -ExcludeProperty @(
        "Parent"
        "Name"
        "Tag"
        "First"
        "Last"
        "StandardOutput"
        "Passed"
        "Skipped"
        "Executed"
        "Path",
        "StartedAt",
        "Duration",
        "Aggregated*"
    ) -Property @(
        @{n = "Content"; e = { $content } }
        @{n = "Type"; e = { $type } },
        '*'
    )

    $b
}

function ConvertTo-ExecutedBlockContainer {
    param (
        [Parameter(Mandatory = $true)]
        $Block
    )

    foreach ($b in $Block) {
        [Pester.Container]::CreateFromBlock($b)
    }


}


# endpoint for adding a block that contains tests
# or other blocks
function New-Block {
    param (
        [Parameter(Mandatory = $true)]
        [String] $Name,
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock,
        [String[]] $Tag = @(),
        [HashTable] $FrameworkData = @{ },
        [Switch] $Focus,
        [String] $Id,
        [Switch] $Skip
    )

    # Switch-Timer -Scope Framework
    # $overheadStartTime = $state.FrameworkStopWatch.Elapsed
    # $blockStartTime = $state.UserCodeStopWatch.Elapsed

    $state.Stack.Push($Name)
    $path = @( <# Get full name #> $history = $state.Stack.ToArray(); [Array]::Reverse($history); $history)
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Runtime "Entering path $($path -join '.')"
    }

    $block = $null
    $previousBlock = $state.CurrentBlock

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope DiscoveryCore "Adding block $Name to discovered blocks"
    }

    # new block
    $block = [Pester.Block]::Create()
    $block.Name = $Name
    $block.Path = $Path
    $block.Tag = $Tag
    $block.ScriptBlock = $ScriptBlock
    $block.FrameworkData = $FrameworkData
    $block.Focus = $Focus
    $block.Id = $Id
    $block.Skip = $Skip

    # we attach the current block to the parent, and put it to the parent
    # lists
    $block.Parent = $state.CurrentBlock
    $state.CurrentBlock.Order.Add($block)
    $state.CurrentBlock.Blocks.Add($block)

    # and then make it the new current block
    $state.CurrentBlock = $block
    try {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope DiscoveryCore "Discovering in body of block $Name"
        }
        & $ScriptBlock
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope DiscoveryCore "Finished discovering in body of block $Name"
        }
    }
    finally {
        $state.CurrentBlock = $previousBlock
        $null = $state.Stack.Pop()
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Runtime "Left block $Name"
        }
    }
}

function Invoke-Block ($previousBlock) {
    Switch-Timer -Scope Framework
    $overheadStartTime = $state.FrameworkStopWatch.Elapsed
    $blockStartTime = $state.UserCodeStopWatch.Elapsed

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Runtime "Entering path $($path -join '.')"
    }

    foreach ($item in $previousBlock.Order) {
        if ('Test' -eq $item.ItemType) {
            Invoke-TestItem -Test $item
        }
        else {
            $block = $item
            $state.CurrentBlock = $block
            try {
                if (-not $block.ShouldRun) {
                    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                        Write-PesterDebugMessage -Scope Runtime "Block '$($block.Name)' is excluded from run, returning"
                    }
                    continue
                }

                $block.ExecutedAt = [DateTime]::Now
                $block.Executed = $true
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Runtime "Executing body of block '$($block.Name)'"
                }
                # TODO: no callbacks are provided because we are not transitioning between any states,
                # it might be nice to add a parameter to indicate that we run in the same scope
                # so we can avoid getting and setting the scope on scriptblock that already has that
                # scope, which is _potentially_ slow because of reflection, it would also allow
                # making the transition callbacks mandatory unless the parameter is provided
                $frameworkSetupResult = Invoke-ScriptBlock `
                    -OuterSetup @(
                    if ($block.First) { $state.Plugin.OneTimeBlockSetupStart }
                ) `
                    -Setup @( $state.Plugin.EachBlockSetupStart ) `
                    -Context @{
                    Context = @{
                        # context that is visible to plugins
                        Block         = $block
                        Test          = $null
                        Configuration = $state.PluginConfiguration
                    }
                }

                if ($frameworkSetupResult.Success) {
                    # this craziness makes one extra scope that is bound to the user session state
                    # and inside of it the Invoke-Block is called recursively. Ultimately this invokes all blocks
                    # in their own scope like this:
                    # & { # block 1
                    #     . block 1 setup
                    #     & { # block 2
                    #         . block 2 setup
                    #         & { # block 3
                    #             . block 3 setup
                    #             & { # test one
                    #                 . test 1 setup
                    #                 . test1
                    #             }
                    #         }
                    #     }
                    # }

                    $sb = {
                        param($______pester_invoke_block_parameters)
                        & $______pester_invoke_block_parameters.Invoke_Block -previousBlock $______pester_invoke_block_parameters.Block
                    }

                    $sessionStateInternal = $script:ScriptBlockSessionStateInternalProperty.GetValue($block.ScriptBlock, $null)
                    $script:ScriptBlockSessionStateInternalProperty.SetValue($sb, $SessionStateInternal)

                    $result = Invoke-ScriptBlock `
                        -ScriptBlock $sb `
                        -OuterSetup $( if (-not (Is-Discovery) -and (-not $Block.Skip)) {
                            @($previousBlock.EachBlockSetup) + @($block.OneTimeTestSetup)
                        }) `
                        -OuterTeardown $( if (-not (Is-Discovery) -and (-not $Block.Skip)) {
                            @($block.OneTimeTestTeardown) + @($previousBlock.EachBlockTeardown)
                        } ) `
                        -Context @{
                        ______pester_invoke_block_parameters = @{
                            Invoke_Block = ${function:Invoke-Block}
                            Block        = $block
                        }
                    } `
                        -ReduceContextToInnerScope `
                        -MoveBetweenScopes `
                        -Configuration $state.Configuration

                    $block.OwnPassed = $result.Success
                    $block.StandardOutput = $result.StandardOutput

                    $block.ErrorRecord = $result.ErrorRecord
                    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                        Write-PesterDebugMessage -Scope Runtime "Finished executing body of block $Name"
                    }
                }

                $frameworkEachBlockTeardowns = @($state.Plugin.EachBlockTeardownEnd )
                $frameworkOneTimeBlockTeardowns = @( if ($block.Last) { $state.Plugin.OneTimeBlockTeardownEnd } )
                # reverse the teardowns so they run in opposite order to setups
                [Array]::Reverse($frameworkEachBlockTeardowns)
                [Array]::Reverse($frameworkOneTimeBlockTeardowns)


                # setting those values here so they are available for the teardown
                # BUT they are then set again at the end of the block to make them accurate
                # so the value on the screen vs the value in the object is slightly different
                # with the value in the result being the correct one
                $block.UserDuration = $state.UserCodeStopWatch.Elapsed - $blockStartTime
                $block.FrameworkDuration = $state.FrameworkStopWatch.Elapsed - $overheadStartTime
                $frameworkTeardownResult = Invoke-ScriptBlock `
                    -Teardown $frameworkEachBlockTeardowns `
                    -OuterTeardown $frameworkOneTimeBlockTeardowns `
                    -Context @{
                    Context = @{
                        # context that is visible to plugins
                        Block         = $block
                        Test          = $null
                        Configuration = $state.PluginConfiguration
                    }
                }

                if (-not $frameworkSetupResult.Success -or -not $frameworkTeardownResult.Success) {
                    Assert-Success -InvocationResult @($frameworkSetupResult, $frameworkTeardownResult) -Message "Framework failed"
                }
            }
            finally {
                $state.CurrentBlock = $previousBlock
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Runtime "Left block $Name"
                }
                $block.UserDuration = $state.UserCodeStopWatch.Elapsed - $blockStartTime
                $block.FrameworkDuration = $state.FrameworkStopWatch.Elapsed - $overheadStartTime
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Timing "Block duration $($block.UserDuration.TotalMilliseconds)ms"
                    Write-PesterDebugMessage -Scope Timing "Block framework duration $($block.FrameworkDuration.TotalMilliseconds)ms"
                    Write-PesterDebugMessage -Scope Runtime "Leaving path $($path -join '.')"
                }
            }
        }
    }
}

# endpoint for adding a test
function New-Test {
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [String] $Name,
        [Parameter(Mandatory = $true, Position = 1)]
        [ScriptBlock] $ScriptBlock,
        [String[]] $Tag = @(),
        [System.Collections.IDictionary] $Data = @{ },
        [String] $Id,
        [Switch] $Focus,
        [Switch] $Skip
    )

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope DiscoveryCore "Entering test $Name"
    }

    if ($state.CurrentBlock.IsRoot) {
        throw "Test cannot be directly in the root."
    }

    # avoid managing state by not pushing to the stack only to pop out in finally
    # simply concatenate the arrays
    $path = @(<# Get full name #> $history = $state.Stack.ToArray(); [Array]::Reverse($history); $history + $name)

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Runtime "Entering path $($path -join '.')"
    }

    $test = [Pester.Test]::Create()
    $test.Id = $Id
    $test.ScriptBlock = $ScriptBlock
    $test.Name = $Name
    $test.Path = $path
    $test.Tag = $Tag
    $test.Focus = $Focus
    $test.Skip = $Skip
    $test.Data = $Data
    $test.FrameworkData.Runtime.Phase = 'Discovery'

    # add test to current block lists
    $state.CurrentBlock.Tests.Add($Test)
    $state.CurrentBlock.Order.Add($Test)

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope DiscoveryCore "Added test '$Name'"
    }
}

function Invoke-TestItem {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        $Test
    )
    # keep this at the top so we report as much time
    # of the actual test run as possible
    $overheadStartTime = $state.FrameworkStopWatch.Elapsed
    $testStartTime = $state.UserCodeStopWatch.Elapsed
    Switch-Timer -Scope Framework

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Runtime "Entering test $($Test.Name)"
    }

    try {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Runtime "Entering path $($Test.Path -join '.')"
        }

        $Test.FrameworkData.Runtime.Phase = 'Execution'
        Set-CurrentTest -Test $Test

        if (-not $Test.ShouldRun) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Runtime "Test is excluded from run, returning"
            }
            return
        }

        $Test.ExecutedAt = [DateTime]::Now
        $Test.Executed = $true

        $Test.ExpandedName = & $state.ExpandName -Name $Test.Name -Data $Test.Data

        $block = $Test.Block
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Runtime "Running test '$($Test.Name)'."
        }

        # no callbacks are provided because we are not transitioning between any states
        $frameworkSetupResult = Invoke-ScriptBlock `
            -OuterSetup @(
            if ($Test.First) { $state.Plugin.OneTimeTestSetupStart }
        ) `
            -Setup @( $state.Plugin.EachTestSetupStart ) `
            -Context @{
            Context = @{
                # context visible to Plugins
                Block         = $block
                Test          = $Test
                Configuration = $state.PluginConfiguration
            }
        }

        if ($Test.Skip) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                $path = $Test.Path -join '.'
                Write-PesterDebugMessage -Scope Skip "($path) Test is skipped."
            }

            # setting the test as passed here, this is by choice
            # skipped test are ultimately passed tests that were not executed
            # I expect that if someone works with the raw result object and
            # filters on .Passed -eq $false they should get the count of failed tests
            # not failed + skipped. It might be wise to revert those booleans to "enum"
            # because they are exclusive, but keeping the info in the object stupid
            # and aggregating it as needed was also a design choice
            $Test.Passed = $true
            $Test.Skipped = $true
            $Test.FrameworkData.Runtime.ExecutionStep = 'Finished'
        }
        else {

            if ($frameworkSetupResult.Success) {
                # TODO: use PesterContext as the name, or some other better reserved name to avoid conflicts
                $context = @{
                    # context visible in test
                    Context = [PSCustomObject]@{ Name = $t.Name; Path = $t.Path }
                }

                # user provided data are merged with Pester provided context
                # Merge-Hashtable -Source $Test.Data -Destination $context
                foreach ($p in $Test.Data.GetEnumerator()) {
                    # only add non existing keys so in case of conflict
                    # the framework name wins, as if we had explicit parameters
                    # on a scriptblock, then the parameter would also win
                    if (-not $context.ContainsKey($p.Key)) {
                        $context.Add($p.Key, $p.Value)
                    }
                }

                # recurse up Recurse-Up $Block { param ($b) $b.EachTestSetup }
                $i = $Block
                $eachTestSetups = while ($null -ne $i) {
                    $i.EachTestSetup
                    $i = $i.Parent
                }

                # recurse up Recurse-Up $Block { param ($b) $b.EachTestTeardown }
                $i = $Block
                $eachTestTeardowns = while ($null -ne $i) {
                    $i.EachTestTeardown
                    $i = $i.Parent
                }

                $result = Invoke-ScriptBlock `
                    -Setup @(
                    if ($null -ne $eachTestSetups -and 0 -lt @($eachTestSetups).Count) {
                        # we collect the child first but want the parent to run first
                        [Array]::Reverse($eachTestSetups)
                        @( { $Test.FrameworkData.Runtime.ExecutionStep = 'EachTestSetup' }) + @($eachTestSetups)
                    }
                    # setting the execution info here so I don't have to invoke change the
                    # contract of Invoke-ScriptBlock to accept multiple -ScriptBlock, because
                    # that is not needed, and would complicate figuring out in which session
                    # state we should run.
                    # this should run every time.
                    { $Test.FrameworkData.Runtime.ExecutionStep = 'Test' }
                ) `
                    -ScriptBlock $Test.ScriptBlock `
                    -Teardown @(
                    if ($null -ne $eachTestTeardowns -and 0 -lt @($eachTestTeardowns).Count) {
                        @( { $Test.FrameworkData.Runtime.ExecutionStep = 'EachTestTeardown' }) + @($eachTestTeardowns)
                    } ) `
                    -Context $context `
                    -ReduceContextToInnerScope `
                    -MoveBetweenScopes `
                    -NoNewScope `
                    -Configuration $state.Configuration

                $Test.FrameworkData.Runtime.ExecutionStep = 'Finished'

                if ($Result.ErrorRecord.FullyQualifiedErrorId -eq 'PesterTestSkipped') {
                    #Same logic as when setting a test block to skip
                    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                        $path = $Test.Path -join '.'
                        Write-PesterDebugMessage -Scope Skip "($path) Test is skipped."
                    }
                    $Test.Passed = $true
                    $Test.Skipped = $true
                } else {
                    $Test.Passed = $result.Success
                }

                $Test.StandardOutput = $result.StandardOutput
                $Test.ErrorRecord = $result.ErrorRecord
            }
        }


        # setting those values here so they are available for the teardown
        # BUT they are then set again at the end of the block to make them accurate
        # so the value on the screen vs the value in the object is slightly different
        # with the value in the result being the correct one
        $Test.UserDuration = $state.UserCodeStopWatch.Elapsed - $testStartTime
        $Test.FrameworkDuration = $state.FrameworkStopWatch.Elapsed - $overheadStartTime

        $frameworkEachTestTeardowns = @( $state.Plugin.EachTestTeardownEnd )
        $frameworkOneTimeTestTeardowns = @(if ($Test.Last) { $state.Plugin.OneTimeTestTeardownEnd })
        [array]::Reverse($frameworkEachTestTeardowns)
        [array]::Reverse($frameworkOneTimeTestTeardowns)

        $frameworkTeardownResult = Invoke-ScriptBlock `
            -Teardown $frameworkEachTestTeardowns `
            -OuterTeardown $frameworkOneTimeTestTeardowns `
            -Context @{
            Context = @{
                # context visible to Plugins
                Test          = $Test
                Block         = $block
                Configuration = $state.PluginConfiguration
            }
        }

        if (-not $frameworkTeardownResult.Success -or -not $frameworkTeardownResult.Success) {
            throw $frameworkTeardownResult.ErrorRecord[-1]
        }

    }
    finally {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Runtime "Leaving path $($Test.Path -join '.')"
        }
        $state.CurrentTest = $null
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Runtime "Left test $($Test.Name)"
        }

        # keep this at the end so we report even the test teardown in the framework overhead for the test
        $Test.UserDuration = $state.UserCodeStopWatch.Elapsed - $testStartTime
        $Test.FrameworkDuration = $state.FrameworkStopWatch.Elapsed - $overheadStartTime
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Timing -Message "Test duration $($Test.UserDuration.TotalMilliseconds)ms"
            Write-PesterDebugMessage -Scope Timing -Message "Framework duration $($Test.FrameworkDuration.TotalMilliseconds)ms"
        }
    }
}

# endpoint for adding a setup for each test in the block
function New-EachTestSetup {
    param (
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock
    )

    if (Is-Discovery) {
        $state.CurrentBlock.EachTestSetup = $ScriptBlock
    }
}

# endpoint for adding a teardown for each test in the block
function New-EachTestTeardown {
    param (
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock
    )

    if (Is-Discovery) {
        $state.CurrentBlock.EachTestTeardown = $ScriptBlock
    }
}

# endpoint for adding a setup for all tests in the block
function New-OneTimeTestSetup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock
    )

    if (Is-Discovery) {
        $state.CurrentBlock.OneTimeTestSetup = $ScriptBlock
    }
}

# endpoint for adding a teardown for all tests in the block
function New-OneTimeTestTeardown {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock
    )
    if (Is-Discovery) {
        $state.CurrentBlock.OneTimeTestTeardown = $ScriptBlock
    }
}

# endpoint for adding a setup for each block in the current block
function New-EachBlockSetup {
    param (
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock
    )
    if (Is-Discovery) {
        $state.CurrentBlock.EachBlockSetup = $ScriptBlock
    }
}

# endpoint for adding a teardown for each block in the current block
function New-EachBlockTeardown {
    param (
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock
    )
    if (Is-Discovery) {
        $state.CurrentBlock.EachBlockTeardown = $ScriptBlock
    }
}

# endpoint for adding a setup for all blocks in the current block
function New-OneTimeBlockSetup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock
    )
    if (Is-Discovery) {
        $state.CurrentBlock.OneTimeBlockSetup = $ScriptBlock
    }
}

# endpoint for adding a teardown for all clocks in the current block
function New-OneTimeBlockTeardown {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock
    )
    if (Is-Discovery) {
        $state.CurrentBlock.OneTimeBlockTeardown = $ScriptBlock
    }
}

function Get-CurrentBlock {
    [CmdletBinding()]
    param()

    $state.CurrentBlock
}

function Get-CurrentTest {
    [CmdletBinding()]
    param()

    $state.CurrentTest
}

function Set-CurrentBlock {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        $Block
    )

    $state.CurrentBlock = $Block
}


function Set-CurrentTest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        $Test
    )

    $state.CurrentTest = $Test
}


function Is-Discovery {
    $state.Discovery
}

function Discover-Test {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [PSObject[]] $BlockContainer,
        [Parameter(Mandatory = $true)]
        [Management.Automation.SessionState] $SessionState,
        $Filter
    )
    $totalDiscoveryDuration = [Diagnostics.Stopwatch]::StartNew()

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Discovery -Message "Starting test discovery in $(@($BlockContainer).Length) test containers."
    }

    $steps = $state.Plugin.DiscoveryStart
    if ($null -ne $steps -and 0 -lt @($steps).Count) {
        Invoke-PluginStep -Plugins $state.Plugin -Step DiscoveryStart -Context @{
            BlockContainers = $BlockContainer
            Configuration   = $state.PluginConfiguration
        } -ThrowOnFailure
    }

    $state.Discovery = $true
    $found = foreach ($container in $BlockContainer) {
        $perContainerDiscoveryDuration = [Diagnostics.Stopwatch]::StartNew()

        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Discovery "Discovering tests in $($container.Item)"
        }

        # this is a block object that we add so we can capture
        # OneTime* and Each* setups, and capture multiple blocks in a
        # container
        $root = [Pester.Block]::Create()
        $root.Name = "Root"
        $root.IsRoot = $true
        $root.Path = "Path"

        $root.First = $true
        $root.Last = $true

        Reset-PerContainerState -RootBlock $root

        $steps = $state.Plugin.ContainerDiscoveryStart
        if ($null -ne $steps -and 0 -lt @($steps).Count) {
            Invoke-PluginStep -Plugins $state.Plugin -Step ContainerDiscoveryStart -Context @{
                BlockContainer = $container
                Configuration  = $state.PluginConfiguration
            } -ThrowOnFailure
        }

        $null = Invoke-BlockContainer -BlockContainer $container -SessionState $SessionState

        [PSCustomObject] @{
            Container = $container
            Block     = $root
        }

        $steps = $state.Plugin.ContainerDiscoveryEnd
        if ($null -ne $steps -and 0 -lt @($steps).Count) {
            Invoke-PluginStep -Plugins $state.Plugin -Step ContainerDiscoveryEnd -Context @{
                BlockContainer = $container
                Block          = $root
                Duration       = $perContainerDiscoveryDuration.Elapsed
                Configuration  = $state.PluginConfiguration
            } -ThrowOnFailure
        }

        $root.DiscoveryDuration = $perContainerDiscoveryDuration.Elapsed
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Discovery -LazyMessage { "Found $(@(View-Flat -Block $root).Count) tests in $([int]$root.DiscoveryDuration.TotalMilliseconds) ms" }
            Write-PesterDebugMessage -Scope DiscoveryCore "Discovery done in this container."
        }
    }

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Discovery "Processing discovery result objects, to set root, parents, filters etc."
    }

    # focusing is removed from the public api
    # # if any tests / block in the suite have -Focus parameter then all filters are disregarded
    # # and only those tests / blocks should run
    # $focusedTests = [System.Collections.Generic.List[Object]]@()
    # foreach ($f in $found) {
    #     Fold-Container -Container $f.Block `
    #         -OnTest {
    #             # add all focused tests
    #             param($t)
    #             if ($t.Focus) {
    #                 $focusedTests.Add("$(if($null -ne $t.ScriptBlock.File) { $t.ScriptBlock.File } else { $t.ScriptBlock.Id }):$($t.ScriptBlock.StartPosition.StartLine)")
    #             }
    #         } `
    #         -OnBlock {
    #             param($b) if ($b.Focus) {
    #                 # add all tests in the current block, no matter if they are focused or not
    #                 Fold-Block -Block $b -OnTest {
    #                     param ($t)
    #                     $focusedTests.Add("$(if($null -ne $t.ScriptBlock.File) { $t.ScriptBlock.File } else { $t.ScriptBlock.Id }):$($t.ScriptBlock.StartPosition.StartLine)")
    #                 }
    #             }
    #         }
    # }

    # if ($focusedTests.Count -gt 0) {
    #     if ($PesterPreference.Debug.WriteDebugMessages.Value) {
    #         Write-PesterDebugMessage -Scope Discovery  -LazyMessage { "There are some ($($focusedTests.Count)) focused tests '$($(foreach ($p in $focusedTests) { $p -join "." }) -join ",")' running just them." }
    #     }
    #     $Filter =  New-FilterObject -Line $focusedTests
    # }

    foreach ($f in $found) {
        # this takes non-trivial time, measure how long it takes and add it to the discovery
        # so we get more accurate total time
        $sw = [System.Diagnostics.Stopwatch]::StartNew()
        PostProcess-DiscoveredBlock -Block $f.Block -Filter $Filter -BlockContainer $f.Container -RootBlock $f.Block
        $overhead = $sw.Elapsed
        $f.Block.DiscoveryDuration += $overhead
        # Write-Host "disc $($f.Block.DiscoveryDuration.totalmilliseconds) $($overhead.totalmilliseconds) ms" #TODO
        $f.Block
    }

    $steps = $state.Plugin.DiscoveryEnd
    if ($null -ne $steps -and 0 -lt @($steps).Count) {
        Invoke-PluginStep -Plugins $state.Plugin -Step DiscoveryEnd -Context @{
            BlockContainers = $found.Block
            AnyFocusedTests = $focusedTests.Count -gt 0
            FocusedTests    = $focusedTests
            Duration        = $totalDiscoveryDuration.Elapsed
            Configuration   = $state.PluginConfiguration
        } -ThrowOnFailure
    }

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Discovery "Test discovery finished."
    }
}

function Run-Test {
    param (
        [Parameter(Mandatory = $true)]
        [PSObject[]] $Block,
        [Parameter(Mandatory = $true)]
        [Management.Automation.SessionState] $SessionState
    )

    $state.Discovery = $false
    foreach ($rootBlock in $Block) {
        $blockStartTime = $state.UserCodeStopWatch.Elapsed
        $overheadStartTime = $state.FrameworkStopWatch.Elapsed
        Switch-Timer -Scope Framework

        if (-not $rootBlock.ShouldRun) {
            ConvertTo-ExecutedBlockContainer -Block $rootBlock
            continue
        }
        # this resets the timers so keep that before measuring the time
        Reset-PerContainerState -RootBlock $rootBlock

        $rootBlock.Executed = $true
        $rootBlock.ExecutedAt = [DateTime]::now

        $steps = $state.Plugin.ContainerRunStart
        if ($null -ne $steps -and 0 -lt @($steps).Count) {
            Invoke-PluginStep -Plugins $state.Plugin -Step ContainerRunStart -Context @{
                Block         = $rootBlock
                Configuration = $state.PluginConfiguration
            } -ThrowOnFailure
        }

        try {
            # if ($null -ne $rootBlock.OneTimeBlockSetup) {
            #    throw "One time block setup is not supported in root (directly in the block container)."
            #}

            # if ($null -ne $rootBlock.EachBlockSetup) {
            #     throw "Each block setup is not supported in root (directly in the block container)."
            # }

            if ($null -ne $rootBlock.EachTestSetup) {
                throw "Each test setup is not supported in root (directly in the block container)."
            }

            if (
                $null -ne $rootBlock.EachTestTeardown `
                    -or $null -ne $rootBlock.OneTimeTestTeardown #`
                #-or $null -ne $rootBlock.OneTimeBlockTeardown `
                #-or $null -ne $rootBlock.EachBlockTeardown `
            ) {
                throw "Teardowns are not supported in root (directly in the block container)."
            }

            $rootSetupResult = $null
            if ($null -ne $rootBlock.OneTimeTestSetup) {
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Runtime "One time setup from root block is executing"
                }

                $rootSetupResult = Invoke-ScriptBlock `
                    -OuterSetup @(
                    # if ($rootBlock.ShouldRun) {
                    # todo: should this always run?
                    $rootBlock.OneTimeTestSetup
                    # }
                ) `
                    -ReduceContextToInnerScope `
                    -MoveBetweenScopes
            }


            if ($null -ne $rootSetupResult -and -not $rootSetupResult.Success) {
                & $SafeCommands["Write-Error"] -ErrorRecord $rootSetupResult.ErrorRecord[0] -ErrorAction 'Stop'
            }

            $null = Invoke-Block -previousBlock $rootBlock

            $rootBlock.OwnPassed = $true
        }
        catch {
            $rootBlock.OwnPassed = $false
            $rootBlock.ErrorRecord.Add($_)
        }

        PostProcess-ExecutedBlock -Block $rootBlock
        $result = ConvertTo-ExecutedBlockContainer -Block $rootBlock
        $result.FrameworkDuration = $state.FrameworkStopWatch.Elapsed - $overheadStartTime
        $result.UserDuration = $state.UserCodeStopWatch.Elapsed - $blockStartTime

        $steps = $state.Plugin.ContainerRunEnd
        if ($null -ne $steps -and 0 -lt @($steps).Count) {
            Invoke-PluginStep -Plugins $state.Plugin -Step ContainerRunEnd -Context @{
                Result        = $result
                Block         = $rootBlock
                Configuration = $state.PluginConfiguration
            } -ThrowOnFailure
        }

        # set this again so the plugins have some data but that we also include the plugin invocation to the
        # overall time to keep the actual timing correct
        $result.FrameworkDuration = $state.FrameworkStopWatch.Elapsed - $overheadStartTime
        $result.UserDuration = $state.UserCodeStopWatch.Elapsed - $blockStartTime
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Timing "Container duration $($result.UserDuration.TotalMilliseconds)ms"
            Write-PesterDebugMessage -Scope Timing "Container framework duration $($result.FrameworkDuration.TotalMilliseconds)ms"
        }

        $result
    }
}

function Invoke-PluginStep {
    # [CmdletBinding()]
    param (
        [PSObject[]] $Plugins,
        [Parameter(Mandatory)]
        [ValidateSet('Start', 'DiscoveryStart', 'ContainerDiscoveryStart', 'BlockDiscoveryStart', 'TestDiscoveryStart', 'TestDiscoveryEnd', 'BlockDiscoveryEnd', 'ContainerDiscoveryEnd', 'DiscoveryEnd', 'RunStart', 'ContainerRunStart', 'OneTimeBlockSetupStart', 'EachBlockSetupStart', 'OneTimeTestSetupStart', 'EachTestSetupStart', 'EachTestTeardownEnd', 'OneTimeTestTeardownEnd', 'EachBlockTeardownEnd', 'OneTimeBlockTeardownEnd', 'ContainerRunEnd', 'RunEnd', 'End')]
        [String] $Step,
        $Context = @{ },
        [Switch] $ThrowOnFailure
    )

    # there are actually two ways to invoke plugin steps, this unified cmdlet that allows us to run the steps
    # in isolation, and then another where we are using Invoke-ScriptBlock directly when we need the plugin to run
    # for example as a teardown step of a test.

    # switch-timer framework
    $state.UserCodeStopWatch.Stop()
    $state.FrameworkStopWatch.Start()

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        $sw = [Diagnostics.Stopwatch]::StartNew()
    }

    $pluginsWithGivenStep = @(foreach ($p in $Plugins) { if ($null -ne $p.$Step) { $p } })

    if ($null -eq $pluginsWithGivenStep -or 0 -eq @($pluginsWithGivenStep).Count) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope PluginCore "No plugins with step $Step were provided"
        }
        return
    }

    # this is end step, we should run all steps no matter if some failed, and we should run them in opposite direction
    # only do this if there is more than 1, to avoid the "expensive" -like check and reverse
    $isEndStep = 1 -lt $pluginsWithGivenStep.Count -and $Step -like "*End"
    if (-not $isEndStep) {
        [Array]::Reverse($pluginsWithGivenStep)
    }

    $err = [Collections.Generic.List[Management.Automation.ErrorRecord]]@()
    $failed = $false
    # the plugins expect -Context and then the actual context in it
    # this was a choice at the start of the project to make it easy to see
    # what is available, not sure if a good choice
    $ctx = @{
        Context = $Context
    }
    $standardOutput =
    foreach ($p in $pluginsWithGivenStep) {
        if ($failed -and -not $isEndStep) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Plugin "Skipping $($p.Name) step $Step because some previous plugin failed"
            }
            continue
        }

        try {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                $stepSw = [Diagnostics.Stopwatch]::StartNew()
                $hasContext = 0 -lt $Context.Count
                $c = if ($hasContext) { $Context | & $script:SafeCommands['Out-String'] }
                Write-PesterDebugMessage -Scope Plugin "Running $($p.Name) step $Step $(if ($hasContext) { "with context: $c" } else { "without any context"})"
            }

            do {
                & $p.$Step @ctx
            } while ($false)

            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Plugin "Success $($p.Name) step $Step in $($stepSw.ElapsedMilliseconds) ms"
            }
        }
        catch {
            $failed = $true
            $err.Add($_)
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Plugin "Failed $($p.Name) step $Step in $($stepSw.ElapsedMilliseconds) ms" -ErrorRecord $_
            }
        }
    }

    if ($ThrowOnFailure) {
        if ($failed) {
            $r = [Pester.InvocationResult]::Create((-not $failed), $err, $standardOutput)
            Assert-Success $r -Message "Invoking step $step failed"
        }
        else {
            # do nothing, especially don't create or return the result object
        }
    }
    else {
        $r = [Pester.InvocationResult]::Create((-not $failed), $err, $standardOutput)
        return $r
    }
}

function Assert-Success {
    # [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [PSObject[]] $InvocationResult,
        [String] $Message = "Invocation failed"
    )

    $rc = 0
    $anyFailed = $false
    foreach ($r in $InvocationResult) {
        $ec = 0
        if ($null -ne $r.ErrorRecord -and $r.ErrorRecord.Length -gt 0) {
            & $SafeCommands["Write-Host"] -ForegroundColor Red "Result $($rc++):"
            $anyFailed = $true
            foreach ($e in $r.ErrorRecord) {
                & $SafeCommands["Write-Host"] -ForegroundColor Red "Error $($ec++):"
                & $SafeCommands["Write-Host"] -ForegroundColor Red (Out-String -InputObject $e )
                & $SafeCommands["Write-Host"] -ForegroundColor Red (Out-String -InputObject $e.ScriptStackTrace)
            }
        }

        if ($anyFailed) {
            throw $Message
        }
    }
}

function Invoke-ScriptBlock {
    param(
        [ScriptBlock] $ScriptBlock,
        [ScriptBlock[]] $OuterSetup,
        [ScriptBlock[]] $Setup,
        [ScriptBlock[]] $Teardown,
        [ScriptBlock[]] $OuterTeardown,
        $Context = @{ },
        # define data to be shared in only in the inner scope where e.g eachTestSetup + test run but not
        # in the scope where OneTimeTestSetup runs, on the other hand, plugins want context
        # in all scopes
        [Switch] $ReduceContextToInnerScope,
        # # setup, body and teardown will all run (be-dotsourced into)
        # # the same scope
        # [Switch] $SameScope,
        # will dot-source the wrapper scriptblock instead of invoking it
        # so in combination with the SameScope switch we are effectively
        # running the code in the current scope
        [Switch] $NoNewScope,
        [Switch] $MoveBetweenScopes,
        [ScriptBlock] $OnUserScopeTransition = $null,
        [ScriptBlock] $OnFrameworkScopeTransition = $null,
        $Configuration
    )

    # filter nulls, inlined to avoid overhead of combineNonNull and selectNonNull
    $OuterSetup = if ($null -ne $OuterSetup -and 0 -lt $OuterSetup.Count) {
        foreach ($i in $OuterSetup) {
            if ($null -ne $i) {
                $i
            }
        }
    }

    $Setup = if ($null -ne $Setup -and 0 -lt $Setup.Count) {
        foreach ($i in $Setup) {
            if ($null -ne $i) {
                $i
            }
        }
    }

    $Teardown = if ($null -ne $Teardown -and 0 -lt $Teardown.Count) {
        foreach ($i in $Teardown) {
            if ($null -ne $i) {
                $i
            }
        }
    }

    $OuterTeardown = if ($null -ne $OuterTeardown -and 0 -lt $OuterTeardown.Count) {
        foreach ($i in $OuterTeardown) {
            if ($null -ne $i) {
                $i
            }
        }
    }





    # this is what the code below does
    # . $OuterSetup
    # & {
    #     try {
    #       # import setup to scope
    #       . $Setup
    #       # executed the test code in the same scope
    #       . $ScriptBlock
    #     } finally {
    #       . $Teardown
    #     }
    # }
    # . $OuterTeardown


    $wrapperScriptBlock = {
        # THIS RUNS (MOST OF THE TIME) IN USER SCOPE, BE CAREFUL WHAT YOU PUBLISH AND CONSUME!
        param($______parameters)

        if (-not $______parameters.NoNewScope) {
            # a child runner that will not create a new scope will force itself into the current scope
            # and overwrite our params in the inner scope (denoted by & { below), keep a second reference to it
            # so we can use it for Teardowns and to forward errors that happened after test teardown
            $______parametersForward = $______parameters
        }



        try {
            if ($______parameters.ContextInOuterScope) {
                $______outerSplat = $______parameters.Context
                if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Setting context variables" }
                foreach ($______current in $______outerSplat.GetEnumerator()) {
                    if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Setting context variable '$($______current.Key)' with value '$($______current.Value)'" }
                    $ExecutionContext.SessionState.PSVariable.Set($______current.Key, $______current.Value)
                }
                $______current = $null
            }
            else {
                $______outerSplat = @{ }
            }

            if ($null -ne $______parameters.OuterSetup -and $______parameters.OuterSetup.Length -gt 0) {
                if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Running outer setups" }
                foreach ($______current in $______parameters.OuterSetup) {
                    if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Running outer setup { $______current }" }
                    $______parameters.CurrentlyExecutingScriptBlock = $______current
                    . $______current @______outerSplat
                }
                $______current = $null
                $______parameters.OuterSetup = $null
                if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Done running outer setups" }
            }
            else {
                if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "There are no outer setups" }
            }

            & {
                try {

                    if (-not $______parameters.ContextInOuterScope) {
                        $______innerSplat = $______parameters.Context
                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Setting context variables" }
                        foreach ($______current in $______innerSplat.GetEnumerator()) {
                            if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Setting context variable '$ ($______current.Key)' with value '$($______current.Value)'" }
                            $ExecutionContext.SessionState.PSVariable.Set($______current.Key, $______current.Value)
                        }
                        $______current = $null
                    }
                    else {
                        $______innerSplat = $______outerSplat
                    }

                    if ($null -ne $______parameters.Setup -and $______parameters.Setup.Length -gt 0) {
                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Running inner setups" }
                        foreach ($______current in $______parameters.Setup) {
                            if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Running inner setup { $______current }" }
                            $______parameters.CurrentlyExecutingScriptBlock = $______current
                            . $______current @______innerSplat
                        }
                        $______current = $null
                        $______parameters.Setup = $null
                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Done running inner setups" }
                    }
                    else {
                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "There are no inner setups" }
                    }

                    if ($null -ne $______parameters.ScriptBlock) {
                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Running scriptblock { $($______parameters.ScriptBlock) }" }
                        $______parameters.CurrentlyExecutingScriptBlock = $______parameters.ScriptBlock
                        . $______parameters.ScriptBlock @______innerSplat

                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Done running scriptblock" }
                    }
                    else {
                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "There is no scriptblock to run" }
                    }
                }
                catch {
                    $______parameters.ErrorRecord.Add($_)
                    if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Fail running setups or scriptblock" -ErrorRecord $_ }
                }
                finally {
                    if ($null -ne $______parameters.Teardown -and $______parameters.Teardown.Length -gt 0) {
                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Running inner teardowns" }
                        foreach ($______current in $______parameters.Teardown) {
                            try {
                                if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Running inner teardown { $______current }" }
                                $______parameters.CurrentlyExecutingScriptBlock = $______current
                                . $______current @______innerSplat
                                if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Done running inner teardown" }
                            }
                            catch {
                                $______parameters.ErrorRecord.Add($_)
                                if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Fail running inner teardown" -ErrorRecord $_ }
                            }
                        }
                        $______current = $null

                        # nulling this variable is important when we run without new scope
                        # then $______parameters.Teardown remains set and EachBlockTeardown
                        # runs twice
                        $______parameters.Teardown = $null
                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Done running inner teardowns" }
                    }
                    else {
                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "There are no inner teardowns" }
                    }
                }
            }
        }
        finally {

            if ($null -ne $______parameters.OuterTeardown -and $______parameters.OuterTeardown.Length -gt 0) {
                if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Running outer teardowns" }
                foreach ($______current in $______parameters.OuterTeardown) {
                    try {
                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Running outer teardown { $______current }" }
                        $______parameters.CurrentlyExecutingScriptBlock = $______current
                        . $______current @______outerSplat
                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Done running outer teardown" }
                    }
                    catch {
                        if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Fail running outer teardown" -ErrorRecord $_ }
                        $______parameters.ErrorRecord.Add($_)
                    }
                }
                $______parameters.OuterTeardown = $null
                $______current = $null
                if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "Done running outer teardowns" }
            }
            else {
                if ($______parameters.EnableWriteDebug) { &$______parameters.WriteDebug "There are no outer teardowns" }
            }

            if ($______parameters.NoNewScope -and $ExecutionContext.SessionState.PSVariable.GetValue('______parametersForward')) {
                $______parameters = $______parametersForward
            }
        }
    }

    if ($MoveBetweenScopes -and $null -ne $ScriptBlock) {
        $SessionStateInternal = $script:ScriptBlockSessionStateInternalProperty.GetValue($ScriptBlock, $null)
        # attach the original session state to the wrapper scriptblock
        # making it invoke in the same scope as $ScriptBlock
        $script:ScriptBlockSessionStateInternalProperty.SetValue($wrapperScriptBlock, $SessionStateInternal, $null)
    }

    $writeDebug = if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        {
            param($Message, [Management.Automation.ErrorRecord] $ErrorRecord)
            Write-PesterDebugMessage -Scope "RuntimeCore" $Message -ErrorRecord $ErrorRecord
        }
    }

    #$break = $true
    $err = $null
    try {
        $parameters = @{
            ScriptBlock                   = $ScriptBlock
            OuterSetup                    = $OuterSetup
            Setup                         = $Setup
            Teardown                      = $Teardown
            OuterTeardown                 = $OuterTeardown
            CurrentlyExecutingScriptBlock = $null
            ErrorRecord                   = [Collections.Generic.List[Management.Automation.ErrorRecord]]@()
            Context                       = $Context
            ContextInOuterScope           = -not $ReduceContextToInnerScope
            EnableWriteDebug              = $PesterPreference.Debug.WriteDebugMessages.Value
            WriteDebug                    = $writeDebug
            Configuration                 = $Configuration
            NoNewScope                    = $NoNewScope
        }

        # here we are moving into the user scope if the provided
        # scriptblock was bound to user scope, so we want to take some actions
        # typically switching between user and framework timer. There are still tiny pieces of
        # framework code running in the scriptblock but we can safely ignore those becasue they are
        # just logging, so the time difference is miniscule.
        # The code might also run just in framework scope, in that case the callback can remain empty,
        # eg when we are invoking framework setup.
        if ($MoveBetweenScopes) {
            # switch-timer to user scope inlined
            $state.UserCodeStopWatch.Start()
            $state.FrameworkStopWatch.Stop()

            if ($null -ne $OnUserScopeTransition) {
                & $OnUserScopeTransition
            }
        }
        do {
            $standardOutput = if ($NoNewScope) {
                . $wrapperScriptBlock $parameters
            }
            else {
                & $wrapperScriptBlock $parameters
            }
            # if the code reaches here we did not break
            #$break = $false
        } while ($false)
    }
    catch {
        $err = $_
    }

    if ($MoveBetweenScopes) {
        # switch-timer to framework scope inlined
        $state.UserCodeStopWatch.Stop()
        $state.FrameworkStopWatch.Start()

        if ($null -ne $OnFrameworkScopeTransition) {
            & $OnFrameworkScopeTransition
        }
    }

    if ($err) {
        $parameters.ErrorRecord.Add($err)
    }

    $r = [Pester.InvocationResult]::Create((0 -eq $parameters.ErrorRecord.Count), $parameters. ErrorRecord, $standardOutput)

    return $r
}

function Reset-TestSuiteTimer {
    if ($null -eq $state.TotalStopWatch) {
        $state.TotalStopWatch = [Diagnostics.Stopwatch]::StartNew()
    }

    if ($null -eq $state.UserCodeStopWatch) {
        $state.UserCodeStopWatch = [Diagnostics.Stopwatch]::StartNew()
    }

    if ($null -eq $state.FrameworkStopWatch) {
        $state.FrameworkStopWatch = [Diagnostics.Stopwatch]::StartNew()
    }

    $state.TotalStopWatch.Restart()
    $state.FrameworkStopWatch.Restart()
    $state.UserCodeStopWatch.Reset()
}

function Switch-Timer {
    param (
        [Parameter(Mandatory)]
        [ValidateSet("Framework", "UserCode")]
        $Scope
    )

    # perf: optimizing away parameter and validate set, and $Scope as int or bool within an if, only brings about 1/3 saving (about 60 ms per 1000 calls)
    # not worth it for the moment
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        if ($state.UserCodeStopWatch.IsRunning) {
            Write-PesterDebugMessage -Scope TimingCore "Switching from UserCode to $Scope"
        }

        if ($state.FrameworkStopWatch.IsRunning) {
            Write-PesterDebugMessage -Scope TimingCore "Switching from Framework to $Scope"
        }

        Write-PesterDebugMessage -Scope TimingCore -Message "UserCode total time $($state.UserCodeStopWatch.ElapsedMilliseconds)ms"
        Write-PesterDebugMessage -Scope TimingCore -Message "Framework total time $($state.FrameworkStopWatch.ElapsedMilliseconds)ms"
    }

    switch ($Scope) {
        "Framework" {
            # running in framework code adds time only to the overhead timer
            $state.UserCodeStopWatch.Stop()
            $state.FrameworkStopWatch.Start()
        }
        "UserCode" {
            $state.UserCodeStopWatch.Start()
            $state.FrameworkStopWatch.Stop()
        }
        default { throw [ArgumentException]"" }
    }
}

function Test-ShouldRun {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        $Item,
        $Filter
    )

    # see https://github.com/pester/Pester/issues/1442 for description of how this filtering works

    $result = @{
        Include  = $false
        Exclude  = $false
        Explicit = $false
    }

    $anyIncludeFilters = $false
    $fullDottedPath = $Item.Path -join "."
    if ($null -eq $Filter) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) is included, because there is no filters."
        }

        $result.Include = $true
        return $result
    }

    $parent = if ('Test' -eq $Item.ItemType) {
        $Item.Block
    }
    elseif ('Block' -eq $Item.ItemType) {
        # no need to check if we are root, we will not run these rules on Root block
        $Item.Parent
    }

    if ($parent.Exclude) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) is excluded, because it's parent is excluded."
        }
        $result.Exclude = $true
        return $result
    }

    # item is excluded when any of the exclude tags match
    $tagFilter = $Filter.ExcludeTag
    if ($tagFilter -and 0 -ne $tagFilter.Count) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Filter "($fullDottedPath) There is '$($tagFilter -join ", ")' exclude tag filter."
        }
        foreach ($f in $tagFilter) {
            foreach ($t in $Item.Tag) {
                if ($t -like $f) {
                    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                        Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) is excluded, because it's tag '$t' matches exclude tag filter '$f'."
                    }
                    $result.Exclude = $true
                    return $result
                }
            }
        }
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) did not match the exclude tag filter, moving on to the next filter."
        }
    }

    # - place exclude filters above this line and include below this line

    $lineFilter = $Filter.Line
    # use File for saved files or Id for ScriptBlocks without files
    # this filter has the ability to set the test to "explicit" so we can run
    # the test even if it is marked as skipped run this include as first so we figure it out
    # in one place and check if parent was included after this one to short circuit the other
    # filters in case parent already knows that it will run
    $line = "$(if ($Item.ScriptBlock.File) { $Item.ScriptBlock.File } else { $Item.ScriptBlock.Id }):$($Item.ScriptBlock.StartPosition.StartLine)" -replace '\\', '/'
    if ($lineFilter -and 0 -ne $lineFilter.Count) {
        $anyIncludeFilters = $true
        foreach ($l in $lineFilter -replace '\\', '/') {
            if ($l -eq $line) {
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) is included, because its path:line '$line' matches line filter '$lineFilter'."
                }

                # if ('Test' -eq $Item.ItemType ) {
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) is explicitly included, because it matched line filter, and will run even if -Skip is specified on it. Any skipped children will still be skipped."
                }

                $result.Explicit = $true
                # }

                $result.Include = $true
                return $result
            }
        }
    }

    if ($parent.Include) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) is included, because its parent is included."
        }

        $result.Include = $true
        return $result
    }

    # test is included when it has tags and the any of the tags match
    $tagFilter = $Filter.Tag
    if ($tagFilter -and 0 -ne $tagFilter.Count) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Filter "($fullDottedPath) There is '$($tagFilter -join ", ")' include tag filter."
        }
        $anyIncludeFilters = $true
        if ($null -eq $Item.Tag -or 0 -eq $Item.Tag) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) has no tags, moving to next include filter."
            }
        }
        else {
            foreach ($f in $tagFilter) {
                foreach ($t in $Item.Tag) {
                    if ($t -like $f) {
                        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                            Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) is included, because it's tag '$t' matches tag filter '$f'."
                        }

                        $result.Include = $true
                        return $result
                    }
                }
            }
        }
    }

    $allPaths = $Filter.FullName
    if ($allPaths -and 0 -ne $allPaths) {
        $anyIncludeFilters = $true
        foreach ($p in $allPaths) {
            if ($fullDottedPath -like $p) {
                $include = $true
                break
            }
        }
        if ($include) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) is included, because it matches fullname filter '$include'."
            }

            $result.Include = $true
            return $result
        }
        else {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) does not match the dotted path filter, moving to next include filter."
            }
        }
    }

    if ($anyIncludeFilters) {
        if ('Test' -eq $Item.ItemType) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) did not match any of the include filters, it will not be included in the run."
            }
        }
        elseif ('Block' -eq $Item.ItemType) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) did not match any of the include filters, but it will still be included in the run, it's children will determine if it will run."
            }
        }
        else {
            throw "Item type $($Item.ItemType) is not supported in filter."
        }
    }
    else {
        if ('Test' -eq $Item.ItemType) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) will be included in the run, because there were no include filters so all tests are included unless they match exclude rule."
            }

            $result.Include = $true
        } # putting the bool in both to avoid string comparison
        elseif ('Block' -eq $Item.ItemType) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Filter "($fullDottedPath) $($Item.ItemType) will be included in the run, because there were no include filters, and will let its children to determine whether or not it should run."
            }
        }
        else {
            throw "Item type $($Item.ItemType) is not supported in filter."
        }

        return $result
    }

    return $result
}

function Invoke-Test {
    #[CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [PSObject[]] $BlockContainer,
        [Parameter(Mandatory = $true)]
        [Management.Automation.SessionState] $SessionState,
        $Filter,
        $Plugin,
        $PluginConfiguration,
        $Configuration
    )

    # set the incoming value for all the child scopes
    # TODO: revisit this because this will probably act weird as we jump between session states
    $PesterPreference = $Configuration

    $state.Plugin = $Plugin
    $state.PluginConfiguration = $PluginConfiguration
    $state.Configuration = $Configuration

    # # TODO: this it potentially unreliable, because supressed errors are written to Error as well. And the errors are captured only from the caller state. So let's use it only as a useful indicator during migration and see how it works in production code.

    # # finding if there were any non-terminating errors during the run, user can clear the array, and the array has fixed size so we can't just try to detect if there is any difference by counts before and after. So I capture the last known error in that state and try to find it in the array after the run
    # $originalErrors = $SessionState.PSVariable.Get("Error").Value
    # $originalLastError = $originalErrors[0]
    # $originalErrorCount = $originalErrors.Count

    $found = Discover-Test -BlockContainer $BlockContainer -Filter $Filter -SessionState $SessionState

    # $errs = $SessionState.PSVariable.Get("Error").Value
    # $errsCount = $errs.Count
    # if ($errsCount -lt $originalErrorCount) {
    #     # it would be possible to detect that there are 0 errors, in the array and continue,
    #     # but this still indicates the user code is running where it should not, so let's throw anyway
    #     throw "Test discovery failed. The error count ($errsCount) after running discovery is lower than the error count before discovery ($originalErrorCount). Is some of your code running outside Pester controlled blocks and it clears the `$error array by calling `$error.Clear()?"

    # }


    # if ($originalErrorCount -lt $errsCount) {
    #     # probably the most usual case,  there are more errors then there were before,
    #     # so some were written to the screen, this also runs when the user cleared the
    #     # array and wrote more errors than there originally were
    #     $i = $errsCount - $originalErrorCount
    # }
    # else {
    #     # there is equal amount of errors, the array was probably full and so the original
    #     # error shifted towards the end of the array, we try to find it and see how many new
    #     # errors are there
    #     for ($i = 0 ; $i -lt $errsLength; $i++) {
    #         if ([object]::referenceEquals($errs[$i], $lastError)) {
    #             break
    #         }
    #     }
    # }
    # if (0 -ne $i) {
    #     throw "Test discovery failed. There were $i non-terminating errors during test discovery. This indicates that some of your code is invoked outside of Pester controlled blocks and fails. No tests will be run."
    # }
    Run-Test -Block $found -SessionState $SessionState
}

function PostProcess-DiscoveredBlock {
    param (
        [Parameter(Mandatory = $true)]
        $Block,
        $Filter,
        $BlockContainer,
        [Parameter(Mandatory = $true)]
        $RootBlock
    )

    # pass array of blocks rather than 1 block to cross the function boundary
    # as few times as we can
    foreach ($b in $Block) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            $path = $b.Path -join "."
        }

        # traverses the block structure after a block was found and
        # link childs to their parents, filter blocks and tests to
        # determine which should run, and mark blocks and tests
        # as first or last to know when one time setups & teardowns should run
        $b.IsRoot = $b -eq $RootBlock
        $b.Root = $RootBlock
        $b.BlockContainer = $BlockContainer

        $tests = $b.Tests

        if ($b.IsRoot) {
            $b.Explicit = $false
            $b.Exclude = $false
            $b.Include = $false
            $b.ShouldRun = $true
        }
        else {
            $shouldRun = (Test-ShouldRun -Item $b -Filter $Filter)
            $b.Explicit = $shouldRun.Explicit

            if (-not $shouldRun.Exclude -and -not $shouldRun.Include) {
                $b.ShouldRun = $true
            }
            elseif ($shouldRun.Include) {
                $b.ShouldRun = $true
            }
            elseif ($shouldRun.Exclude) {
                $b.ShouldRun = $false
            }
            else {
                throw "Unknown combination of include exclude $($shouldRun)"
            }

            $b.Include = $shouldRun.Include -and -not $shouldRun.Exclude
            $b.Exclude = $shouldRun.Exclude
        }

        $parentBlockIsSkipped = (-not $b.IsRoot -and $b.Parent.Skip)

        if ($b.Skip) {
            if ($b.Explicit) {
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Skip "($path) Block was marked as skipped, but will not be skipped because it was explicitly requested to run."
                }

                $b.Skip = $false
            }
            else {
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Skip "($path) Block is skipped."
                }

                $b.Skip = $true
            }
        }
        elseif ($parentBlockIsSkipped) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Skip "($path) Block is skipped because a parent block was skipped."
            }

            $b.Skip = $true
        }

        $blockShouldRun = $false
        if ($tests.Count -gt 0) {
            foreach ($t in $tests) {
                $t.Block = $b

                if ($t.Block.Exclude) {
                    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                        $path = $t.Path -join "."
                        Write-PesterDebugMessage -Scope Filter "($path) Test is excluded because parent block was excluded."
                    }
                    $t.ShouldRun = $false
                }
                else {
                    # run the exlude filters before checking if the parent is included
                    # otherwise you would include tests that could match the exclude rule
                    $shouldRun = (Test-ShouldRun -Item $t -Filter $Filter)
                    $t.Explicit = $shouldRun.Explicit

                    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                        $path = $t.Path -join "."
                    }

                    if (-not $shouldRun.Include -and -not $shouldRun.Exclude) {
                        $t.ShouldRun = $false
                    }
                    elseif ($shouldRun.Include) {
                        $t.ShouldRun = $true
                    }
                    elseif ($shouldRun.Exclude) {
                        $t.ShouldRun = $false
                    }
                    else {
                        throw "Unknown combination of ShouldRun $ShouldRun"
                    }
                }

                if ($t.Skip) {
                    if ($t.ShouldRun -and $t.Explicit) {
                        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                            Write-PesterDebugMessage -Scope Skip "($path) Test was marked as skipped, but will not be skipped because it was explicitly requested to run."
                        }

                        $t.Skip = $false
                    }
                    else {
                        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                            Write-PesterDebugMessage -Scope Skip "($path) Test is skipped."
                        }

                        $t.Skip = $true
                    }
                }
                elseif ($b.Skip) {
                    if ($t.ShouldRun -and $t.Explicit) {
                        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                            Write-PesterDebugMessage -Scope Skip "($path) Test was marked as skipped, because its parent was marked as skipped, but will not be skipped because it was explicitly requested to run."
                        }

                        $t.Skip = $false
                    }
                    else {
                        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                            Write-PesterDebugMessage -Scope Skip "($path) Test is skipped because a parent block was skipped."
                        }

                        $t.Skip = $true
                    }
                }
            }


            # if we determined that the block should run we can still make it not run if
            # none of it's children will run
            if ($b.ShouldRun) {
                $testsToRun = foreach ($t in $tests) { if ($t.ShouldRun) { $t } }
                if ($testsToRun -and 0 -ne $testsToRun.Count) {
                    $testsToRun[0].First = $true
                    $testsToRun[-1].Last = $true
                    $blockShouldRun = $true
                }
            }
        }

        $childBlocks = $b.Blocks
        $anyChildBlockShouldRun = $false
        if ($childBlocks.Count -gt 0) {
            foreach ($cb in $childBlocks) {
                $cb.Parent = $b
            }

            # passing the array as a whole to cross the function boundary as few times as I can
            PostProcess-DiscoveredBlock -Block $childBlocks -Filter $Filter -BlockContainer $BlockContainer -RootBlock $RootBlock

            $childBlocksToRun = foreach ($cb in $childBlocks) { if ($cb.ShouldRun) { $cb } }
            $anyChildBlockShouldRun = $childBlocksToRun -and 0 -ne $childBlocksToRun.Count
            if ($anyChildBlockShouldRun) {
                $childBlocksToRun[0].First = $true
                $childBlocksToRun[-1].Last = $true
            }
        }

        $shouldRunBasedOnChildren = $blockShouldRun -or $anyChildBlockShouldRun

        if ($b.ShouldRun -and -not $shouldRunBasedOnChildren) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Filter "($($b.Path -join '.')) Block was marked as Should run based on filters, but none of its tests or tests in children blocks were marked as should run. So the block won't run."
            }
        }

        $b.ShouldRun = $shouldRunBasedOnChildren
    }
}

function PostProcess-ExecutedBlock {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Block
    )


    # traverses the block structure after a block was executed and
    # and sets the failures correctly so the aggreagatted failures
    # propagate towards the root so if a child test fails it's block
    # aggregated result should be marked as failed

    process {
        foreach ($b in $Block) {
            $thisBlockFailed = -not $b.OwnPassed

            $b.OwnTotalCount = 0
            $b.OwnFailedCount = 0
            $b.OwnPassedCount = 0
            $b.OwnSkippedCount = 0
            $b.OwnNotRunCount = 0

            $testDuration = [TimeSpan]::Zero

            foreach ($t in $b.Tests) {
                $testDuration += $t.Duration

                $b.OwnTotalCount++
                if (-not $t.ShouldRun) {
                    $b.OwnNotRunCount++
                }
                elseif ($t.ShouldRun -and $t.Skipped) {
                    $b.OwnSkippedCount++
                }
                elseif (($t.Executed -and -not $t.Passed) -or ($t.ShouldRun -and -not $t.Executed)) {
                    # TODO:  this condition works but needs to be revisited. when the parent fails the test is marked as failed, because it should have run but it did not,and but there is no error in the test result, in such case all tests should probably add error or a flag that indicates that the parent failed, or a log or something, but error is probably the best
                    $b.OwnFailedCount++
                }
                elseif ($t.Executed -and $t.Passed) {
                    $b.OwnPassedCount++
                }
                else {
                    throw "Test '$($t.Name)' is in invalid state. $($t | Format-List -Force * | Out-String)"
                }
            }

            $anyTestFailed = 0 -lt $b.OwnFailedCount

            $childBlocks = $b.Blocks
            $anyChildBlockFailed = $false
            $aggregatedChildDuration = [TimeSpan]::Zero
            if (none $childBlocks) {
                # one thing to consider here is what happens when a block fails, in the current
                # excecution model the block can fail when a setup or teardown fails, with failed
                # setup it is easy all the tests in the block are considered failed, with teardown
                # not so much, when all tests pass and the teardown itself fails what should be the result?



                # todo: there are two concepts mixed with the "own", because the duration and the test counts act differently. With the counting we are using own as "the count of the tests in this block", but with duration the "own" means "self", that is how long this block itself has run, without the tests. This information might not be important but this should be cleared up before shipping. Same goes with the relation to failure, ownPassed means that the block itself passed (that is no setup or teardown failed in it), even though the underlying tests might fail.


                $b.OwnDuration = $b.Duration - $testDuration

                $b.Passed = -not ($thisBlockFailed -or $anyTestFailed)

                # we have no child blocks so the own counts are the same as the total counts
                $b.TotalCount = $b.OwnTotalCount
                $b.FailedCount = $b.OwnFailedCount
                $b.PassedCount = $b.OwnPassedCount
                $b.SkippedCount = $b.OwnSkippedCount
                $b.NotRunCount = $b.OwnNotRunCount
            }
            else {
                # when we have children we first let them process themselves and
                # then we add the results together (the recusion could reach to the parent and add the totals)
                # but that is difficult with the duration, so this way is less error prone
                PostProcess-ExecutedBlock -Block $childBlocks

                foreach ($child in $childBlocks) {
                    # check that no child block failed, the Passed is aggregate failed, so it will be false
                    # when any test fails in the child, or if the block itself fails
                    if (-not $child.Passed) {
                        $anyChildBlockFailed = $true
                    }

                    $aggregatedChildDuration += $child.Duration

                    $b.TotalCount += $child.TotalCount
                    $b.PassedCount += $child.PassedCount
                    $b.FailedCount += $child.FailedCount
                    $b.SkippedCount += $child.SkippedCount
                    $b.NotRunCount += $child.NotRunCount
                }

                # then we add counts from this block to the counts from the children blocks
                $b.TotalCount += $b.OwnTotalCount
                $b.PassedCount += $b.OwnPassedCount
                $b.FailedCount += $b.OwnFailedCount
                $b.SkippedCount += $b.OwnSkippedCount
                $b.NotRunCount += $b.OwnNotRunCount

                $b.Passed = -not ($thisBlockFailed -or $anyTestFailed -or $anyChildBlockFailed)
                $b.OwnDuration = $b.Duration - $testDuration - $aggregatedChildDuration
            }
        }
    }
}

function Where-Failed {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Block
    )

    $Block | View-Flat | where { $_.ShouldRun -and (-not $_.Executed -or -not $_.Passed) }
}

function View-Flat {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Block
    )

    begin {
        $tests = [System.Collections.Generic.List[Object]]@()
    }
    process {
        # TODO: normally I would output to pipeline but in fold there is accumulator and so it does not output
        foreach ($b in $Block) {
            Fold-Container $b -OnTest { param($t) $tests.Add($t) }
        }
    }

    end {
        $tests
    }
}

function flattenBlock ($Block, $Accumulator) {
    $Accumulator.Add($Block)
    if ($Block.Blocks.Count -eq 0) {
        return $Accumulator
    }

    foreach ($bl in $Block.Blocks) {
        flattenBlock -Block $bl -Accumulator $Accumulator
    }
    $Accumulator
}

function New-FilterObject {
    [CmdletBinding()]
    param (
        [String[][]] $FullName,
        [String[]] $Tag,
        [String[]] $ExcludeTag,
        [String[]] $Line
    )

    [PSCustomObject] @{
        FullName   = $FullName
        Tag        = $Tag
        ExcludeTag = $ExcludeTag
        Line       = $Line
    }
}

function New-PluginObject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [String] $Name,
        [Hashtable] $Configuration,
        [ScriptBlock] $Start,
        [ScriptBlock] $DiscoveryStart,
        [ScriptBlock] $ContainerDiscoveryStart,
        [ScriptBlock] $BlockDiscoveryStart,
        [ScriptBlock] $TestDiscoveryStart,
        [ScriptBlock] $TestDiscoveryEnd,
        [ScriptBlock] $BlockDiscoveryEnd,
        [ScriptBlock] $ContainerDiscoveryEnd,
        [ScriptBlock] $DiscoveryEnd,
        [ScriptBlock] $RunStart,
        [scriptblock] $ContainerRunStart,
        [ScriptBlock] $OneTimeBlockSetupStart,
        [ScriptBlock] $EachBlockSetupStart,
        [ScriptBlock] $OneTimeTestSetupStart,
        [ScriptBlock] $EachTestSetupStart,
        [ScriptBlock] $EachTestTeardownEnd,
        [ScriptBlock] $OneTimeTestTeardownEnd,
        [ScriptBlock] $EachBlockTeardownEnd,
        [ScriptBlock] $OneTimeBlockTeardownEnd,
        [ScriptBlock] $ContainerRunEnd,
        [ScriptBlock] $RunEnd,
        [ScriptBlock] $End
    )

    [PSCustomObject] @{
        Name                    = $Name
        Configuration           = $Configuration
        Start                   = $Start
        DiscoveryStart          = $DiscoveryStart
        ContainerDiscoveryStart = $ContainerDiscoveryStart
        BlockDiscoveryStart     = $BlockDiscoveryStart
        TestDiscoveryStart      = $TestDiscoveryStart
        TestDiscoveryEnd        = $TestDiscoveryEnd
        BlockDiscoveryEnd       = $BlockDiscoveryEnd
        ContainerDiscoveryEnd   = $ContainerDiscoveryEnd
        DiscoveryEnd            = $DiscoveryEnd
        RunStart                = $RunStart
        ContainerRunStart       = $ContainerRunStart
        OneTimeBlockSetupStart  = $OneTimeBlockSetupStart
        EachBlockSetupStart     = $EachBlockSetupStart
        OneTimeTestSetupStart   = $OneTimeTestSetupStart
        EachTestSetupStart      = $EachTestSetupStart
        EachTestTeardownEnd     = $EachTestTeardownEnd
        OneTimeTestTeardownEnd  = $OneTimeTestTeardownEnd
        EachBlockTeardownEnd    = $EachBlockTeardownEnd
        OneTimeBlockTeardownEnd = $OneTimeBlockTeardownEnd
        ContainerRunEnd         = $ContainerRunEnd
        RunEnd                  = $RunEnd
        End                     = $End
        PSTypeName              = 'Plugin'
    }
}

function Invoke-BlockContainer {
    param (
        [Parameter(Mandatory)]
        $BlockContainer,
        [Parameter(Mandatory = $true)]
        [Management.Automation.SessionState] $SessionState
    )

    switch ($BlockContainer.Type) {
        "ScriptBlock" { & $BlockContainer.Item }
        "File" { Invoke-File -Path $BlockContainer.Item.PSPath -SessionState $SessionState }
        default { throw [System.ArgumentOutOfRangeException]"" }
    }
}

function New-BlockContainerObject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ParameterSetName = "ScriptBlock")]
        [ScriptBlock] $ScriptBlock,
        [Parameter(Mandatory, ParameterSetName = "Path")]
        [String] $Path,
        [Parameter(Mandatory, ParameterSetName = "File")]
        [System.IO.FileInfo] $File
    )

    $type, $item = switch ($PSCmdlet.ParameterSetName) {
        "ScriptBlock" { "ScriptBlock", $ScriptBlock }
        "Path" { "File", (Get-Item $Path) }
        "File" { "File", $File }
        default { throw [System.ArgumentOutOfRangeException]"" }
    }

    $c = [Pester.ContainerInfo]::Create()
    $c.Type    = $type
    $c.Item = $item
    return $c
}

function New-DiscoveredBlockContainerObject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        $BlockContainer,
        [Parameter(Mandatory)]
        $Block
    )

    [PSCustomObject] @{
        Type    = $BlockContainer.Type
        Item = $BlockContainer.Item
        # I create a Root block to keep the discovery unaware of containers,
        # but I don't want to publish that root block because it contains properties
        # that do not make sense on container level like Name and Parent,
        # so here we don't want to take the root block but the blocks inside of it
        # and copy the rest of the meaningful properties
        Blocks  = $Block.Blocks
    }
}

function Invoke-File {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [String]
        $Path,
        [Parameter(Mandatory = $true)]
        [Management.Automation.SessionState] $SessionState
    )

    $sb = {
        param ($private:p)
        . $private:p
    }

    # set the original session state to the wrapper scriptblock
    # making it invoke in the caller session state
    # TODO: heat this up if we want to keep the first test running accuately
    $SessionStateInternal = $script:SessionStateInternalProperty.GetValue($SessionState, $null)
    $script:ScriptBlockSessionStateInternalProperty.SetValue($sb, $SessionStateInternal, $null)

    & $sb $Path
}

function Import-Dependency {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        $Dependency,
        # [Parameter(Mandatory=$true)]
        [Management.Automation.SessionState] $SessionState
    )

    if ($Dependency -is [ScriptBlock]) {
        . $Dependency
    }
    else {

        # when importing a file we need to
        # dot source it into the user scope, the path has
        # no bound session state, so simply dot sourcing it would
        # import it into module scope
        # instead we wrap it into a scriptblock that we attach to user
        # scope, and dot source the file, that will import the functions into
        # that script block, and then we dot source it again to import it
        # into the caller scope, effectively defining the functions there
        $sb = {
            param ($p)

            . $($p; Remove-Variable -Scope Local -Name p)
        }

        $flags = [System.Reflection.BindingFlags]'Instance,NonPublic'
        $SessionStateInternal = $SessionState.GetType().GetProperty('Internal', $flags).GetValue($SessionState, $null)

        # attach the original session state to the wrapper scriptblock
        # making it invoke in the caller session state
        $sb.GetType().GetProperty('SessionStateInternal', $flags).SetValue($sb, $SessionStateInternal, $null)

        # dot source the caller bound scriptblock which imports it into user scope
        . $sb $Dependency
    }
}

function Add-FrameworkDependency {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Dependency
    )

    # adds dependency that is dotsourced during discovery & execution
    # this should be rarely needed, but is useful when you wrap Pester pieces
    # into your own functions, and want to have them available during both
    # discovery and execution
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Runtime "Adding framework dependency '$Dependency'"
    }
    Import-Dependency -Dependency $Dependency -SessionState $SessionState
}

function Add-Dependency {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        $Dependency,
        [Parameter(Mandatory = $true)]
        [Management.Automation.SessionState] $SessionState
    )


    # adds dependency that is dotsourced after discovery and before execution
    if (-not (Is-Discovery)) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Runtime "Adding run-time dependency '$Dependency'"
        }
        Import-Dependency -Dependency $Dependency -SessionState $SessionState
    }
}

function Anywhere {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock
    )

    # runs piece of code during execution, useful for backwards compatibility
    # when you have stuff laying around inbetween describes and want to run it
    # only during execution and not twice. works the same as Add-Dependency, but I name
    # it differently because this is a bad-practice mitigation tool and should probably
    # write a warning to make you use Before* blocks instead
    if (-not (Is-Discovery)) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Runtime "Invoking free floating piece of code"
        }
        Import-Dependency $ScriptBlock
    }
}

function New-ParametrizedTest () {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [String] $Name,
        [Parameter(Mandatory = $true, Position = 1)]
        [ScriptBlock] $ScriptBlock,
        [String[]] $Tag = @(),
        # do not use [hashtable[]] because that throws away the order if user uses [ordered] hashtable
        [System.Collections.IDictionary[]] $Data = @{ },
        [Switch] $Focus,
        [Switch] $Skip
    )

    # we don't need to switch the timer, all the code that runs during discovery is "overhead"
    # Switch-Timer -Scope Framework
    # TODO: there used to be counter, that was added to the id, seems like I am missing TestGroup on the test cases, so I can reconcile them back if they were generated from testcases
    # $counter = 0

    # using the start line of the scriptblock as the id of the test so we can join multiple testcases together, this should be unique enough because it only needs to be unique for the current block, so the way to break this would be to inline multiple tests, but that is unlikely to happen. When it happens just use StartLine:StartPosition
    $id = $ScriptBlock.StartPosition.StartLine
    foreach ($d in $Data) {
        #    $innerId = if (-not $hasExternalId) { $null } else { "$Id-$(($counter++))" }
        New-Test -Id $id -Name $Name -Tag $Tag -ScriptBlock $ScriptBlock -Data $d -Focus:$Focus -Skip:$Skip
    }
}

function Recurse-Up {
    param(
        [Parameter(Mandatory)]
        $InputObject,
        [ScriptBlock] $Action
    )

    $i = $InputObject
    $level = 0
    while ($null -ne $i) {
        &$Action $i

        $level--
        $i = $i.Parent
    }
}

function ConvertTo-HumanTime {
    param ([TimeSpan]$TimeSpan)
    if ($TimeSpan.Ticks -lt [timespan]::TicksPerSecond) {
        "$([int]($TimeSpan.TotalMilliseconds))ms"
    }
    else {
        "$([int]($TimeSpan.TotalSeconds))s"
    }
}

# initialize internal state
Reset-TestSuiteState

# file src\TypeClass.psm1
function Is-Value ($Value) {
    $Value = $($Value)
    $Value -is [ValueType] -or $Value -is [string] -or $value -is [scriptblock]
}

function Is-Collection ($Value) {
    # check for value types and strings explicitly
    # because otherwise it does not work for decimal
    # so let's skip all values we definitely know
    # are not collections
    if ($Value -is [ValueType] -or $Value -is [string]) {
        return $false
    }

    -not [object]::ReferenceEquals($Value, $($Value))
}

function Is-ScriptBlock ($Value) {
    $Value -is [ScriptBlock]
}

function Is-DecimalNumber ($Value) {
    $Value -is [float] -or $Value -is [single] -or $Value -is [double] -or $Value -is [decimal]
}

function Is-Hashtable ($Value) {
    $Value -is [hashtable]
}

function Is-Dictionary ($Value) {
    $Value -is [System.Collections.IDictionary]
}


function Is-Object ($Value) {
    # here we need to approximate that that object is not value
    # or any special category of object, so other checks might
    # need to be added

    -not ($null -eq $Value -or (Is-Value -Value $Value) -or (Is-Collection -Value $Value))
}
# file src\Format.psm1

function Format-Collection ($Value, [switch]$Pretty) {
    $Limit = 10
    $separator = ', '
    if ($Pretty) {
        $separator = ",`n"
    }
    #$count = $Value.Count
    #$trimmed = $count  -gt $Limit
    '@(' + (($Value | Select -First $Limit | % { Format-Nicely -Value $_ -Pretty:$Pretty }) -join $separator ) + <# $(if ($trimmed) {' +' + [string]($count-$limit)}) + #> ')'
}

function Format-Object ($Value, $Property, [switch]$Pretty) {
    if ($null -eq $Property) {
        $Property = $Value.PSObject.Properties | Select-Object -ExpandProperty Name
    }
    $valueType = Get-ShortType $Value
    $valueFormatted = ([string]([PSObject]$Value | Select-Object -Property $Property))

    if ($Pretty) {
        $margin = "    "
        $valueFormatted = $valueFormatted `
            -replace '^@{', "@{`n$margin" `
            -replace '; ', ";`n$margin" `
            -replace '}$', "`n}" `

    }

    $valueFormatted -replace "^@", $valueType
}

function Format-Null {
    '$null'
}

function Format-String ($Value) {
    if ('' -eq $Value) {
        return '<empty>'
    }

    "'$Value'"
}

function Format-Date ($Value) {
    $Value.ToString('o')
}

function Format-Boolean ($Value) {
    '$' + $Value.ToString().ToLower()
}

function Format-ScriptBlock ($Value) {
    '{' + $Value + '}'
}

function Format-Number ($Value) {
    [string]$Value
}

function Format-Hashtable ($Value) {
    $head = '@{'
    $tail = '}'

    $entries = $Value.Keys | sort | foreach {
        $formattedValue = Format-Nicely $Value.$_
        "$_=$formattedValue" }

    $head + ( $entries -join '; ') + $tail
}

function Format-Dictionary ($Value) {
    $head = 'Dictionary{'
    $tail = '}'

    $entries = $Value.Keys | sort | foreach {
        $formattedValue = Format-Nicely $Value.$_
        "$_=$formattedValue" }

    $head + ( $entries -join '; ') + $tail
}

function Format-Nicely ($Value, [switch]$Pretty) {
    if ($null -eq $Value) {
        return Format-Null -Value $Value
    }

    if ($Value -is [bool]) {
        return Format-Boolean -Value $Value
    }

    if ($Value -is [string]) {
        return Format-String -Value $Value
    }

    if ($Value -is [DateTime]) {
        return Format-Date -Value $Value
    }

    if ($value -is [Type]) {
        return '[' + (Format-Type -Value $Value) + ']'
    }

    if (Is-DecimalNumber -Value $Value) {
        return Format-Number -Value $Value
    }

    if (Is-ScriptBlock -Value $Value) {
        return Format-ScriptBlock -Value $Value
    }

    if (Is-Value -Value $Value) {
        return $Value
    }

    if (Is-Hashtable -Value $Value) {
        # no advanced formatting of objects in the first version, till I balance it
        return [string]$Value
        #return Format-Hashtable -Value $Value
    }

    if (Is-Dictionary -Value $Value) {
        # no advanced formatting of objects in the first version, till I balance it
        return [string]$Value
        #return Format-Dictionary -Value $Value
    }

    if (Is-Collection -Value $Value) {
        return Format-Collection -Value $Value -Pretty:$Pretty
    }

    # no advanced formatting of objects in the first version, till I balance it
    return [string]$Value
    # Format-Object -Value $Value -Property (Get-DisplayProperty $Value) -Pretty:$Pretty
}

function Sort-Property ($InputObject, [string[]]$SignificantProperties, $Limit = 4) {

    $properties = @($InputObject.PSObject.Properties |
            where { $_.Name -notlike "_*"} |
            select -expand Name |
            sort)
    $significant = @()
    $rest = @()
    foreach ($p in $properties) {
        if ($significantProperties -contains $p) {
            $significant += $p
        }
        else {
            $rest += $p
        }
    }

    #todo: I am assuming id, name properties, so I am just sorting the selected ones by name.
    (@($significant | sort) + $rest) | Select -First $Limit

}

function Get-DisplayProperty ($Value) {
    Sort-Property -InputObject $Value -SignificantProperties 'id', 'name'
}

function Get-ShortType ($Value) {
    if ($null -ne $value) {
        $type = Format-Type $Value.GetType()
        # PSCustomObject serializes to the whole type name on normal PS but to
        # just PSCustomObject on PS Core

        $type `
            -replace "^System\." `
            -replace "^Management\.Automation\.PSCustomObject$", "PSObject" `
            -replace "^PSCustomObject$", "PSObject" `
            -replace "^Object\[\]$", "collection" `

    }
    else {
        Format-Type $null
    }
}

function Format-Type ([Type]$Value) {
    if ($null -eq $Value) {
        return '<none>'
    }

    [string]$Value
}

# file src\Pester.RSpec.ps1
function Find-File {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [String[]] $Path,
        [String[]] $ExcludePath,
        [Parameter(Mandatory=$true)]
        [string] $Extension
    )


    $files =
        foreach ($p in $Path) {
            if ([String]::IsNullOrWhiteSpace($p))
            {
                continue
            }

            if ((Test-Path $p)) {
                $item = Get-Item $p

                if ($item.PSIsContainer) {
                    # this is an existing directory search it for tests file
                    Get-ChildItem -Recurse -Path $p -Filter "*$Extension" -File
                    continue
                }

                if ("FileSystem" -ne $item.PSProvider.Name) {
                    # item is not a directory and exists but is not a file so we are not interested
                    continue
                }

                if (".ps1" -ne $item.Extension) {
                    Write-Error "Script path '$p' is not a ps1 file." -ErrorAction Stop
                }

                # this is some file, we don't care if it is just a .ps1 file or .Tests.ps1 file
                Add-Member -Name UnresolvedPath -Type NoteProperty -Value $p -InputObject $item
                $item
                continue
            }

            # this is a path that does not exist so let's hope it is
            # a wildcarded path that will resolve to some files
            Get-ChildItem -Recurse -Path $p -Filter "*$Extension" -File
        }

    Filter-Excluded -Files $files -ExcludePath $ExcludePath | where { $_ }
}

function Filter-Excluded ($Files, $ExcludePath) {

    if ($null -eq $ExcludePath -or @($ExcludePath).Length -eq 0) {
        return @($Files)
    }

    foreach ($file in @($Files)) {
        # normalize backslashes for cross-platform ease of use
        $p = $file.FullName -replace "/","\"
        $excluded = $false

        foreach ($exclusion in (@($ExcludePath) -replace "/","\")) {
            if ($excluded) {
                continue
            }

            if ($p -like $exclusion) {
                $excluded = $true
            }
        }

        if (-not $excluded) {
            $file
        }
    }
}

function Add-RSpecTestObjectProperties {
    param ($TestObject)

    # adds properties that are specific to RSpec to the result object
    # this includes figuring out the result
    # formatting the failure message and stacktrace

    $TestObject.Result = if ($TestObject.Skipped) {
        "Skipped"
    }
    elseif ($TestObject.Passed) {
        "Passed"
    }
    elseif ($TestObject.ShouldRun -and (-not $TestObject.Executed -or -not $TestObject.Passed)) {
        "Failed"
    }
    else {
        "NotRun"
    }

    foreach ($e in $TestObject.ErrorRecord) {
        $r = ConvertTo-FailureLines $e
        $e.PSObject.Properties.Add([Pester.Factory]::CreateNoteProperty("DisplayErrorMessage", [string]($r.Message -join [Environment]::NewLine)))
        $e.PSObject.Properties.Add([Pester.Factory]::CreateNoteProperty("DisplayStackTrace", [string]($r.Trace -join [Environment]::NewLine)))
    }
}

function Add-RSpecBlockObjectProperties ($BlockObject) {
    foreach ($e in $BlockObject.ErrorRecord) {
        $r = ConvertTo-FailureLines $e
        $e.PSObject.Properties.Add([Pester.Factory]::CreateNoteProperty("DisplayErrorMessage", [string]($r.Message -join [Environment]::NewLine)))
        $e.PSObject.Properties.Add([Pester.Factory]::CreateNoteProperty("DisplayStackTrace", [string]($r.Trace -join [Environment]::NewLine)))
    }
}

function PostProcess-RspecTestRun ($TestRun) {

    Fold-Run $Run -OnTest {
        param($t)

        ## decorate
        # we already added the RSpec properties as part of the plugin

        ### summarize
        $TestRun.Tests.Add($t)

        switch ($t.Result) {
            "NotRun" {
                $null = $TestRun.NotRun.Add($t)
            }
            "Passed" {
                $null = $TestRun.Passed.Add($t)
            }
            "Failed" {
                $null = $TestRun.Failed.Add($t)
            }
            "Skipped" {
                $null = $TestRun.Skipped.Add($t)
            }
            default { throw "Result $($t.Result) is not supported."}
        }

    } -OnBlock {
        param ($b)

        ## decorate

        # we already processed errors in the plugin step to make the available for reporting

        $b.Result = if ($b.Skip) {
            "Skipped"
        }
        elseif ($b.Passed) {
            "Passed"
        }
        elseif ($b.ShouldRun -and (-not $b.Executed -or -not $b.Passed)) {
            "Failed"
        }
        else {
            "NotRun"
        }

        ## sumamrize

        # a block that has errors would write into failed blocks so we can report them
        # later we can filter this to only report errors from AfterAll
        if (0 -lt $b.ErrorRecord.Count) {
            $TestRun.FailedBlocks.Add($b)
        }

    } -OnContainer {
        param ($b)

        ## decorate

        # here we add result
        $b.result = if ($b.Skipped) {
            "Skipped"
        }
        elseif ($b.Passed) {
            "Passed"
        }
        elseif ($b.ShouldRun -and (-not $b.Executed -or -not $b.Passed)) {
            "Failed"
        }
        else {
            "NotRun"
        }

        foreach ($e in $b.ErrorRecord) {
            $r = ConvertTo-FailureLines $e
            $e.PSObject.Properties.Add([Pester.Factory]::CreateNoteProperty("DisplayErrorMessage", [string]($r.Message -join [Environment]::NewLine)))
            $e.PSObject.Properties.Add([Pester.Factory]::CreateNoteProperty("DisplayStackTrace", [string]($r.Trace -join [Environment]::NewLine)))
        }

        ## summarize
        if (0 -lt $b.ErrorRecord.Count) {
            $TestRun.FailedContainers.Add($b)
        }

        $TestRun.Duration += $b.Duration
        $TestRun.UserDuration += $b.UserDuration
        $TestRun.FrameworkDuration += $b.FrameworkDuration
        $TestRun.DiscoveryDuration += $b.DiscoveryDuration
    }

    $TestRun.PassedCount = $TestRun.Passed.Count
    $TestRun.FailedCount = $TestRun.Failed.Count
    $TestRun.SkippedCount = $TestRun.Skipped.Count
    $TestRun.NotRunCount = $TestRun.NotRun.Count

    $TestRun.TotalCount = $TestRun.Tests.Count

    $TestRun.FailedBlocksCount = $TestRun.FailedBlocks.Count
    $TestRun.FailedContainersCount = $TestRun.FailedContainers.Count

    $TestRun.Result = if (0 -lt ($TestRun.FailedCount + $TestRun.FailedBlocksCount + $TestRun.FailedContainersCount)) {
        "Failed"
    }
    else {
        "Passed"
    }
}

function Get-RSpecObjectDecoratorPlugin () {
    New-PluginObject -Name "RSpecObjectDecoratorPlugin" `
        -EachTestTeardownEnd {
        param ($Context)

        # TODO: consider moving this into the core if those results are just what we need, but look first at Gherkin and how many of those results are RSpec specific and how many are Gherkin specific
        #TODO: also this is a plugin because it needs to run before the error processing kicks in, this mixes concerns here imho, and needs to be revisited, because the error writing logic is now dependent on this plugin
        Add-RSpecTestObjectProperties $Context.Test
    } -EachBlockTeardownEnd {
        param($Context)
        #TODO: also this is a plugin because it needs to run before the error processing kicks in (to be able to report correctly formatted errors on scrren in case teardown failure), this mixes concerns here imho, and needs to be revisited, because the error writing logic is now dependent on this plugin
        Add-RSpecBlockObjectProperties $Context.Block
    }
}

function New-PesterConfiguration {
    [CmdletBinding()]
    param()

    [PesterConfiguration]@{}
}

function Remove-RSpecNonPublicProperties ($run){
    # $runProperties = @(
    #     'Configuration'
    #     'Containers'
    #     'ExecutedAt'
    #     'FailedBlocksCount'
    #     'FailedCount'
    #     'NotRunCount'
    #     'PassedCount'
    #     'PSBoundParameters'
    #     'Result'
    #     'SkippedCount'
    #     'TotalCount'
    #     'Duration'
    # )

    # $containerProperties = @(
    #     'Blocks'
    #     'Content'
    #     'ErrorRecord'
    #     'Executed'
    #     'ExecutedAt'
    #     'FailedCount'
    #     'NotRunCount'
    #     'PassedCount'
    #     'Result'
    #     'ShouldRun'
    #     'Skip'
    #     'SkippedCount'
    #     'Duration'
    #     'Type' # needed because of nunit export path expansion
    #     'TotalCount'
    # )

    # $blockProperties = @(
    #     'Blocks'
    #     'ErrorRecord'
    #     'Executed'
    #     'ExecutedAt'
    #     'FailedCount'
    #     'Name'
    #     'NotRunCount'
    #     'PassedCount'
    #     'Path'
    #     'Result'
    #     'ScriptBlock'
    #     'ShouldRun'
    #     'Skip'
    #     'SkippedCount'
    #     'StandardOutput'
    #     'Tag'
    #     'Tests'
    #     'Duration'
    #     'TotalCount'
    # )

    # $testProperties = @(
    #     'Data'
    #     'ErrorRecord'
    #     'Executed'
    #     'ExecutedAt'
    #     'ExpandedName'
    #     'Id' # needed because of grouping of data driven tests in nunit export
    #     'Name'
    #     'Path'
    #     'Result'
    #     'ScriptBlock'
    #     'ShouldRun'
    #     'Skip'
    #     'Skipped'
    #     'StandardOutput'
    #     'Tag'
    #     'Duration'
    # )

    Fold-Run $run -OnRun {
        param($i)
        # $ps = $i.PsObject.Properties.Name
        # foreach ($p in $ps) {
        #     if ($p -like 'Plugin*') {
        #         $i.PsObject.Properties.Remove($p)
        #     }
        # }

        $i.PluginConfiguration = $null
        $i.PluginData = $null
        $i.Plugins = $null

    } -OnContainer {
        param($i)
        # $ps = $i.PsObject.Properties.Name
        # foreach ($p in $ps) {
        #     if ($p -like 'Own*') {
        #         $i.PsObject.Properties.Remove($p)
        #     }
        # }

        # $i.FrameworkData = $null
        # $i.PluginConfiguration = $null
        # $i.PluginData = $null
        # $i.Plugins = $null

    } -OnBlock {
        param($i)
        # $ps = $i.PsObject.Properties.Name
        # foreach ($p in $ps) {
        #     if ($p -eq 'FrameworkData' -or $p -like 'Own*' -or $p -like 'Plugin*') {
        #         $i.PsObject.Properties.Remove($p)
        #     }
        # }

        $i.FrameworkData = $null
        $i.PluginData = $null

    } -OnTest {
        param($i)
        # $ps = $i.PsObject.Properties.Name
        # foreach ($p in $ps) {
        #     if ($p -eq 'FrameworkData' -or $p -like 'Plugin*') {
        #         $i.PsObject.Properties.Remove($p)
        #     }
        # }

        $i.FrameworkData = $null
        $i.PluginData = $null
    }
}
# file src\Pester.ps1
function Assert-ValidAssertionName {
    param([string]$Name)
    if ($Name -notmatch '^\S+$') {
        throw "Assertion name '$name' is invalid, assertion name must be a single word."
    }
}

function Assert-ValidAssertionAlias {
    param([string[]]$Alias)
    if ($Alias -notmatch '^\S+$') {
        throw "Assertion alias '$string' is invalid, assertion alias must be a single word."
    }
}

function Add-ShouldOperator {
    <#
.SYNOPSIS
    Register a Should Operator with Pester
.DESCRIPTION
    This function allows you to create custom Should assertions.
.EXAMPLE
    function BeAwesome($ActualValue, [switch] $Negate)
    {

        [bool] $succeeded = $ActualValue -eq 'Awesome'
        if ($Negate) { $succeeded = -not $succeeded }

        if (-not $succeeded)
        {
            if ($Negate)
            {
                $failureMessage = "{$ActualValue} is Awesome"
            }
            else
            {
                $failureMessage = "{$ActualValue} is not Awesome"
            }
        }

        return New-Object psobject -Property @{
            Succeeded      = $succeeded
            FailureMessage = $failureMessage
        }
    }

    Add-ShouldOperator -Name  BeAwesome `
                        -Test  $function:BeAwesome `
                        -Alias 'BA'

    PS C:\> "bad" | should -BeAwesome
    {bad} is not Awesome
.PARAMETER Name
    The name of the assertion. This will become a Named Parameter of Should.
.PARAMETER Test
    The test function. The function must return a PSObject with a [Bool]succeeded and a [string]failureMessage property.
.PARAMETER Alias
    A list of aliases for the Named Parameter.
.PARAMETER SupportsArrayInput
    Does the test function support the passing an array of values to test.
.PARAMETER InternalName
    If -Name is different from the actual function name, record the actual function name here.
    Used by Get-ShouldOperator to pull function help.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $Name,

        [Parameter(Mandatory = $true)]
        [scriptblock] $Test,

        [ValidateNotNullOrEmpty()]
        [AllowEmptyCollection()]
        [string[]] $Alias = @(),

        [Parameter()]
        [string] $InternalName,

        [switch] $SupportsArrayInput
    )

    $entry = New-Object psobject -Property @{
        Test               = $Test
        SupportsArrayInput = [bool]$SupportsArrayInput
        Name               = $Name
        Alias              = $Alias
        InternalName       = If ($InternalName) {
            $InternalName
        }
        Else {
            $Name
        }
    }
    if (Test-AssertionOperatorIsDuplicate -Operator $entry) {
        # This is an exact duplicate of an existing assertion operator.
        return
    }

    $namesToCheck = @(
        $Name
        $Alias
    )

    Assert-AssertionOperatorNameIsUnique -Name $namesToCheck

    $script:AssertionOperators[$Name] = $entry

    foreach ($string in $Alias | Where { -not ([string]::IsNullOrWhiteSpace($_))}) {
        Assert-ValidAssertionAlias -Alias $string
        $script:AssertionAliases[$string] = $Name
    }

    Add-AssertionDynamicParameterSet -AssertionEntry $entry
}

function Test-AssertionOperatorIsDuplicate {
    param (
        [psobject] $Operator
    )

    $existing = $script:AssertionOperators[$Operator.Name]
    if (-not $existing) {
        return $false
    }

    return $Operator.SupportsArrayInput -eq $existing.SupportsArrayInput -and
    $Operator.Test.ToString() -eq $existing.Test.ToString() -and
    -not (Compare-Object $Operator.Alias $existing.Alias)
}
function Assert-AssertionOperatorNameIsUnique {
    param (
        [string[]] $Name
    )

    foreach ($string in $name | Where { -not ([string]::IsNullOrWhiteSpace($_))}) {
        Assert-ValidAssertionName -Name $string

        if ($script:AssertionOperators.ContainsKey($string)) {
            throw "Assertion operator name '$string' has been added multiple times."
        }

        if ($script:AssertionAliases.ContainsKey($string)) {
            throw "Assertion operator name '$string' already exists as an alias for operator '$($script:AssertionAliases[$key])'"
        }
    }
}

function Add-AssertionDynamicParameterSet {
    param (
        [object] $AssertionEntry
    )

    ${function:__AssertionTest__} = $AssertionEntry.Test
    $commandInfo = Get-Command __AssertionTest__ -CommandType Function
    $metadata = [System.Management.Automation.CommandMetadata]$commandInfo

    $attribute = New-Object Management.Automation.ParameterAttribute
    $attribute.ParameterSetName = $AssertionEntry.Name
    $attribute.Mandatory = $true

    $attributeCollection = New-Object Collections.ObjectModel.Collection[Attribute]
    $null = $attributeCollection.Add($attribute)
    if (-not ([string]::IsNullOrWhiteSpace($AssertionEntry.Alias))) {
        Assert-ValidAssertionAlias -Alias $AssertionEntry.Alias
        $attribute = New-Object System.Management.Automation.AliasAttribute($AssertionEntry.Alias)
        $attributeCollection.Add($attribute)
    }

    $dynamic = New-Object System.Management.Automation.RuntimeDefinedParameter($AssertionEntry.Name, [switch], $attributeCollection)
    $null = $script:AssertionDynamicParams.Add($AssertionEntry.Name, $dynamic)

    if ($script:AssertionDynamicParams.ContainsKey('Not')) {
        $dynamic = $script:AssertionDynamicParams['Not']
    }
    else {
        $dynamic = New-Object System.Management.Automation.RuntimeDefinedParameter('Not', [switch], (New-Object System.Collections.ObjectModel.Collection[Attribute]))
        $null = $script:AssertionDynamicParams.Add('Not', $dynamic)
    }

    $attribute = New-Object System.Management.Automation.ParameterAttribute
    $attribute.ParameterSetName = $AssertionEntry.Name
    $attribute.Mandatory = $false
    $null = $dynamic.Attributes.Add($attribute)

    $i = 1
    foreach ($parameter in $metadata.Parameters.Values) {
        # common parameters that are already defined
        if ($parameter.Name -eq 'ActualValue' -or $parameter.Name -eq 'Not' -or $parameter.Name -eq 'Negate') {
            continue
        }


        if ($script:AssertionOperators.ContainsKey($parameter.Name) -or $script:AssertionAliases.ContainsKey($parameter.Name)) {
            throw "Test block for assertion operator $($AssertionEntry.Name) contains a parameter named $($parameter.Name), which conflicts with another assertion operator's name or alias."
        }

        foreach ($alias in $parameter.Aliases) {
            if ($script:AssertionOperators.ContainsKey($alias) -or $script:AssertionAliases.ContainsKey($alias)) {
                throw "Test block for assertion operator $($AssertionEntry.Name) contains a parameter named $($parameter.Name) with alias $alias, which conflicts with another assertion operator's name or alias."
            }
        }

        if ($script:AssertionDynamicParams.ContainsKey($parameter.Name)) {
            $dynamic = $script:AssertionDynamicParams[$parameter.Name]
        }
        else {
            # We deliberately use a type of [object] here to avoid conflicts between different assertion operators that may use the same parameter name.
            # We also don't bother to try to copy transformation / validation attributes here for the same reason.
            # Because we'll be passing these parameters on to the actual test function later, any errors will come out at that time.

            # few years later: using [object] causes problems with switch params (in my case -PassThru), because then we cannot use them without defining a value
            # so for switches we must prefer the conflicts over type
            if ([switch] -eq $parameter.ParameterType) {
                $type = [switch]
            }
            else {
                $type = [object]
            }

            $dynamic = New-Object System.Management.Automation.RuntimeDefinedParameter($parameter.Name, $type, (New-Object System.Collections.ObjectModel.Collection[Attribute]))
            $null = $script:AssertionDynamicParams.Add($parameter.Name, $dynamic)
        }

        $attribute = New-Object Management.Automation.ParameterAttribute
        $attribute.ParameterSetName = $AssertionEntry.Name
        $attribute.Mandatory = $false
        $attribute.Position = ($i++)

        $null = $dynamic.Attributes.Add($attribute)
    }
}

function Get-AssertionOperatorEntry([string] $Name) {
    return $script:AssertionOperators[$Name]
}

function Get-AssertionDynamicParams {
    return $script:AssertionDynamicParams
}

function Has-Flag {
    param
    (
        [Parameter(Mandatory = $true)]
        [Pester.OutputTypes]
        $Setting,
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [Pester.OutputTypes]
        $Value
    )

    0 -ne ($Setting -band $Value)
}

function Invoke-Pester {
    [CmdletBinding(DefaultParameterSetName = 'Simple')]
    param(
        [Parameter(Position = 0, Mandatory = 0, ParameterSetName = "Simple")]
        [Parameter(Position = 0, Mandatory = 0, ParameterSetName = "Legacy")]  # Legacy set for v4 compatibility during migration - deprecated
        [Alias("Script")] # Legacy set for v4 compatibility during migration - deprecated
        [String[]] $Path = '.',
        [Parameter(ParameterSetName = "Simple")]
        [String[]] $ExcludePath = @(),

        [Parameter(ParameterSetName = "Simple")]
        [Parameter(Position = 4, Mandatory = 0, ParameterSetName = "Legacy")]  # Legacy set for v4 compatibility during migration - deprecated
        [Alias("Tag")] # Legacy set for v4 compatibility during migration - deprecated
        [Alias("Tags")] # Legacy set for v4 compatibility during migration - deprecated
        [string[]] $TagFilter,

        [Parameter(ParameterSetName = "Simple")]
        [Parameter(ParameterSetName = "Legacy")] # Legacy set for v4 compatibility during migration - deprecated
        [string[]] $ExcludeTagFilter,

        [Parameter(Position = 1, Mandatory = 0, ParameterSetName = "Legacy")]  # Legacy set for v4 compatibility during migration - deprecated
        [Parameter(ParameterSetName = "Simple")]
        [Alias("Name")]  # Legacy set for v4 compatibility during migration - deprecated
        [string[]] $FullNameFilter,

        [Parameter(ParameterSetName = "Simple")]
        [Switch] $CI,

        [Parameter(ParameterSetName = "Simple")]
        [ValidateSet("Diagnostic", "Detailed", "Normal", "Minimal", "None")]
        [String] $Output = "Normal",

        [Parameter(ParameterSetName = "Simple")]
        [Parameter(ParameterSetName = "Legacy")] # Legacy set for v4 compatibility during migration - deprecated
        [Switch] $PassThru,

        [Parameter(ParameterSetName = "Advanced")]
        [PesterConfiguration] $Configuration,

        # rest of the Legacy set
        [Parameter(Position = 2, Mandatory = 0, ParameterSetName = "Legacy")]  # Legacy set for v4 compatibility during migration - deprecated
        [switch]$EnableExit,

        [Parameter(ParameterSetName = "Legacy")] # Legacy set for v4 compatibility during migration - deprecated
        [object[]] $CodeCoverage = @(),

        [Parameter(ParameterSetName = "Legacy")] # Legacy set for v4 compatibility during migration - deprecated
        [string] $CodeCoverageOutputFile,

        [Parameter(ParameterSetName = "Legacy")] # Legacy set for v4 compatibility during migration - deprecated
        [string] $CodeCoverageOutputFileEncoding = 'utf8',

        [Parameter(ParameterSetName = "Legacy")] # Legacy set for v4 compatibility during migration - deprecated
        [ValidateSet('JaCoCo')]
        [String]$CodeCoverageOutputFileFormat = "JaCoCo",

        [Parameter(ParameterSetName = "Legacy")] # Legacy set for v4 compatibility during migration - deprecated
        [Switch]$Strict,

        [Parameter(Mandatory = $true, ParameterSetName = "Legacy")] # Legacy set for v4 compatibility during migration - deprecated
        [string] $OutputFile,

        [Parameter(ParameterSetName = "Legacy")] # Legacy set for v4 compatibility during migration - deprecated
        [ValidateSet('NUnitXml', 'JUnitXml')]
        [string] $OutputFormat = 'NUnitXml',

        [Parameter(ParameterSetName = "Legacy")] # Legacy set for v4 compatibility during migration - deprecated
        [Switch]$Quiet,

        [Parameter(ParameterSetName = "Legacy")] # Legacy set for v4 compatibility during migration - deprecated
        [object]$PesterOption,

        [Parameter(ParameterSetName = "Legacy")] # Legacy set for v4 compatibility during migration - deprecated
        [Pester.OutputTypes]$Show = 'All'
    )
    begin {
        $start = [DateTime]::Now
        # this will inherit to child scopes and allow Describe / Context to run directly from a file or command line
        $invokedViaInvokePester = $true

        # TODO: Remove all references to mock table, there should not be many.
        $script:mockTable = @{}
        # todo: move mock cleanup to BeforeAllBlockContainer when there is any
        Remove-MockFunctionsAndAliases
    }

    end {
        try {
            if ('Simple' -eq $PSCmdlet.ParameterSetName) {
                # populate config from parameters and remove them so we
                # don't inherit them to child functions by accident

                $Configuration = [PesterConfiguration]::Default

                if ($PSBoundParameters.ContainsKey('Path')) {
                    if ($null -ne $Path) {
                        if (@($Path)[0] -is [System.Collections.IDictionary]) {
                            throw "Passing hashtable configuration to -Path / -Script is currently not supported in Pester 5.0. Please provide just paths, as an array of strings."
                        }

                        $Configuration.Run.Path = $Path
                    }

                    Get-Variable 'Path' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('ExcludePath')) {
                    if ($null -ne $ExcludePath) {
                        $Configuration.Run.ExcludePath = $ExcludePath
                    }

                    Get-Variable 'ExcludePath' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('TagFilter')) {
                    if ($null -ne $TagFilter -and 0 -lt @($TagFilter).Count) {
                        $Configuration.Filter.Tag = $TagFilter
                    }

                    Get-Variable 'TagFilter' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('ExcludeTagFilter')) {
                    if ($null -ne $ExcludeTagFilter -and 0 -lt @($ExludeTagFilter).Count) {
                        $Configuration.Filter.ExcludeTag = $ExcludeTagFilter
                    }

                    Get-Variable 'ExcludeTagFilter' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('FullNameFilter')) {
                    if ($null -ne $FullNameFilter -and 0 -lt @($FullNameFilter).Count){
                        $Configuration.Filter.FullName = $FullNameFilter
                    }

                    Get-Variable 'FullNameFilter' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('CI')) {
                    if ($CI) {
                        $Configuration.Run.Exit = $true
                        $Configuration.CodeCoverage.Enabled = $true
                        $Configuration.TestResult.Enabled = $true
                    }

                    Get-Variable 'CI' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('Output')) {
                    if ($null -ne $Output) {
                        $Configuration.Output.Verbosity = $Output
                    }

                    Get-Variable 'Output' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('PassThru')) {
                    if ($null -ne $PassThru) {
                        $Configuration.Run.PassThru = [bool] $PassThru
                    }

                    Get-Variable 'PassThru' -Scope Local | Remove-Variable
                }
            }

            if ('Legacy' -eq $PSCmdlet.ParameterSetName) {
                Write-Warning "You are using Legacy parameter set that adapts Pester 5 syntax to Pester 4 syntax. This parameter set is deprecated, and does not work 100%. The -Strict and -PesterOption parameters are ignored, and providing advanced configuration to -Path (-Script), and -CodeCoverage via a hash table does not work. Please refer to https://github.com/pester/Pester/releases/tag/5.0.1#legacy-parameter-set for more information."
                # populate config from parameters and remove them so we
                # don't inherit them to child functions by accident

                $Configuration = [PesterConfiguration]::Default

                if ($PSBoundParameters.ContainsKey('Path')) {
                    if ($null -ne $Path) {
                        $Configuration.Run.Path = $Path
                    }

                    Get-Variable 'Path' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('FullNameFilter')) {
                    if ($null -ne $FullNameFilter -and 0 -lt @($FullNameFilter).Count){
                        $Configuration.Filter.FullName = $FullNameFilter
                    }

                    Get-Variable 'FullNameFilter' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('EnableExit')) {
                    if ($EnableExit) {
                        $Configuration.Run.Exit = $true
                    }

                    Get-Variable 'EnableExit' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('TagFilter')) {
                    if ($null -ne $TagFilter -and 0 -lt @($TagFilter).Count) {
                        $Configuration.Filter.Tag = $TagFilter
                    }

                    Get-Variable 'TagFilter' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('ExcludeTagFilter')) {
                    if ($null -ne $ExcludeTagFilter -and 0 -lt @($ExludeTagFilter).Count) {
                        $Configuration.Filter.ExcludeTag = $ExcludeTagFilter
                    }

                    Get-Variable 'ExcludeTagFilter' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('PassThru')) {
                    if ($null -ne $PassThru) {
                        $Configuration.Run.PassThru = [bool] $PassThru
                    }

                    Get-Variable 'PassThru' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('CodeCoverage')) {

                    # advanced CC options won't work (hashtable)
                    if ($null -ne $CodeCoverage) {
                        $Configuration.CodeCoverage.Enabled = $true
                        $Configuration.CodeCoverage.Path = $CodeCoverage
                    }

                    Get-Variable 'CodeCoverage' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('CodeCoverageOutputFile')) {
                    if ($null -ne $CodeCoverageOutputFile) {
                        $Configuration.CodeCoverage.Enabled = $true
                        $Configuration.CodeCoverage.OutputPath = $CodeCoverageOutputFile
                    }

                    Get-Variable 'CodeCoverageOutputFile' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('CodeCoverageOutputFileEncoding')) {
                    if ($null -ne $CodeCoverageOutputFileEncoding) {
                        $Configuration.CodeCoverage.Enabled = $true
                        $Configuration.CodeCoverage.OutputEncoding = $CodeCoverageOutputFileEncoding
                    }

                    Get-Variable 'CodeCoverageOutputFileEncoding' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('CodeCoverageOutputFileFormat')) {
                    if ($null -ne $CodeCoverageOutputFileFormat) {
                        $Configuration.CodeCoverage.Enabled = $true
                        $Configuration.CodeCoverage.OutputFormat = $CodeCoverageOutputFileFormat
                    }

                    Get-Variable 'CodeCoverageOutputFileFormat' -Scope Local | Remove-Variable
                }

                if (-not $PSBoundParameters.ContainsKey('Strict')) {
                    Get-Variable 'Strict' -Scope Local | Remove-Variable
                }

                if (-not $PSBoundParameters.ContainsKey('PesterOption')) {
                    Get-Variable 'PesterOption' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('OutputFile')) {
                    if ($null -ne $OutputFile -and 0 -lt @($OutputFile).Count){
                        $Configuration.TestResult.Enabled = $true
                        $Configuration.TestResult.OutputPath = $OutputFile
                    }

                    Get-Variable 'OutputFile' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('OutputFormat')) {
                    if ($null -ne $OutputFormat -and 0 -lt @($OutputFormat).Count) {
                        if ("JUnitXml" -eq $OutputFormat) {
                            throw "JUnitXml is currently not supported in Pester 5."
                        }

                        $Configuration.TestResult.OutputFormat = $OutputFormat
                    }

                    Get-Variable 'OutputFormat' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('Show')) {
                    if ($null -ne $Show) {
                        # most used v4 options are adapted, and it also takes v5 options to be able to migrate gradually
                        # without switching the whole param set just to get Diagnostic output
                        # {None | Default | Passed | Failed | Pending | Skipped | Inconclusive | Describe | Context | Summary | Header | Fails | All}
                        $verbosity = switch ($Show) {
                            "All" { "Detailed" }
                            "Default" { "Detailed" }
                            "Fails" { "Normal" }
                            "Diagnostic" { "Diagnostic" }
                            "Detailed" { "Detailed" }
                            "Normal" { "Normal" }
                            "Minimal" { "Minimal" }
                            "None" { "None" }
                            default { "Detailed" }
                        }

                        $Configuration.Output.Verbosity = $verbosity
                    }

                    Get-Variable 'Quiet' -Scope Local | Remove-Variable
                }

                if ($PSBoundParameters.ContainsKey('Quiet')) {
                    if ($null -ne $Quiet) {
                        if ($Quiet) {
                            $Configuration.Output.Verbosity = 'None'
                        }
                    }

                    Get-Variable 'Quiet' -Scope Local | Remove-Variable
                }
            }

            # maybe -IgnorePesterPreference to avoid using $PesterPreference from the context

            $callerPreference = [PesterConfiguration] $PSCmdlet.SessionState.PSVariable.GetValue("PesterPreference")
            $hasCallerPreference = $null -ne $callerPreference

            # we never want to use and keep the pester preference directly,
            # because then the settings are modified on an object that outlives the
            # invoke-pester run and we leak changes from this run to the next
            # such as filters set in the first run will end up in the next run as well
            #
            # preference is inherited in all subsequent calls in this session state
            # but we still pass it explicitly where practical
            if (-not $hasCallerPreference) {
                [PesterConfiguration] $PesterPreference = $Configuration
            }
            elseif ($hasCallerPreference) {
                [PesterConfiguration] $PesterPreference = [PesterConfiguration]::Merge($callerPreference, $Configuration)
            }

            Get-Variable 'Configuration' -Scope Local | Remove-Variable

            # $sessionState = Set-SessionStateHint -PassThru  -Hint "Caller - Captured in Invoke-Pester" -SessionState $PSCmdlet.SessionState
            $sessionState = $PSCmdlet.SessionState

            $pluginConfiguration = @{}
            $plugins = @()
            if ('None' -ne $PesterPreference.Output.Verbosity.Value) {
                $plugins += Get-WriteScreenPlugin -Verbosity $PesterPreference.Output.Verbosity.Value
            }

            if ('Diagnostic' -eq $PesterPreference.Output.Verbosity.Value) {
                $PesterPreference.Debug.WriteDebugMessages = $true
                $PesterPreference.Debug.WriteDebugMessagesFrom = "Discovery", "Skip", "Filter", "Mock", "CodeCoverage"
            }

            $plugins +=
            @(
                # decorator plugin needs to be added after output
                # because on teardown they will run in opposite order
                # and that way output can consume the fixed object that decorator
                # decorated, not nice but works
                Get-RSpecObjectDecoratorPlugin
                Get-TestDrivePlugin
            )

            if ("Windows" -eq (GetPesterOs)) {
                $plugins += @(Get-TestRegistryPlugin)
            }

            $plugins +=  @(Get-MockPlugin)

            if ($PesterPreference.CodeCoverage.Enabled.Value) {
                $paths = @(if (0 -lt $PesterPreference.CodeCoverage.Path.Value.Count) {
                        $PesterPreference.CodeCoverage.Path.Value
                    }
                    else {
                        # no paths specific to CodeCoverage were provided, resolve them from
                        # tests by using the whole directory in which the test or the
                        # provided directory. We might need another option to disable this convention.
                        @(foreach ($p in $PesterPreference.Run.Path.Value) {
                            # this is a bit ugly, but the logic here is
                            # that we check if the path exists,
                            # and if it does and is a file then we return the
                            # parent directory, otherwise we got a directory
                            # and return just it
                            $i = Get-Item $p
                            if ($i.PSIsContainer) {
                                Join-Path $i.FullName "*"
                            }
                            else {
                                Join-Path $i.Directory.FullName "*"
                            }
                        })
                    })

                $outputPath = if ([IO.Path]::IsPathRooted($PesterPreference.CodeCoverage.OutputPath.Value)) {
                        $PesterPreference.CodeCoverage.OutputPath.Value
                    }
                    else {
                        Join-Path $pwd.Path $PesterPreference.CodeCoverage.OutputPath.Value
                    }

                $CodeCoverage = @{
                    Enabled = $PesterPreference.CodeCoverage.Enabled.Value
                    OutputFormat = $PesterPreference.CodeCoverage.OutputFormat.Value
                    OutputPath = $outputPath
                    OutputEncoding = $PesterPreference.CodeCoverage.OutputEncoding.Value
                    ExcludeTests = $PesterPreference.CodeCoverage.ExcludeTests.Value
                    Path = @($paths)
                    TestExtension = $PesterPreference.Run.TestExtension.Value
                }

                $plugins += (Get-CoveragePlugin)
                $pluginConfiguration["Coverage"] = $CodeCoverage
            }

            $filter = New-FilterObject `
                -Tag $PesterPreference.Filter.Tag.Value `
                -ExcludeTag $PesterPreference.Filter.ExcludeTag.Value `
                -Line $PesterPreference.Filter.Line.Value `
                -FullName $PesterPreference.Filter.FullName.Value

            $containers = @()
            if (any $PesterPreference.Run.ScriptBlock.Value) {
                $containers += @( $PesterPreference.Run.ScriptBlock.Value | foreach { New-BlockContainerObject -ScriptBlock $_ })
            }

            if ((any $PesterPreference.Run.Path.Value)) {
                if ((none $PesterPreference.Run.ScriptBlock.Value) -or ((any $PesterPreference.Run.ScriptBlock.Value) -and '.' -ne $PesterPreference.Run.Path.Value[0])) {
                    #TODO: Skipping the invocation when scriptblock is provided and the default path, later keep path in the default parameter set and remove scriptblock from it, so get-help still shows . as the default value and we can still provide script blocks via an advanced settings parameter
                    # TODO: pass the startup options as context to Start instead of just paths

                    $containers += @(Find-File -Path $PesterPreference.Run.Path.Value -ExcludePath $PesterPreference.Run.ExcludePath.Value -Extension $PesterPreference.Run.TestExtension.Value | foreach { New-BlockContainerObject -File $_ })
                }
            }

            # monkey patching that we need global data for code coverage, this is problematic because code coverage should be setup once for the whole run, but because at the start everything was separated on container level the discovery is not done at this point, and we don't have any info about the containers apart from the path, or scriptblock content
            $pluginData = @{}

            $steps = $Plugins.Start
            if ($null -ne $steps -and 0 -lt @($steps).Count) {
                Invoke-PluginStep -Plugins $Plugins -Step Start -Context @{
                    Containers = $containers
                    Configuration = $pluginConfiguration
                    GlobalPluginData = $pluginData
                    WriteDebugMessages = $PesterPreference.Debug.WriteDebugMessages.Value
                    Write_PesterDebugMessage = if ($PesterPreference.Debug.WriteDebugMessages) { $script:SafeCommands['Write-PesterDebugMessage'] }
                } -ThrowOnFailure
            }

            if ((none $containers)) {
                throw "No test files were found and no scriptblocks were provided."
                return
            }

            $r = Invoke-Test -BlockContainer $containers -Plugin $plugins -PluginConfiguration $pluginConfiguration -SessionState $sessionState -Filter $filter -Configuration $PesterPreference

            foreach ($c in $r) {
                Fold-Container -Container $c  -OnTest { param($t) Add-RSpecTestObjectProperties $t }
            }

            $parameters = @{
                PSBoundParameters = $PSBoundParameters
            }

            $run = [Pester.Run]::Create()
            $run.Executed = $true
            $run.ExecutedAt = $start
            $run.PSBoundParameters = $PSBoundParameters
            $run.PluginConfiguration = $pluginConfiguration
            $run.Plugins = $Plugins
            $run.PluginData = $pluginData
            $run.Configuration = $PesterPreference
            $m = $ExecutionContext.SessionState.Module
            $run.Version = if ($m.PrivateData -and $m.PrivateData.PSData)
            {
                "$($m.Version)-$($m.PrivateData.PSData.PreRelease)"
            }
            else {
                $m.Version
            }

            $run.PSVersion = $PSVersionTable.PSVersion
            foreach ($i in @($r)) {
                $run.Containers.Add($i)
            }

            PostProcess-RSpecTestRun -TestRun $run

            $steps = $Plugins.End
            if ($null -ne $steps -and 0 -lt @($steps).Count) {
                Invoke-PluginStep -Plugins $Plugins -Step End -Context @{
                    TestRun = $run
                    Configuration = $pluginConfiguration
                } -ThrowOnFailure
            }

            if ($PesterPreference.TestResult.Enabled.Value) {
                Export-NunitReport $run $PesterPreference.TestResult.OutputPath.Value
            }

            if ($PesterPreference.CodeCoverage.Enabled.Value) {
                $breakpoints = @($run.PluginData.Coverage.CommandCoverage)
                $coverageReport = Get-CoverageReport -CommandCoverage $breakpoints
                $totalMilliseconds = $run.Duration.TotalMilliseconds
                $jaCoCoReport = Get-JaCoCoReportXml -CommandCoverage $breakpoints -TotalMilliseconds $totalMilliseconds -CoverageReport $coverageReport
                $jaCoCoReport | & $SafeCommands['Out-File'] $PesterPreference.CodeCoverage.OutputPath.Value -Encoding $PesterPreference.CodeCoverage.OutputEncoding.Value
            }

            if (-not $PesterPreference.Debug.ReturnRawResultObject.Value) {
                Remove-RSPecNonPublicProperties $run
            }

            if ($PesterPreference.Run.PassThru.Value) {
                $run
            }

            if ($PesterPreference.Run.Exit.Value -and 'Failed' -eq $run.Result) {
                exit ($run.FailedCount + $run.FailedBlocksCount + $run.FailedContainersCount)
            }
        }
        catch {
            Write-ErrorToScreen $_
            if ($PesterPreference.Run.Exit.Value) {
                exit -1
            }
        }
    }
}

function New-PesterOption {
    #TODO: move those options, right now I am just not exposing this function and added the testSuiteName
    <#
    .SYNOPSIS
    Creates an object that contains advanced options for Invoke-Pester
    .DESCRIPTION
    By using New-PesterOption you can set options what allow easier integration with external applications or
    modifies output generated by Invoke-Pester.
    The result of New-PesterOption need to be assigned to the parameter 'PesterOption' of the Invoke-Pester function.
    .PARAMETER IncludeVSCodeMarker
    When this switch is set, an extra line of output will be written to the console for test failures, making it easier
    for VSCode's parser to provide highlighting / tooltips on the line where the error occurred.
    .PARAMETER TestSuiteName
    When generating NUnit XML output, this controls the name assigned to the root "test-suite" element.  Defaults to "Pester".
    .PARAMETER ScriptBlockFilter
    Filters scriptblock based on the path and line number. This is intended for integration with external tools so we don't rely on names (strings) that can have expandable variables in them.
    .PARAMETER Experimental
    Enables experimental features of Pester to be enabled.
    .PARAMETER ShowScopeHints
    EXPERIMENTAL: Enables debugging output for debugging tranisition among scopes. (Experimental flag needs to be used to enable this.)

    .INPUTS
    None
    You cannot pipe input to this command.
    .OUTPUTS
    System.Management.Automation.PSObject
    .EXAMPLE
        PS > $Options = New-PesterOption -TestSuiteName "Tests - Set A"

        PS > Invoke-Pester -PesterOption $Options -Outputfile ".\Results-Set-A.xml" -OutputFormat NUnitXML

        The result of commands will be execution of tests and saving results of them in a NUnitMXL file where the root "test-suite"
        will be named "Tests - Set A".
    .LINK
    https://github.com/pester/Pester/wiki/New-PesterOption

    .LINK
    Invoke-Pester
    #>

    [CmdletBinding()]
    param (
        [switch] $IncludeVSCodeMarker,

        [ValidateNotNullOrEmpty()]
        [string] $TestSuiteName = 'Pester',

        [switch] $Experimental,

        [switch] $ShowScopeHints,

        [hashtable[]] $ScriptBlockFilter
    )

    # in PowerShell 2 Add-Member can attach properties only to
    # PSObjects, I could work around this by capturing all instances
    # in checking them during runtime, but that would bring a lot of
    # object management problems - so let's just not allow this in PowerShell 2
    if ($Experimental -and $ShowScopeHints) {
        if ($PSVersionTable.PSVersion.Major -lt 3) {
            throw "Scope hints cannot be used on PowerShell 2 due to limitations of Add-Member."
        }

        $script:DisableScopeHints = $false
    }
    else {
        $script:DisableScopeHints = $true
    }

    return & $script:SafeCommands['New-Object'] psobject -Property @{
        IncludeVSCodeMarker = [bool] $IncludeVSCodeMarker
        TestSuiteName       = $TestSuiteName
        ShowScopeHints      = $ShowScopeHints
        Experimental        = $Experimental
        ScriptBlockFilter   = $ScriptBlockFilter
    }
}

function ResolveTestScripts {
    param ([object[]] $Path)

    $resolvedScriptInfo = @(
        foreach ($object in $Path) {
            if ($object -is [System.Collections.IDictionary]) {
                $unresolvedPath = Get-DictionaryValueFromFirstKeyFound -Dictionary $object -Key 'Path', 'p'
                $script = Get-DictionaryValueFromFirstKeyFound -Dictionary $object -Key 'Script'
                $arguments = @(Get-DictionaryValueFromFirstKeyFound -Dictionary $object -Key 'Arguments', 'args', 'a')
                $parameters = Get-DictionaryValueFromFirstKeyFound -Dictionary $object -Key 'Parameters', 'params'

                if ($null -eq $Parameters) {
                    $Parameters = @{}
                }

                if ($unresolvedPath -isnot [string] -or $unresolvedPath -notmatch '\S' -and ($script -isnot [string] -or $script -notmatch '\S')) {
                    throw 'When passing hashtables to the -Path parameter, the Path key is mandatory, and must contain a single string.'
                }

                if ($null -ne $parameters -and $parameters -isnot [System.Collections.IDictionary]) {
                    throw 'When passing hashtables to the -Path parameter, the Parameters key (if present) must be assigned an IDictionary object.'
                }
            }
            else {
                $unresolvedPath = [string] $object
                $script = [string] $object
                $arguments = @()
                $parameters = @{}
            }

            if (-not [string]::IsNullOrEmpty($unresolvedPath)) {
                if ($unresolvedPath -notmatch '[\*\?\[\]]' -and
                    (& $script:SafeCommands['Test-Path'] -LiteralPath $unresolvedPath -PathType Leaf) -and
                    (& $script:SafeCommands['Get-Item'] -LiteralPath $unresolvedPath) -is [System.IO.FileInfo]) {
                    $extension = [System.IO.Path]::GetExtension($unresolvedPath)
                    if ($extension -ne '.ps1') {
                        & $script:SafeCommands['Write-Error'] "Script path '$unresolvedPath' is not a ps1 file."
                    }
                    else {
                        & $script:SafeCommands['New-Object'] psobject -Property @{
                            Path       = $unresolvedPath
                            Script     = $null
                            Arguments  = $arguments
                            Parameters = $parameters
                        }
                    }
                }
                else {
                    # World's longest pipeline?

                    & $script:SafeCommands['Resolve-Path'] -Path $unresolvedPath |
                        & $script:SafeCommands['Where-Object'] { $_.Provider.Name -eq 'FileSystem' } |
                        & $script:SafeCommands['Select-Object'] -ExpandProperty ProviderPath |
                        & $script:SafeCommands['Get-ChildItem'] -Include *.Tests.ps1 -Recurse |
                        & $script:SafeCommands['Where-Object'] { -not $_.PSIsContainer } |
                        & $script:SafeCommands['Select-Object'] -ExpandProperty FullName -Unique |
                        & $script:SafeCommands['ForEach-Object'] {
                        & $script:SafeCommands['New-Object'] psobject -Property @{
                            Path       = $_
                            Script     = $null
                            Arguments  = $arguments
                            Parameters = $parameters
                        }
                    }
                }
            }
            elseif (-not [string]::IsNullOrEmpty($script)) {
                & $script:SafeCommands['New-Object'] psobject -Property @{
                    Path       = $null
                    Script     = $script
                    Arguments  = $arguments
                    Parameters = $parameters
                }
            }
        }
    )

    # Here, we have the option of trying to weed out duplicate file paths that also contain identical
    # Parameters / Arguments.  However, we already make sure that each object in $Path didn't produce
    # any duplicate file paths, and if the caller happens to pass in a set of parameters that produce
    # dupes, maybe that's not our problem.  For now, just return what we found.

    $resolvedScriptInfo
}

function Get-DictionaryValueFromFirstKeyFound {
    param ([System.Collections.IDictionary] $Dictionary, [object[]] $Key)

    foreach ($keyToTry in $Key) {
        if ($Dictionary.Contains($keyToTry)) {
            return $Dictionary[$keyToTry]
        }
    }
}

function Set-PesterStatistics($Node) {
    if ($null -eq $Node) {
        $Node = $pester.TestActions
    }

    foreach ($action in $Node.Actions) {
        if ($action.Type -eq 'TestGroup') {
            Set-PesterStatistics -Node $action

            $Node.TotalCount += $action.TotalCount
            $Node.PassedCount += $action.PassedCount
            $Node.FailedCount += $action.FailedCount
            $Node.SkippedCount += $action.SkippedCount
            $Node.PendingCount += $action.PendingCount
            $Node.InconclusiveCount += $action.InconclusiveCount
        }
        elseif ($action.Type -eq 'TestCase') {
            $node.TotalCount++

            switch ($action.Result) {
                Passed {
                    $Node.PassedCount++; break;
                }
                Failed {
                    $Node.FailedCount++; break;
                }
                Skipped {
                    $Node.SkippedCount++; break;
                }
                Pending {
                    $Node.PendingCount++; break;
                }
                Inconclusive {
                    $Node.InconclusiveCount++; break;
                }
            }
        }
    }
}

function Contain-AnyStringLike ($Filter, $Collection) {
    foreach ($item in $Collection) {
        foreach ($value in $Filter) {
            if ($item -like $value) {
                return $true
            }
        }
    }
    return $false
}

function ConvertTo-Pester4Result {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        $PesterResult
    )
    process {
        $legacyResult = [PSCustomObject] @{
            Version = 4.99.0
            TagFilter = $null
            ExcludeTagFilter = $null
            TestNameFilter = $null
            ScriptBlockFilter = $null
            TotalCount = 0
            PassedCount = 0
            FailedCount = 0
            SkippedCount = 0
            PendingCount = 0
            InconclusiveCount = 0
            Time = [TimeSpan]::Zero
            TestResult = [System.Collections.Generic.List[object]]@()
        }
        $filter = $PesterResult.Configuration.Filter
        $legacyResult.TagFilter = if (0 -ne $filter.Tag.Value.Count) { $filter.Tag.Value }
        $legacyResult.ExcludeTagFilter = if (0 -ne $filter.ExcludeTag.Value.Count) { $filter.ExcludeTag.Value }
        $legacyResult.TestNameFilter = if (0 -ne $filter.TestNameFilter.Value.Count) { $filter.TestNameFilter.Value }
        $legacyResult.ScriptBlockFilter = if (0 -ne $filter.ScriptBlockFilter.Value.Count) { $filter.ScriptBlockFilter.Value }

        $sb = {
            param($test)

            if ("NotRun" -eq $test.Result) {
                return
            }

            $result = [PSCustomObject] @{
                Passed = "Passed" -eq $test.Result
                Result = $test.Result
                Time = $test.Duration
                Name = $test.Name

                # in the legacy result the top block is considered to be a Describe and any blocks inside of it are
                # considered to be Context and joined by '\'
                Describe = $test.Path[0]
                Context = $(if ($test.Path.Count -gt 2) { $test.Path[1..($test.Path.Count-2)] -join '\'})

                Show = $PesterResult.Configuration.Output.Verbosity.Value
                Parameters = $test.Data
                ParameterizedSuiteName = $test.DisplayName

                FailureMessage = $(if (any $test.ErrorRecord -and $null -ne $test.ErrorRecord[-1].Exception) { $test.ErrorRecord[-1].DisplayErrorMessage })
                ErrorRecord = $(if (any $test.ErrorRecord) { $test.ErrorRecord[-1] })
                StackTrace = $(if (any $test.ErrorRecord) { $test.ErrorRecord[1].DisplayStackTrace })
            }

            $null = $legacyResult.TestResult.Add($result)
        }


        Fold-Run $PesterResult -OnTest $sb -OnBlock {
            param($b)

            if (0 -ne $b.ErrorRecord.Count) {
                & $sb $b
            }
        }

        # the counts here include failed blocks as tests, that's we don't use
        # the normal properties on the reslt to count

        foreach ($r in $legacyResult.TestResult) {
            switch ($r.Result) {
                "Passed" {
                    $legacyResult.PassedCount++
                }
                "Failed" {
                    $legacyResult.FailedCount++
                }
                "Skipped" {
                    $legacyResult.SkippedCount++
                }
            }
        }
        $legacyResult.TotalCount = $legacyResult.TestResult.Count
        $legacyResult.PendingCount = 0
        $legacyResult.InconclusiveCount = 0
        $legacyResult.Time = $PesterResult.Duration

        $legacyResult
    }
}
# file src\functions\assertions\Be.ps1
#Be
function Should-Be ($ActualValue, $ExpectedValue, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Compares one object with another for equality
and throws if the two objects are not the same.

.EXAMPLE
$actual = "Actual value"
PS C:\>$actual | Should -Be "actual value"

This test will pass. -Be is not case sensitive.
For a case sensitive assertion, see -BeExactly.

.EXAMPLE
$actual = "Actual value"
PS C:\>$actual | Should -Be "not actual value"

This test will fail, as the two strings are not identical.
#>
    [bool] $succeeded = ArraysAreEqual $ActualValue $ExpectedValue

    if ($Negate) {
        $succeeded = -not $succeeded
    }

    $failureMessage = ''

    if (-not $succeeded) {
        if ($Negate) {
            $failureMessage = NotShouldBeFailureMessage -ActualValue $ActualValue -Expected $ExpectedValue -Because $Because
        }
        else {
            $failureMessage = ShouldBeFailureMessage -ActualValue $ActualValue -Expected $ExpectedValue -Because $Because
        }
    }

    return [PSCustomObject] @{
        Succeeded      = $succeeded
        FailureMessage = $failureMessage
    }
}

function ShouldBeFailureMessage($ActualValue, $ExpectedValue, $Because) {
    # This looks odd; it's to unroll single-element arrays so the "-is [string]" expression works properly.
    $ActualValue = $($ActualValue)
    $ExpectedValue = $($ExpectedValue)

    if (-not (($ExpectedValue -is [string]) -and ($ActualValue -is [string]))) {
        return "Expected $(Format-Nicely $ExpectedValue),$(if ($null -ne $Because) { Format-Because $Because }) but got $(Format-Nicely $ActualValue)."
    }
    <#joining the output strings to a single string here, otherwise I get
       Cannot find an overload for "Exception" and the argument count: "4".
       at line: 63 in C:\Users\nohwnd\github\pester\functions\Assertions\Should.ps1

    This is a quickwin solution, doing the join in the Should directly might be better
    way of doing this. But I don't want to mix two problems.
    #>
    (Get-CompareStringMessage -Expected $ExpectedValue -Actual $ActualValue -Because $Because) -join "`n"
}

function NotShouldBeFailureMessage($ActualValue, $ExpectedValue, $Because) {
    return "Expected $(Format-Nicely $ExpectedValue) to be different from the actual value,$(if ($null -ne $Because) { Format-Because $Because }) but got the same value."
}

Add-ShouldOperator -Name               Be `
    -InternalName       Should-Be `
    -Test               ${function:Should-Be} `
    -Alias              'EQ' `
    -SupportsArrayInput

#BeExactly
function Should-BeExactly($ActualValue, $ExpectedValue, $Because) {
    <#
.SYNOPSIS
Compares one object with another for equality and throws if the
two objects are not the same. This comparison is case sensitive.

.EXAMPLE
$actual = "Actual value"
PS C:\>$actual | Should -Be "Actual value"

This test will pass. The two strings are identical.

.EXAMPLE
$actual = "Actual value"
PS C:\>$actual | Should -Be "actual value"

This test will fail, as the two strings do not match case sensitivity.
#>
    [bool] $succeeded = ArraysAreEqual $ActualValue $ExpectedValue -CaseSensitive

    if ($Negate) {
        $succeeded = -not $succeeded
    }

    $failureMessage = ''

    if (-not $succeeded) {
        if ($Negate) {
            $failureMessage = NotShouldBeExactlyFailureMessage -ActualValue $ActualValue -ExpectedValue $ExpectedValue -Because $Because
        }
        else {
            $failureMessage = ShouldBeExactlyFailureMessage -ActualValue $ActualValue -ExpectedValue $ExpectedValue -Because $Because
        }
    }

    return [PSCustomObject] @{
        Succeeded      = $succeeded
        FailureMessage = $failureMessage
    }
}

function ShouldBeExactlyFailureMessage($ActualValue, $ExpectedValue, $Because) {
    # This looks odd; it's to unroll single-element arrays so the "-is [string]" expression works properly.
    $ActualValue = $($ActualValue)
    $ExpectedValue = $($ExpectedValue)

    if (-not (($ExpectedValue -is [string]) -and ($ActualValue -is [string]))) {
        return "Expected exactly $(Format-Nicely $ExpectedValue),$(if ($null -ne $Because) { Format-Because $Because }) but got $(Format-Nicely $ActualValue)."
    }
    <#joining the output strings to a single string here, otherwise I get
       Cannot find an overload for "Exception" and the argument count: "4".
       at line: 63 in C:\Users\nohwnd\github\pester\functions\Assertions\Should.ps1

    This is a quickwin solution, doing the join in the Should directly might be better
    way of doing this. But I don't want to mix two problems.
    #>
    (Get-CompareStringMessage -Expected $ExpectedValue -Actual $ActualValue -CaseSensitive -Because $Because) -join "`n"
}

function NotShouldBeExactlyFailureMessage($ActualValue, $ExpectedValue, $Because) {
    return "Expected $(Format-Nicely $ExpectedValue) to be different from the actual value,$(if ($null -ne $Because) { Format-Because $Because }) but got exactly the same value."
}

Add-ShouldOperator -Name               BeExactly `
    -InternalName       Should-BeExactly `
    -Test               ${function:Should-BeExactly} `
    -Alias              'CEQ' `
    -SupportsArrayInput


#common functions
function Get-CompareStringMessage {
    param(
        [Parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]$ExpectedValue,
        [Parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [String]$Actual,
        [switch]$CaseSensitive,
        $Because
    )

    $ExpectedValueLength = $ExpectedValue.Length
    $actualLength = $actual.Length
    $maxLength = if ($ExpectedValueLength -gt $actualLength) { $ExpectedValueLength } else { $actualLength }

    $differenceIndex = $null
    for ($i = 0; $i -lt $maxLength -and ($null -eq $differenceIndex); ++$i) {
        $differenceIndex = if ($CaseSensitive -and ($ExpectedValue[$i] -cne $actual[$i])) {
            $i
        }
        elseif ($ExpectedValue[$i] -ne $actual[$i]) {
            $i
        }
    }

    if ($null -ne $differenceIndex) {
        "Expected strings to be the same,$(if ($null -ne $Because) { Format-Because $Because }) but they were different."

        if ($ExpectedValue.Length -ne $actual.Length) {
            "Expected length: $ExpectedValueLength"
            "Actual length:   $actualLength"
            "Strings differ at index $differenceIndex."
        }
        else {
            "String lengths are both $ExpectedValueLength."
            "Strings differ at index $differenceIndex."
        }
        $ellipsis = "..."
        $excerptSize = 5;
        "Expected: '{0}'" -f (  Expand-SpecialCharacters -InputObject (Format-AsExcerpt -InputObject $ExpectedValue -startIndex $differenceIndex -excerptSize $excerptSize  -excerptMarker $ellipsis) )
        "But was:  '{0}'" -f ( Expand-SpecialCharacters -InputObject (Format-AsExcerpt -InputObject $actual -startIndex $differenceIndex -excerptSize $excerptSize -excerptMarker $ellipsis ) )
    }
}
function Format-AsExcerpt {
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [AllowEmptyString()]
        [string]$InputObject,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [int]$startIndex,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [int]$excerptSize,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [string]$excerptMarker
    )
    $InputObjectDisplay = [string]::Empty
    $displayDifferenceIndex = $startIndex - $excerptSize
    $maximumStringLength = 40
    $maximumSubstringLength = $excerptSize * 2
    $substringLength = $InputObject.Length - $displayDifferenceIndex
    if ($substringLength -gt $maximumSubstringLength) {
        $substringLength = $maximumSubstringLength
    }
    if ($displayDifferenceIndex + $substringLength -lt $InputObject.Length) {
        $endExcerptMarker = $excerptMarker
    }
    if ($displayDifferenceIndex -lt 0) {
        $displayDifferenceIndex = 0
    }
    if ($InputObject.length -ge $maximumStringLength) {
        if ($displayDifferenceIndex -ne 0) {
            $InputObjectDisplay = $excerptMarker
        }
        $InputObjectDisplay += $InputObject.Substring($displayDifferenceIndex, $substringLength) + $endExcerptMarker
    }
    else {
        $InputObjectDisplay = $InputObject
    }
    $InputObjectDisplay
}



function Expand-SpecialCharacters {
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [AllowEmptyString()]
        [string[]]$InputObject)
    process {
        $InputObject -replace "`n", "\n" -replace "`r", "\r" -replace "`t", "\t" -replace "`0", "\0" -replace "`b", "\b"
    }
}

function ArraysAreEqual {
    param (
        [object[]] $First,
        [object[]] $Second,
        [switch] $CaseSensitive,
        [int] $RecursionDepth = 0,
        [int] $RecursionLimit = 100
    )
    $RecursionDepth++

    if ($RecursionDepth -gt $RecursionLimit) {
        throw "Reached the recursion depth limit of $RecursionLimit when comparing arrays $First and $Second. Is one of your arrays cyclic?"
    }

    # Do not remove the subexpression @() operators in the following two lines; doing so can cause a
    # silly error in PowerShell v3.  (Null Reference exception from the PowerShell engine in a
    # method called CheckAutomationNullInCommandArgumentArray(System.Object[]) ).
    $firstNullOrEmpty = ArrayOrSingleElementIsNullOrEmpty -Array @($First)
    $secondNullOrEmpty = ArrayOrSingleElementIsNullOrEmpty -Array @($Second)

    if ($firstNullOrEmpty -or $secondNullOrEmpty) {
        return $firstNullOrEmpty -and $secondNullOrEmpty
    }

    if ($First.Count -ne $Second.Count) {
        return $false
    }

    for ($i = 0; $i -lt $First.Count; $i++) {
        if ((IsArray $First[$i]) -or (IsArray $Second[$i])) {
            if (-not (ArraysAreEqual -First $First[$i] -Second $Second[$i] -CaseSensitive:$CaseSensitive -RecursionDepth $RecursionDepth -RecursionLimit $RecursionLimit)) {
                return $false
            }
        }
        else {
            if ($CaseSensitive) {
                $comparer = { param($Actual, $Expected) $Expected -ceq $Actual }
            }
            else {
                $comparer = { param($Actual, $Expected) $Expected -eq $Actual }
            }

            if (-not (& $comparer $First[$i] $Second[$i])) {
                return $false
            }
        }
    }

    return $true
}

function ArrayOrSingleElementIsNullOrEmpty {
    param ([object[]] $Array)

    return $null -eq $Array -or $Array.Count -eq 0 -or ($Array.Count -eq 1 -and $null -eq $Array[0])
}

function IsArray {
    param ([object] $InputObject)

    # Changing this could cause infinite recursion in ArraysAreEqual.
    # see https://github.com/pester/Pester/issues/785#issuecomment-322794011
    return $InputObject -is [Array]
}

function ReplaceValueInArray {
    param (
        [object[]] $Array,
        [object] $Value,
        [object] $NewValue
    )

    foreach ($object in $Array) {
        if ($Value -eq $object) {
            $NewValue
        }
        elseif (@($object).Count -gt 1) {
            ReplaceValueInArray -Array @($object) -Value $Value -NewValue $NewValue
        }
        else {
            $object
        }
    }
}
# file src\functions\assertions\BeGreaterThan.ps1
function Should-BeGreaterThan($ActualValue, $ExpectedValue, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Asserts that a number (or other comparable value) is greater than an expected value.
Uses PowerShell's -gt operator to compare the two values.

.EXAMPLE
2 | Should -BeGreaterThan 0
This test passes, as PowerShell evaluates `2 -gt 0` as true.
#>
    if ($Negate) {
        return Should-BeLessOrEqual -ActualValue $ActualValue -ExpectedValue $ExpectedValue -Negate:$false -Because $Because
    }

    if ($ActualValue -le $ExpectedValue) {
        return [PSCustomObject] @{
            Succeeded      = $false
            FailureMessage = "Expected the actual value to be greater than $(Format-Nicely $ExpectedValue),$(Format-Because $Because) but got $(Format-Nicely $ActualValue)."
        }
    }

    return [PSCustomObject] @{
        Succeeded = $true
    }
}


function Should-BeLessOrEqual($ActualValue, $ExpectedValue, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Asserts that a number (or other comparable value) is lower than, or equal to an expected value.
Uses PowerShell's -le operator to compare the two values.

.EXAMPLE
1 | Should -BeLessOrEqual 10
This test passes, as PowerShell evaluates `1 -le 10` as true.

.EXAMPLE
10 | Should -BeLessOrEqual 10
This test also passes, as PowerShell evaluates `10 -le 10` as true.
#>
    if ($Negate) {
        return Should-BeGreaterThan -ActualValue $ActualValue -ExpectedValue $ExpectedValue -Negate:$false -Because $Because
    }

    if ($ActualValue -gt $ExpectedValue) {
        return [PSCustomObject] @{
            Succeeded      = $false
            FailureMessage = "Expected the actual value to be less than or equal to $(Format-Nicely $ExpectedValue),$(Format-Because $Because) but got $(Format-Nicely $ActualValue)."
        }
    }

    return [PSCustomObject] @{
        Succeeded = $true
    }
}

Add-ShouldOperator -Name         BeGreaterThan `
    -InternalName Should-BeGreaterThan `
    -Test         ${function:Should-BeGreaterThan} `
    -Alias        'GT'

Add-ShouldOperator -Name         BeLessOrEqual `
    -InternalName Should-BeLessOrEqual `
    -Test         ${function:Should-BeLessOrEqual} `
    -Alias        'LE'

#keeping tests happy
function ShouldBeGreaterThanFailureMessage() {
}
function NotShouldBeGreaterThanFailureMessage() {
}

function ShouldBeLessOrEqualFailureMessage() {
}
function NotShouldBeLessOrEqualFailureMessage() {
}
# file src\functions\assertions\BeIn.ps1
function Should-BeIn($ActualValue, $ExpectedValue, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Asserts that a collection of values contain a specific value.
Uses PowerShell's -contains operator to confirm.

.EXAMPLE
1 | Should -BeIn @(1,2,3,'a','b','c')
This test passes, as 1 exists in the provided collection.
#>
    [bool] $succeeded = $ExpectedValue -contains $ActualValue
    if ($Negate) {
        $succeeded = -not $succeeded
    }

    if (-not $succeeded) {
        if ($Negate) {
            return [PSCustomObject] @{
                Succeeded      = $false
                FailureMessage = "Expected collection $(Format-Nicely $ExpectedValue) to not contain $(Format-Nicely $ActualValue),$(Format-Because $Because) but it was found."
            }
        }
        else {
            return [PSCustomObject] @{
                Succeeded      = $false
                FailureMessage = "Expected collection $(Format-Nicely $ExpectedValue) to contain $(Format-Nicely $ActualValue),$(Format-Because $Because) but it was not found."
            }
        }
    }

    return [PSCustomObject] @{
        Succeeded = $true
    }
}

Add-ShouldOperator -Name         BeIn `
    -InternalName Should-BeIn `
    -Test         ${function:Should-BeIn}


function ShouldBeInFailureMessage() {
}
function NotShouldBeInFailureMessage() {
}
# file src\functions\assertions\BeLessThan.ps1
function Should-BeLessThan($ActualValue, $ExpectedValue, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Asserts that a number (or other comparable value) is lower than an expected value.
Uses PowerShell's -lt operator to compare the two values.

.EXAMPLE
1 | Should -BeLessThan 10
This test passes, as PowerShell evaluates `1 -lt 10` as true.
#>
    if ($Negate) {
        return Should-BeGreaterOrEqual -ActualValue $ActualValue -ExpectedValue $ExpectedValue -Negate:$false -Because $Because
    }

    if ($ActualValue -ge $ExpectedValue) {
        return [PSCustomObject] @{
            Succeeded      = $false
            FailureMessage = "Expected the actual value to be less than $(Format-Nicely $ExpectedValue),$(Format-Because $Because) but got $(Format-Nicely $ActualValue)."
        }
    }

    return [PSCustomObject] @{
        Succeeded = $true
    }
}


function Should-BeGreaterOrEqual($ActualValue, $ExpectedValue, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Asserts that a number (or other comparable value) is greater than or equal to an expected value.
Uses PowerShell's -ge operator to compare the two values.

.EXAMPLE
2 | Should -BeGreaterOrEqual 0
This test passes, as PowerShell evaluates `2 -ge 0` as true.

.EXAMPLE
2 | Should -BeGreaterOrEqual 2
This test also passes, as PowerShell evaluates `2 -ge 2` as true.
#>
    if ($Negate) {
        return Should-BeLessThan -ActualValue $ActualValue -ExpectedValue $ExpectedValue -Negate:$false -Because $Because
    }

    if ($ActualValue -lt $ExpectedValue) {
        return [PSCustomObject] @{
            Succeeded      = $false
            FailureMessage = "Expected the actual value to be greater than or equal to $(Format-Nicely $ExpectedValue),$(Format-Because $Because) but got $(Format-Nicely $ActualValue)."
        }
    }

    return [PSCustomObject] @{
        Succeeded = $true
    }
}

Add-ShouldOperator -Name         BeLessThan `
    -InternalName Should-BeLessThan `
    -Test         ${function:Should-BeLessThan} `
    -Alias        'LT'

Add-ShouldOperator -Name         BeGreaterOrEqual `
    -InternalName Should-BeGreaterOrEqual `
    -Test         ${function:Should-BeGreaterOrEqual} `
    -Alias        'GE'

#keeping tests happy
function ShouldBeLessThanFailureMessage() {
}
function NotShouldBeLessThanFailureMessage() {
}

function ShouldBeGreaterOrEqualFailureMessage() {
}
function NotShouldBeGreaterOrEqualFailureMessage() {
}
# file src\functions\assertions\BeLike.ps1
function Should-BeLike($ActualValue, $ExpectedValue, [switch] $Negate, [String] $Because) {
    <#
.SYNOPSIS
Asserts that the actual value matches a wildcard pattern using PowerShell's -like operator.
This comparison is not case-sensitive.

.EXAMPLE
$actual = "Actual value"
PS C:\>$actual | Should -BeLike "actual *"

This test will pass. -BeLike is not case sensitive.
For a case sensitive assertion, see -BeLikeExactly.

.EXAMPLE
$actual = "Actual value"
PS C:\>$actual | Should -BeLike "not actual *"

This test will fail, as the first string does not match the expected value.
#>
    [bool] $succeeded = $ActualValue -like $ExpectedValue
    if ($Negate) {
        $succeeded = -not $succeeded
    }

    if (-not $succeeded) {
        if ($Negate) {
            return [PSCustomObject] @{
                Succeeded      = $false
                FailureMessage = "Expected like wildcard $(Format-Nicely $ExpectedValue) to not match $(Format-Nicely $ActualValue),$(Format-Because $Because) but it did match."
            }
        }
        else {
            return [PSCustomObject] @{
                Succeeded      = $false
                FailureMessage = "Expected like wildcard $(Format-Nicely $ExpectedValue) to match $(Format-Nicely $ActualValue),$(Format-Because $Because) but it did not match."
            }
        }
    }

    return [PSCustomObject] @{
        Succeeded = $true
    }
}

Add-ShouldOperator -Name         BeLike `
    -InternalName Should-BeLike `
    -Test         ${function:Should-BeLike}

function ShouldBeLikeFailureMessage() {
}
function NotShouldBeLikeFailureMessage() {
}
# file src\functions\assertions\BeLikeExactly.ps1
function Should-BeLikeExactly($ActualValue, $ExpectedValue, [switch] $Negate, [String] $Because) {
    <#
.SYNOPSIS
Asserts that the actual value matches a wildcard pattern using PowerShell's -like operator.
This comparison is case-sensitive.

.EXAMPLE
$actual = "Actual value"
PS C:\>$actual | Should -BeLikeExactly "Actual *"

This test will pass, as the string matches the provided pattern.

.EXAMPLE
$actual = "Actual value"
PS C:\>$actual | Should -BeLikeExactly "actual *"

This test will fail, as -BeLikeExactly is case-sensitive.
#>
    [bool] $succeeded = $ActualValue -clike $ExpectedValue
    if ($Negate) {
        $succeeded = -not $succeeded
    }

    if (-not $succeeded) {
        if ($Negate) {
            return [PSCustomObject] @{
                Succeeded      = $false
                FailureMessage = "Expected case sensitive like wildcard $(Format-Nicely $ExpectedValue) to not match $(Format-Nicely $ActualValue),$(Format-Because $Because) but it did match."
            }
        }
        else {
            return [PSCustomObject] @{
                Succeeded      = $false
                FailureMessage = "Expected case sensitive like wildcard $(Format-Nicely $ExpectedValue) to match $(Format-Nicely $ActualValue),$(Format-Because $Because) but it did not match."
            }
        }
    }

    return [PSCustomObject] @{
        Succeeded = $true
    }
}

Add-ShouldOperator -Name         BeLikeExactly `
    -InternalName Should-BeLikeExactly `
    -Test         ${function:Should-BeLikeExactly}

function ShouldBeLikeExactlyFailureMessage() {
}
function NotShouldBeLikeExactlyFailureMessage() {
}
# file src\functions\assertions\BeNullOrEmpty.ps1

function Should-BeNullOrEmpty([object[]] $ActualValue, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Checks values for null or empty (strings).
The static [String]::IsNullOrEmpty() method is used to do the comparison.

.EXAMPLE
$null | Should -BeNullOrEmpty
This test will pass. $null is null.

.EXAMPLE
$null | Should -Not -BeNullOrEmpty
This test will fail and throw an error.

.EXAMPLE
@() | Should -BeNullOrEmpty
An empty collection will pass this test.

.EXAMPLE
""  | Should -BeNullOrEmpty
An empty string will pass this test.
#>
    if ($null -eq $ActualValue -or $ActualValue.Count -eq 0) {
        $succeeded = $true
    }
    elseif ($ActualValue.Count -eq 1) {
        $expandedValue = $ActualValue[0]
        if ($expandedValue -is [hashtable]) {
            $succeeded = $expandedValue.Count -eq 0
        }
        else {
            $succeeded = [String]::IsNullOrEmpty($expandedValue)
        }
    }
    else {
        $succeeded = $false
    }

    if ($Negate) {
        $succeeded = -not $succeeded
    }

    $failureMessage = ''

    if (-not $succeeded) {
        if ($Negate) {
            $failureMessage = NotShouldBeNullOrEmptyFailureMessage -Because $Because
        }
        else {
            $failureMessage = ShouldBeNullOrEmptyFailureMessage -ActualValue $ActualValue -Because $Because
        }
    }

    return [PSCustomObject] @{
        Succeeded      = $succeeded
        FailureMessage = $failureMessage
    }
}

function ShouldBeNullOrEmptyFailureMessage($ActualValue, $Because) {
    return "Expected `$null or empty,$(Format-Because $Because) but got $(Format-Nicely $ActualValue)."
}

function NotShouldBeNullOrEmptyFailureMessage ($Because) {
    return "Expected a value,$(Format-Because $Because) but got `$null or empty."
}

Add-ShouldOperator -Name               BeNullOrEmpty `
    -InternalName       Should-BeNullOrEmpty `
    -Test               ${function:Should-BeNullOrEmpty} `
    -SupportsArrayInput
# file src\functions\assertions\BeOfType.ps1

function Should-BeOfType($ActualValue, $ExpectedType, [switch] $Negate, [string]$Because) {
    <#
.SYNOPSIS
Asserts that the actual value should be an object of a specified type
(or a subclass of the specified type) using PowerShell's -is operator.

.EXAMPLE
$actual = Get-Item $env:SystemRoot
PS C:\>$actual | Should -BeOfType System.IO.DirectoryInfo

This test passes, as $actual is a DirectoryInfo object.

.EXAMPLE
$actual | Should -BeOfType System.IO.FileSystemInfo
This test passes, as DirectoryInfo's base class is FileSystemInfo.

.EXAMPLE
$actual | Should -HaveType System.IO.FileSystemInfo
This test passes for the same reason, but uses the -HaveType alias instead.

.EXAMPLE
$actual | Should -BeOfType System.IO.FileInfo
This test will fail, as FileInfo is not a base class of DirectoryInfo.
#>
    if ($ExpectedType -is [string]) {
        # parses type that is provided as a string in brackets (such as [int])
        $parsedType = ($ExpectedType -replace '^\[(.*)\]$', '$1') -as [Type]
        if ($null -eq $parsedType) {
            throw [ArgumentException]"Could not find type [$ParsedType]. Make sure that the assembly that contains that type is loaded."
        }

        $ExpectedType = $parsedType
    }

    $succeded = $ActualValue -is $ExpectedType
    if ($Negate) {
        $succeded = -not $succeded
    }

    $failureMessage = ''

    if ($null -ne $ActualValue) {
        $actualType = $ActualValue.GetType()
    }
    else {
        $actualType = $null
    }

    if (-not $succeded) {
        if ($Negate) {
            $failureMessage = "Expected the value to not have type $(Format-Nicely $ExpectedType) or any of its subtypes,$(Format-Because $Because) but got $(Format-Nicely $ActualValue) with type $(Format-Nicely $actualType)."
        }
        else {
            $failureMessage = "Expected the value to have type $(Format-Nicely $ExpectedType) or any of its subtypes,$(Format-Because $Because) but got $(Format-Nicely $ActualValue) with type $(Format-Nicely $actualType)."
        }
    }

    return [PSCustomObject] @{
        Succeeded      = $succeded
        FailureMessage = $failureMessage
    }
}


Add-ShouldOperator -Name         BeOfType `
    -InternalName Should-BeOfType `
    -Test         ${function:Should-BeOfType} `
    -Alias        'HaveType'

function ShouldBeOfTypeFailureMessage() {
}

function NotShouldBeOfTypeFailureMessage() {
}
# file src\functions\assertions\BeTrueOrFalse.ps1
function Should-BeTrue($ActualValue, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Asserts that the value is true, or truthy.

.EXAMPLE
$true | Should -BeTrue
This test passes. $true is true.

.EXAMPLE
1 | Should -BeTrue
This test passes. 1 is true.

.EXAMPLE
1,2,3 | Should -BeTrue
PowerShell does not enter a `If (-not @(1,2,3)) {}` block.
This test passes as a "truthy" result.
#>
    if ($Negate) {
        return Should-BeFalse -ActualValue $ActualValue -Negate:$false -Because $Because
    }

    if (-not $ActualValue) {
        $failureMessage = "Expected `$true,$(Format-Because $Because) but got $(Format-Nicely $ActualValue)."
        return [PSCustomObject] @{
            Succeeded      = $false
            FailureMessage = $failureMessage
        }
    }

    return [PSCustomObject] @{
        Succeeded = $true
    }
}

function Should-BeFalse($ActualValue, [switch] $Negate, $Because) {
    <#
.SYNOPSIS
Asserts that the value is false, or falsy.

.EXAMPLE
$false | Should -BeFalse
This test passes. $false is false.

.EXAMPLE
0 | Should -BeFalse
This test passes. 0 is false.

.EXAMPLE
$null | Should -BeFalse
PowerShell does not enter a `If ($null) {}` block.
This test passes as a "falsy" result.
#>
    if ($Negate) {
        return Should-BeTrue -ActualValue $ActualValue -Negate:$false -Because $Because
    }

    if ($ActualValue) {
        $failureMessage = "Expected `$false,$(Format-Because $Because) but got $(Format-Nicely $ActualValue)."
        return [PSCustomObject] @{
            Succeeded      = $false
            FailureMessage = $failureMessage
        }
    }

    return [PSCustomObject] @{
        Succeeded = $true
    }
}


Add-ShouldOperator -Name         BeTrue `
    -InternalName Should-BeTrue `
    -Test         ${function:Should-BeTrue}

Add-ShouldOperator -Name         BeFalse `
    -InternalName Should-BeFalse `
    -Test         ${function:Should-BeFalse}



# to keep tests happy
function ShouldBeTrueFailureMessage($ActualValue) {
}
function NotShouldBeTrueFailureMessage($ActualValue) {
}
function ShouldBeFalseFailureMessage($ActualValue) {
}
function NotShouldBeFalseFailureMessage($ActualValue) {
}
# file src\functions\assertions\Contain.ps1
function Should-Contain($ActualValue, $ExpectedValue, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Asserts that collection contains a specific value.
Uses PowerShell's -contains operator to confirm.

.EXAMPLE
1,2,3 | Should -Contain 1
This test passes, as 1 exists in the provided collection.
#>
    [bool] $succeeded = $ActualValue -contains $ExpectedValue
    if ($Negate) {
        $succeeded = -not $succeeded
    }

    if (-not $succeeded) {
        if ($Negate) {
            return [PSCustomObject] @{
                Succeeded      = $false
                FailureMessage = "Expected $(Format-Nicely $ExpectedValue) to not be found in collection $(Format-Nicely $ActualValue),$(Format-Because $Because) but it was found."
            }
        }
        else {
            return [PSCustomObject] @{
                Succeeded      = $false
                FailureMessage = "Expected $(Format-Nicely $ExpectedValue) to be found in collection $(Format-Nicely $ActualValue),$(Format-Because $Because) but it was not found."
            }
        }
    }

    return [PSCustomObject] @{
        Succeeded = $true
    }
}

Add-ShouldOperator -Name         Contain `
    -InternalName Should-Contain `
    -Test         ${function:Should-Contain} `
    -SupportsArrayInput

function ShouldContainFailureMessage() {
}
function NotShouldContainFailureMessage() {
}
# file src\functions\assertions\Exist.ps1
function Should-Exist($ActualValue, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Does not perform any comparison, but checks if the object calling Exist is present in a PS Provider.
The object must have valid path syntax. It essentially must pass a Test-Path call.

.EXAMPLE
$actual = (Dir . )[0].FullName
PS C:\>Remove-Item $actual
PS C:\>$actual | Should -Exist

`Should -Exist` calls Test-Path. Test-Path expects a file,
returns $false because the file was removed, and fails the test.
#>
    [bool] $succeeded = & $SafeCommands['Test-Path'] $ActualValue

    if ($Negate) {
        $succeeded = -not $succeeded
    }

    $failureMessage = ''

    if (-not $succeeded) {
        if ($Negate) {
            $failureMessage = "Expected path $(Format-Nicely $ActualValue) to not exist,$(Format-Because $Because) but it did exist."
        }
        else {
            $failureMessage = "Expected path $(Format-Nicely $ActualValue) to exist,$(Format-Because $Because) but it did not exist."
        }
    }

    return [PSCustomObject] @{
        Succeeded      = $succeeded
        FailureMessage = $failureMessage
    }
}

Add-ShouldOperator -Name         Exist `
    -InternalName Should-Exist `
    -Test         ${function:Should-Exist}


function ShouldExistFailureMessage() {
}
function NotShouldExistFailureMessage() {
}
# file src\functions\assertions\FileContentMatch.ps1
function Should-FileContentMatch($ActualValue, $ExpectedContent, [switch] $Negate, $Because) {
    <#
.SYNOPSIS
Checks to see if a file contains the specified text.
This search is not case sensitive and uses regular expressions.

.EXAMPLE
Set-Content -Path TestDrive:\file.txt -Value 'I am a file.'
PS C:\>'TestDrive:\file.txt' | Should -FileContentMatch 'I Am'

Create a new file and verify its content. This test passes.
The 'I Am' regular expression (RegEx) pattern matches against the txt file contents.
For case-sensitivity, see FileContentMatchExactly.

.EXAMPLE
'TestDrive:\file.txt' | Should -FileContentMatch '^I.*file\.$'
This RegEx pattern also matches against the "I am a file." string from Example 1.
With a matching RegEx pattern, this test also passes.

.EXAMPLE
'TestDrive:\file.txt' | Should -FileContentMatch 'I Am Not'
This test fails, as the RegEx pattern does not match "I am a file."

.EXAMPLE
'TestDrive:\file.txt' | Should -FileContentMatch 'I.am.a.file'
This test passes, because "." in RegEx matches any character including a space.

.EXAMPLE
'TestDrive:\file.txt' | Should -FileContentMatch ([regex]::Escape('I.am.a.file'))
Tip: Use [regex]::Escape("pattern") to match the exact text.
This test fails, because "I am a file." != "I.am.a.file"
#>
    $succeeded = (@(& $SafeCommands['Get-Content'] -Encoding UTF8 $ActualValue) -match $ExpectedContent).Count -gt 0

    if ($Negate) {
        $succeeded = -not $succeeded
    }

    $failureMessage = ''

    if (-not $succeeded) {
        if ($Negate) {
            $failureMessage = NotShouldFileContentMatchFailureMessage -ActualValue $ActualValue -ExpectedContent $ExpectedContent -Because $Because
        }
        else {
            $failureMessage = ShouldFileContentMatchFailureMessage -ActualValue $ActualValue -ExpectedContent $ExpectedContent -Because $Because
        }
    }

    return [PSCustomObject] @{
        Succeeded      = $succeeded
        FailureMessage = $failureMessage
    }
}

function ShouldFileContentMatchFailureMessage($ActualValue, $ExpectedContent, $Because) {
    return "Expected $(Format-Nicely $ExpectedContent) to be found in file '$ActualValue',$(Format-Because $Because) but it was not found."
}

function NotShouldFileContentMatchFailureMessage($ActualValue, $ExpectedContent, $Because) {
    return "Expected $(Format-Nicely $ExpectedContent) to not be found in file '$ActualValue',$(Format-Because $Because) but it was found."
}

Add-ShouldOperator -Name         FileContentMatch `
    -InternalName Should-FileContentMatch `
    -Test         ${function:Should-FileContentMatch}
# file src\functions\assertions\FileContentMatchExactly.ps1
function Should-FileContentMatchExactly($ActualValue, $ExpectedContent, [switch] $Negate, [String] $Because) {
    <#
.SYNOPSIS
Checks to see if a file contains the specified text.
This search is case sensitive and uses regular expressions to match the text.

.EXAMPLE
Set-Content -Path TestDrive:\file.txt -Value 'I am a file.'
PS C:\>'TestDrive:\file.txt' | Should -FileContentMatchExactly 'I am'

Create a new file and verify its content. This test passes.
The 'I am' regular expression (RegEx) pattern matches against the txt file contents.

.EXAMPLE
'TestDrive:\file.txt' | Should -FileContentMatchExactly 'I Am'
This test checks a case-sensitive pattern against the "I am a file." string from Example 1.
Because the RegEx pattern fails to match, this test fails.
#>
    $succeeded = (@(& $SafeCommands['Get-Content'] -Encoding UTF8 $ActualValue) -cmatch $ExpectedContent).Count -gt 0

    if ($Negate) {
        $succeeded = -not $succeeded
    }

    $failureMessage = ''

    if (-not $succeeded) {
        if ($Negate) {
            $failureMessage = NotShouldFileContentMatchExactlyFailureMessage -ActualValue $ActualValue -ExpectedContent $ExpectedContent -Because $Because
        }
        else {
            $failureMessage = ShouldFileContentMatchExactlyFailureMessage -ActualValue $ActualValue -ExpectedContent $ExpectedContent -Because $Because
        }
    }

    return [PSCustomObject] @{
        Succeeded      = $succeeded
        FailureMessage = $failureMessage
    }
}

function ShouldFileContentMatchExactlyFailureMessage($ActualValue, $ExpectedContent) {
    return "Expected $(Format-Nicely $ExpectedContent) to be case sensitively found in file $(Format-Nicely $ActualValue),$(Format-Because $Because) but it was not found."
}

function NotShouldFileContentMatchExactlyFailureMessage($ActualValue, $ExpectedContent) {
    return "Expected $(Format-Nicely $ExpectedContent) to not be case sensitively found in file $(Format-Nicely $ActualValue),$(Format-Because $Because) but it was found."
}

Add-ShouldOperator -Name         FileContentMatchExactly `
    -InternalName Should-FileContentMatchExactly `
    -Test         ${function:Should-FileContentMatchExactly}
# file src\functions\assertions\FileContentMatchMultiline.ps1
function Should-FileContentMatchMultiline($ActualValue, $ExpectedContent, [switch] $Negate, [String] $Because) {
    <#
.SYNOPSIS
As opposed to FileContentMatch and FileContentMatchExactly operators,
FileContentMatchMultiline presents content of the file being tested as one string object,
so that the expression you are comparing it to can consist of several lines.

When using FileContentMatchMultiline operator, '^' and '$' represent the beginning and end
of the whole file, instead of the beginning and end of a line.

.EXAMPLE
$Content = "I am the first line.`nI am the second line."
PS C:\>Set-Content -Path TestDrive:\file.txt -Value $Content -NoNewline
PS C:\>'TestDrive:\file.txt' | Should -FileContentMatchMultiline 'first line\.\r?\nI am'

This regular expression (RegEx) pattern matches the file contents, and the test passes.

.EXAMPLE
'TestDrive:\file.txt' | Should -FileContentMatchMultiline '^I am the first.*\n.*second line\.$'
Using the file from Example 1, this RegEx pattern also matches, and this test also passes.

.EXAMPLE
'TestDrive:\file.txt' | Should -FileContentMatchMultiline '^I am the first line\.$'
FileContentMatchMultiline uses the '$' symbol to match the end of the file,
not the end of any single line within the file. This test fails.
#>
    $succeeded = [bool] ((& $SafeCommands['Get-Content'] $ActualValue -Delimiter ([char]0)) -match $ExpectedContent)

    if ($Negate) {
        $succeeded = -not $succeeded
    }

    $failureMessage = ''

    if (-not $succeeded) {
        if ($Negate) {
            $failureMessage = NotShouldFileContentMatchMultilineFailureMessage -ActualValue $ActualValue -ExpectedContent $ExpectedContent -Because $Because
        }
        else {
            $failureMessage = ShouldFileContentMatchMultilineFailureMessage -ActualValue $ActualValue -ExpectedContent $ExpectedContent -Because $Because
        }
    }

    return [PSCustomObject] @{
        Succeeded      = $succeeded
        FailureMessage = $failureMessage
    }
}

function ShouldFileContentMatchMultilineFailureMessage($ActualValue, $ExpectedContent, $Because) {
    return "Expected $(Format-Nicely $ExpectedContent) to be found in file $(Format-Nicely $ActualValue),$(Format-Because $Because) but it was not found."
}

function NotShouldFileContentMatchMultilineFailureMessage($ActualValue, $ExpectedContent, $Because) {
    return "Expected $(Format-Nicely $ExpectedContent) to not be found in file $(Format-Nicely $ActualValue),$(Format-Because $Because) but it was found."
}

Add-ShouldOperator -Name         FileContentMatchMultiline `
    -InternalName Should-FileContentMatchMultiline `
    -Test         ${function:Should-FileContentMatchMultiline}
# file src\functions\assertions\HaveCount.ps1
function Should-HaveCount($ActualValue, [int] $ExpectedValue, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Asserts that a collection has the expected amount of items.

.EXAMPLE
1,2,3 | Should -HaveCount 3
This test passes, because it expected three objects, and received three.
This is like running `@(1,2,3).Count` in PowerShell.
#>
    if ($ExpectedValue -lt 0) {
        throw [ArgumentException]"Excpected collection size must be greater than or equal to 0."
    }
    $count = if ($null -eq $ActualValue) {
        0
    }
    else {
        $ActualValue.Count
    }
    $expectingEmpty = $ExpectedValue -eq 0
    [bool] $succeeded = $count -eq $ExpectedValue
    if ($Negate) {
        $succeeded = -not $succeeded
    }


    if (-not $succeeded) {

        if ($Negate) {
            $expect = if ($expectingEmpty) {
                "Expected a non-empty collection"
            }
            else {
                "Expected a collection with size different from $(Format-Nicely $ExpectedValue)"
            }
            $but = if ($count -ne 0) {
                "but got collection with that size $(Format-Nicely $ActualValue)."
            }
            else {
                "but got an empty collection."
            }
            return [PSCustomObject] @{
                Succeeded      = $false
                FailureMessage = "$expect,$(Format-Because $Because) $but"
            }
        }
        else {
            $expect = if ($expectingEmpty) {
                "Expected an empty collection"
            }
            else {
                "Expected a collection with size $(Format-Nicely $ExpectedValue)"
            }
            $but = if ($count -ne 0) {
                "but got collection with size $(Format-Nicely $count) $(Format-Nicely $ActualValue)."
            }
            else {
                "but got an empty collection."
            }
            return [PSCustomObject] @{
                Succeeded      = $false
                FailureMessage = "$expect,$(Format-Because $Because) $but"
            }
        }
    }

    return [PSCustomObject] @{
        Succeeded = $true
    }
}

Add-ShouldOperator -Name         HaveCount `
    -InternalName Should-HaveCount `
    -Test         ${function:Should-HaveCount} `
    -SupportsArrayInput

function ShouldHaveCountFailureMessage() {
}
function NotShouldHaveCountFailureMessage() {
}
# file src\functions\assertions\HaveParameter.ps1
function Should-HaveParameter (
    $ActualValue,
    [String] $ParameterName,
    $Type,
    [String]$DefaultValue,
    [Switch]$Mandatory,
    [Switch]$HasArgumentCompleter,
    [String]$Alias,
    [Switch]$Negate,
    [String]$Because ) {
    <#
    .SYNOPSIS
        Asserts that a command has the expected parameter.

    .EXAMPLE
        Get-Command "Invoke-WebRequest" | Should -HaveParameter Uri -Mandatory
        This test passes, because it expected the parameter URI to exist and to
        be mandatory.
    .NOTES
        The attribute [ArgumentCompleter] was added with PSv5. Previouse this
        assertion will not be able to use the -HasArgumentCompleter parameter
        if the attribute does not exist.
    #>

    if ($null -eq $ActualValue -or $ActualValue -isnot [Management.Automation.CommandInfo]) {
        throw "Input value must be non-null CommandInfo object. You can get one by calling Get-Command."
    }

    if ($null -eq $ParameterName) {
        throw "The ParameterName can't be empty"
    }

    #region HelperFunctions
    function Join-And ($Items, $Threshold = 2) {

        if ($null -eq $items -or $items.count -lt $Threshold) {
            $items -join ', '
        }
        else {
            $c = $items.count
            ($items[0..($c - 2)] -join ', ') + ' and ' + $items[-1]
        }
    }

    function Add-SpaceToNonEmptyString ([string]$Value) {
        if ($Value) {
            " $Value"
        }
    }

    function Get-ParameterInfo {
        param(
            [Parameter( Mandatory = $true )]
            [Management.Automation.CommandInfo]$Command
        )
        <#
        .SYNOPSIS
            Use Tokenize to get information about the parameter block of a command
        .DESCRIPTION
            In order to get information about the parameter block of a command,
            several tools can be used (Get-Command, AST, etc).
            In order to get the default value of a parameter, AST is the easiest
            way to go; but AST was only introduced with PSv3.
            This function creates an object with information about parameters
            using the Tokenize
        .NOTES
            Author: Chris Dent
        #>

        function Get-TokenGroup {
            param(
                [Parameter( Mandatory = $true )]
                [System.Management.Automation.PSToken[]]$tokens
            )
            $i = $j = 0
            do {
                $token = $tokens[$i]
                if ($token.Type -eq 'GroupStart') {
                    $j++
                }
                if ($token.Type -eq 'GroupEnd') {
                    $j--
                }
                if (-not $token.PSObject.Properties.Item('Depth')) {
                    $token | Add-Member Depth -MemberType NoteProperty -Value $j
                }
                $token

                $i++
            } until ($j -eq 0 -or $i -ge $tokens.Count)
        }

        $errors = $null
        $tokens = [System.Management.Automation.PSParser]::Tokenize($Command.Definition, [Ref]$errors)

        # Find param block
        $start = $tokens.IndexOf(($tokens | Where-Object { $_.Content -eq 'param' } | Select-Object -First 1)) + 1
        $paramBlock = Get-TokenGroup $tokens[$start..($tokens.Count - 1)]

        for ($i = 0; $i -lt $paramBlock.Count; $i++) {
            $token = $paramBlock[$i]

            if ($token.Depth -eq 1 -and $token.Type -eq 'Variable') {
                $paramInfo = New-Object PSObject -Property @{
                    Name = $token.Content
                } | Select-Object Name, Type, DefaultValue, DefaultValueType

                if ($paramBlock[$i + 1].Content -ne ',') {
                    $value = $paramBlock[$i + 2]
                    if ($value.Type -eq 'GroupStart') {
                        $tokenGroup = Get-TokenGroup $paramBlock[($i + 2)..($paramBlock.Count - 1)]
                        $paramInfo.DefaultValue = [String]::Join('', ($tokenGroup | ForEach-Object { $_.Content }))
                        $paramInfo.DefaultValueType = 'Expression'
                    }
                    else {
                        $paramInfo.DefaultValue = $value.Content
                        $paramInfo.DefaultValueType = $value.Type
                    }
                }
                if ($paramBlock[$i - 1].Type -eq 'Type') {
                    $paramInfo.Type = $paramBlock[$i - 1].Content
                }
                $paramInfo
            }
        }
    }

    if ($Type -is [string]) {
        # parses type that is provided as a string in brackets (such as [int])
        $parsedType = ($Type -replace '^\[(.*)\]$', '$1') -as [Type]
        if ($null -eq $parsedType) {
            throw [ArgumentException]"Could not find type [$ParsedType]. Make sure that the assembly that contains that type is loaded."
        }

        $Type = $parsedType
    }
    #endregion HelperFunctions

    $buts = @()
    $filters = @()

    $null = $ActualValue.Parameters # necessary for PSv2
    $hasKey = $ActualValue.Parameters.PSBase.ContainsKey($ParameterName)
    $filters += "to$(if ($Negate) {" not"}) have a parameter $ParameterName"

    if (-not $Negate -and -not $hasKey) {
        $buts += "the parameter is missing"
    }
    elseif ($Negate -and -not $hasKey) {
        return New-Object PSObject -Property @{ Succeeded = $true }
    }
    elseif ($Negate -and $hasKey -and -not ($Mandatory -or $Type -or $DefaultValue -or $HasArgumentCompleter)) {
        $buts += "the parameter exists"
    }
    else {
        $attributes = $ActualValue.Parameters[$ParameterName].Attributes

        if ($Mandatory) {
            $testMandatory = $attributes | Where-Object { $_ -is [System.Management.Automation.ParameterAttribute] -and $_.Mandatory }
            $filters += "which is$(if ($Negate) {" not"}) mandatory"

            if (-not $Negate -and -not $testMandatory) {
                $buts += "it wasn't mandatory"
            }
            elseif ($Negate -and $testMandatory) {
                $buts += "it was mandatory"
            }
        }

        if ($Type) {
            # This block is not using `Format-Nicely`, as in PSv2 the output differs. Eg:
            # PS2> [System.DateTime]
            # PS5> [datetime]
            [type]$actualType = $ActualValue.Parameters[$ParameterName].ParameterType
            $testType = ($Type -eq $actualType)
            $filters += "$(if ($Negate) {"not "})of type [$($Type.FullName)]"

            if (-not $Negate -and -not $testType) {
                $buts += "it was of type [$($actualType.FullName)]"
            }
            elseif ($Negate -and $testType) {
                $buts += "it was of type [$($Type.FullName)]"
            }
        }

        if ($PSBoundParameters.Keys -contains "DefaultValue") {
            $parameterMetadata = Get-ParameterInfo $ActualValue | Where-Object { $_.Name -eq $ParameterName }
            $actualDefault = if ($parameterMetadata.DefaultValue) { $parameterMetadata.DefaultValue } else { "" }
            $testDefault = ($actualDefault -eq $DefaultValue)
            $filters += "the default value$(if ($Negate) {" not"}) to be $(Format-Nicely $DefaultValue)"

            if (-not $Negate -and -not $testDefault) {
                $buts += "the default value was $(Format-Nicely $actualDefault)"
            }
            elseif ($Negate -and $testDefault) {
                $buts += "the default value was $(Format-Nicely $DefaultValue)"
            }
        }

        if ($HasArgumentCompleter) {
            $testArgumentCompleter = $attributes | Where-Object { $_ -is [ArgumentCompleter] }
            $filters += "has ArgumentCompletion"

            if (-not $Negate -and -not $testArgumentCompleter) {
                $buts += "has no ArgumentCompletion"
            }
            elseif ($Negate -and $testArgumentCompleter) {
                $buts += "has ArgumentCompletion"
            }
        }

        if ($Alias) {
            $testPresenceOfAlias = $ActualValue.Parameters[$ParameterName].Aliases -contains $Alias
            $filters += "to$(if ($Negate) {" not"}) have an alias '$Alias'"

            if (-not $Negate -and -not $testPresenceOfAlias) {
                $buts += "it didn't have an alias '$Alias'"
            }
            elseif ($Negate -and $testPresenceOfAlias) {
                $buts += "it had an alias '$Alias'"
            }
        }
    }

    if ($buts.Count -ne 0) {
        $filter = Add-SpaceToNonEmptyString ( Join-And $filters -Threshold 3 )
        $but = Join-And $buts
        $failureMessage = "Expected command $($ActualValue.Name)$filter,$(Format-Because $Because) but $but."

        return New-Object PSObject -Property @{
            Succeeded      = $false
            FailureMessage = $failureMessage
        }
    }
    else {
        return New-Object PSObject -Property @{ Succeeded = $true }
    }
}

Add-ShouldOperator -Name         HaveParameter `
    -InternalName Should-HaveParameter `
    -Test         ${function:Should-HaveParameter}
# file src\functions\assertions\Match.ps1
function Should-Match($ActualValue, $RegularExpression, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Uses a regular expression to compare two objects.
This comparison is not case sensitive.

.EXAMPLE
"I am a value" | Should -Match "I Am"
The "I Am" regular expression (RegEx) pattern matches the provided string,
so the test passes. For case sensitive matches, see MatchExactly.
.EXAMPLE
"I am a value" | Should -Match "I am a bad person" # Test will fail
RegEx pattern does not match the string, and the test fails.
.EXAMPLE
"Greg" | Should -Match ".reg" # Test will pass
This test passes, as "." in RegEx matches any character.
.EXAMPLE
"Greg" | Should -Match ([regex]::Escape(".reg"))
One way to provide literal characters to Match is the [regex]::Escape() method.
This test fails, because the pattern does not match a period symbol.
#>
    [bool] $succeeded = $ActualValue -match $RegularExpression

    if ($Negate) {
        $succeeded = -not $succeeded
    }

    $failureMessage = ''

    if (-not $succeeded) {
        if ($Negate) {
            $failureMessage = NotShouldMatchFailureMessage -ActualValue $ActualValue -RegularExpression $RegularExpression -Because $Because
        }
        else {
            $failureMessage = ShouldMatchFailureMessage -ActualValue $ActualValue -RegularExpression $RegularExpression -Because $Because
        }
    }

    return [PSCustomObject] @{
        Succeeded      = $succeeded
        FailureMessage = $failureMessage
    }
}

function ShouldMatchFailureMessage($ActualValue, $RegularExpression, $Because) {
    return "Expected regular expression $(Format-Nicely $RegularExpression) to match $(Format-Nicely $ActualValue),$(Format-Because $Because) but it did not match."
}

function NotShouldMatchFailureMessage($ActualValue, $RegularExpression, $Because) {
    return "Expected regular expression $(Format-Nicely $RegularExpression) to not match $(Format-Nicely $ActualValue),$(Format-Because $Because) but it did match."
}

Add-ShouldOperator -Name         Match `
    -InternalName Should-Match `
    -Test         ${function:Should-Match}
# file src\functions\assertions\MatchExactly.ps1
function Should-MatchExactly($ActualValue, $RegularExpression, [switch] $Negate, [string] $Because) {
    <#
.SYNOPSIS
Uses a regular expression to compare two objects.
This comparison is case sensitive.

.EXAMPLE
"I am a value" | Should -MatchExactly "I am"
The "I am" regular expression (RegEx) pattern matches the string.
This test passes.

.EXAMPLE
"I am a value" | Should -MatchExactly "I Am"
Because MatchExactly is case sensitive, this test fails.
For a case insensitive test, see Match.
#>
    [bool] $succeeded = $ActualValue -cmatch $RegularExpression

    if ($Negate) {
        $succeeded = -not $succeeded
    }

    $failureMessage = ''

    if (-not $succeeded) {
        if ($Negate) {
            $failureMessage = NotShouldMatchExactlyFailureMessage -ActualValue $ActualValue -RegularExpression $RegularExpression -Because $Because
        }
        else {
            $failureMessage = ShouldMatchExactlyFailureMessage -ActualValue $ActualValue -RegularExpression $RegularExpression -Because $Because
        }
    }

    return [PSCustomObject] @{
        Succeeded      = $succeeded
        FailureMessage = $failureMessage
    }
}

function ShouldMatchExactlyFailureMessage($ActualValue, $RegularExpression) {
    return "Expected regular expression $(Format-Nicely $RegularExpression) to case sensitively match $(Format-Nicely $ActualValue),$(Format-Because $Because) but it did not match."
}

function NotShouldMatchExactlyFailureMessage($ActualValue, $RegularExpression) {
    return "Expected regular expression $(Format-Nicely $RegularExpression) to not case sensitively match $(Format-Nicely $ActualValue),$(Format-Because $Because) but it did match."
}

Add-ShouldOperator -Name         MatchExactly `
    -InternalName Should-MatchExactly `
    -Test         ${function:Should-MatchExactly} `
    -Alias        'CMATCH'
# file src\functions\assertions\PesterThrow.ps1
function Should-Throw {
    param (
        [ScriptBlock] $ActualValue,
        [string] $ExpectedMessage,
        [string] $ErrorId,
        [type] $ExceptionType,
        [switch] $Negate,
        [string] $Because,
        [switch] $PassThru
    )

    <#
.SYNOPSIS
Checks if an exception was thrown. Enclose input in a script block.

Warning: The input object must be a ScriptBlock, otherwise it is processed outside of the assertion.

.EXAMPLE
{ foo } | Should -Throw
Because "foo" isn't a known command, PowerShell throws an error.
Throw confirms that an error occurred, and successfully passes the test.

.EXAMPLE
{ foo } | Should -Not -Throw
By using -Not with -Throw, the opposite effect is achieved.
"Should -Not -Throw" expects no error, but one occurs, and the test fails.

.EXAMPLE
{ $foo = 1 } | Should -Throw
Assigning a variable does not throw an error.
If asserting "Should -Throw" but no error occurs, the test fails.

.EXAMPLE
{ $foo = 1 } | Should -Not -Throw
Assert that assigning a variable should not throw an error.
It does not throw an error, so the test passes.
#>
    $actualExceptionMessage = ""
    $actualExceptionWasThrown = $false
    $actualError = $null
    $actualException = $null
    $actualExceptionLine = $null

    if ($null -eq $ActualValue) {
        throw [ArgumentNullException] "Input is not a ScriptBlock. Input to '-Throw' and '-Not -Throw' must be enclosed in curly braces."
    }

    try {
        do {
            Write-ScriptBlockInvocationHint -Hint "Should -Throw" -ScriptBlock $ActualValue
            $null = & $ActualValue
        } until ($true)
    }
    catch {
        $actualExceptionWasThrown = $true
        $actualError = $_
        $actualException = $_.Exception
        $actualExceptionMessage = $_.Exception.Message
        $actualErrorId = $_.FullyQualifiedErrorId
        $actualExceptionLine = (Get-ExceptionLineInfo $_.InvocationInfo) -replace [System.Environment]::NewLine, "$([System.Environment]::NewLine)    "
    }

    [bool] $succeeded = $false

    if ($Negate) {
        # this is for Should -Not -Throw. Once *any* exception was thrown we should fail the assertion
        # there is no point in filtering the exception, because there should be none
        $succeeded = -not $actualExceptionWasThrown
        if (-not $succeeded) {
            $failureMessage = "Expected no exception to be thrown,$(Format-Because $Because) but an exception `"$actualExceptionMessage`" was thrown $actualExceptionLine."
            return [PSCustomObject] @{
                Succeeded      = $succeeded
                FailureMessage = $failureMessage
            }
        }
        else {
            return [PSCustomObject] @{
                Succeeded = $true
            }
        }
    }

    # the rest is for Should -Throw, we must fail the assertion when no exception is thrown
    # or when the exception does not match our filter

    function Join-And ($Items, $Threshold = 2) {

        if ($null -eq $items -or $items.count -lt $Threshold) {
            $items -join ', '
        }
        else {
            $c = $items.count
            ($items[0..($c - 2)] -join ', ') + ' and ' + $items[-1]
        }
    }

    function Add-SpaceToNonEmptyString ([string]$Value) {
        if ($Value) {
            " $Value"
        }
    }

    $buts = @()
    $filters = @()

    $filterOnExceptionType = $null -ne $ExceptionType
    if ($filterOnExceptionType) {
        $filters += "with type $(Format-Nicely $ExceptionType)"

        if ($actualExceptionWasThrown -and $actualException -isnot $ExceptionType) {
            $buts += "the exception type was $(Format-Nicely ($actualException.GetType()))"
        }
    }

    $filterOnMessage = -not [string]::IsNullOrWhitespace($ExpectedMessage)
    if ($filterOnMessage) {
        $filters += "with message $(Format-Nicely $ExpectedMessage)"
        if ($actualExceptionWasThrown -and (-not (Get-DoValuesMatch $actualExceptionMessage $ExpectedMessage))) {
            $buts += "the message was $(Format-Nicely $actualExceptionMessage)"
        }
    }

    $filterOnId = -not [string]::IsNullOrWhitespace($ErrorId)
    if ($filterOnId) {
        $filters += "with FullyQualifiedErrorId $(Format-Nicely $ErrorId)"
        if ($actualExceptionWasThrown -and (-not (Get-DoValuesMatch $actualErrorId $ErrorId))) {
            $buts += "the FullyQualifiedErrorId was $(Format-Nicely $actualErrorId)"
        }
    }

    if (-not $actualExceptionWasThrown) {
        $buts += "no exception was thrown"
    }

    if ($buts.Count -ne 0) {
        $filter = Add-SpaceToNonEmptyString ( Join-And $filters -Threshold 3 )
        $but = Join-And $buts
        $failureMessage = "Expected an exception,$filter to be thrown,$(Format-Because $Because) but $but. $actualExceptionLine".Trim()

        return [PSCustomObject] @{
            Succeeded      = $false
            FailureMessage = $failureMessage
        }
    }

    $result = [PSCustomObject] @{
        Succeeded = $true
    }

    if ($PassThru) {
        $result | Add-Member -MemberType NoteProperty -Name 'Data' -Value $actualError
    }

    return $result
}

function Get-DoValuesMatch($ActualValue, $ExpectedValue) {
    #user did not specify any message filter, so any message matches
    if ($null -eq $ExpectedValue) {
        return $true
    }

    return $ActualValue.ToString() -like $ExpectedValue
}

function Get-ExceptionLineInfo($info) {
    # $info.PositionMessage has a leading blank line that we need to account for in PowerShell 2.0
    $positionMessage = $info.PositionMessage -split '\r?\n' -match '\S' -join [System.Environment]::NewLine
    return ($positionMessage -replace "^At ", "from ")
}

function ShouldThrowFailureMessage {
    # to make the should tests happy, for now
}

function NotShouldThrowFailureMessage {
    # to make the should tests happy, for now
}

Add-ShouldOperator -Name         Throw `
    -InternalName Should-Throw `
    -Test         ${function:Should-Throw}
# file src\functions\assertions\Should.ps1
function Get-FailureMessage($assertionEntry, $negate, $value, $expected) {
    if ($negate) {
        $failureMessageFunction = $assertionEntry.GetNegativeFailureMessage
    }
    else {
        $failureMessageFunction = $assertionEntry.GetPositiveFailureMessage
    }

    return (& $failureMessageFunction $value $expected)
}

function New-ShouldErrorRecord ([string] $Message, [string] $File, [string] $Line, [string] $LineText, $Terminating) {
    $exception = [Exception] $Message
    $errorID = 'PesterAssertionFailed'
    $errorCategory = [Management.Automation.ErrorCategory]::InvalidResult
    # we use ErrorRecord.TargetObject to pass structured information about the error to a reporting system.
    $targetObject = @{ Message = $Message; File = $File; Line = $Line; LineText = $LineText; Terminating = $Terminating }
    $errorRecord = & $SafeCommands['New-Object'] Management.Automation.ErrorRecord $exception, $errorID, $errorCategory, $targetObject
    return $errorRecord
}

function Should {
    <#
    .SYNOPSIS
    Should is a keyword what is used to define an assertion inside It block.

    .DESCRIPTION
    Should is a keyword what is used to define an assertion inside the It block.
    Should provides assertion methods for verify assertion e.g. comparing objects.
    If assertion is not met the test fails and an exception is throwed up.

    Should can be used more than once in the It block if more than one assertion
    need to be verified. Each Should keywords need to be located in a new line.
    Test will be passed only when all assertion will be met (logical conjuction).

    .LINK
    https://github.com/pester/Pester/wiki/Should

    .LINK
    about_Should
    about_Pester
#>

    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline = $true, ValueFromRemainingArguments = $true)]
        [object] $ActualValue
    )

    dynamicparam {
        # Figuring out if we are using the old syntax is 'easy'
        $myLine = # we can use $myInvocation.Line to get the surrounding context
            $MyInvocation.Line.Substring($MyInvocation.OffsetInLine - 1)

        # A bit of Regex lets us know if the line used the old form
        if ($myLine -match '^\s{0,}should\s{1,}(?<Operator>[^\-\s]+)')
        {
            # Now it gets tricky.  This will be called once for each unmapped parameter.
            # So while we always want to return here, we only want to error once
            # The message uniqueness can be one part of our error.
            $shouldErrorMsg = "Legacy Should syntax (without dashes) is not supported in Pester 5. Please refer to migration guide at: https://pester.dev/docs/migrations/v3-to-v4"

            # The rest of the uniqueness we can cobble together out of $MyInvocation.
            $uniqueErrorMsg = $shouldErrorMsg,
                $MyInvocation.HistoryId, # The history ID is unique per run
                $MyInvocation.PSCommandPath, # the command path is unique per file
                $myLine  -join '.' # and the whole line should be.  Join all of these pieces by .


            if ($script:lastShouldErrorMsg -ne $uniqueErrorMsg) {
                $script:lastShouldErrorMsg  = $uniqueErrorMsg
                Write-Error $shouldErrorMsg
                return
            }
            return
        } else {
            Get-AssertionDynamicParams
        }
    }

    begin {
        $inputArray = [System.Collections.Generic.List[PSObject]]@()
    }

    process {
        $inputArray.Add($ActualValue)
    }

    end {
        $lineNumber = $MyInvocation.ScriptLineNumber
        $lineText = $MyInvocation.Line.TrimEnd([System.Environment]::NewLine)
        $file = $MyInvocation.ScriptName

        $negate = $false
        if ($PSBoundParameters.ContainsKey('Not')) {
            $negate = [bool]$PSBoundParameters['Not']
        }

        $null = $PSBoundParameters.Remove('ActualValue')
        $null = $PSBoundParameters.Remove($PSCmdlet.ParameterSetName)
        $null = $PSBoundParameters.Remove('Not')

        $entry = Get-AssertionOperatorEntry -Name $PSCmdlet.ParameterSetName

        $shouldThrow = $null
        $errorActionIsDefined = $PSBoundParameters.ContainsKey("ErrorAction")
        if ($errorActionIsDefined) {
            $shouldThrow = 'Stop' -eq $PSBoundParameters["ErrorAction"]
        }

        if ($null -eq $shouldThrow -or -not $shouldThrow) {
            # we are sure that we either:
            #    - should not throw because of explicit ErrorAction, and need to figure out a place where to collect the error
            #    - or we don't know what to do yet and need to figure out what to do based on the context and settings

            # first check if we are in the context of Pester, if not we will always throw:
            # this is slightly hacky, here we are reaching out the the caller session state and
            # look for $______parameters which we know we are using inside of the Pester runtime to
            # keep the current invocation context, when we find it, we are able to add non-terminating
            # errors without throwing and terminating the test
            $pesterRuntimeInvocationContext = $PSCmdlet.SessionState.PSVariable.GetValue('______parameters')
            $isInsidePesterRuntime = $null -ne $pesterRuntimeInvocationContext
            if (-not $isInsidePesterRuntime) {
                $shouldThrow = $true
            }
            else {
                if ($null -eq $shouldThrow) {
                    if ($null -ne $PSCmdlet.SessionState.PSVariable.GetValue('______isInMockParameterFilter')) {
                        $shouldThrow = $true
                    } else {
                        # ErrorAction was not specified explictily, figure out what to do from the configuration
                        $shouldThrow = 'Stop' -eq $pesterRuntimeInvocationContext.Configuration.Should.ErrorAction.Value
                    }
                }

                # here the $ShouldThrow is set from one of multiple places, either as override from -ErrorAction or
                # the settings, or based on the Pester runtime availability
                if (-not $shouldThrow) {
                    # call back into the context we grabbed from the runtime and add this error without throwing
                    $addErrorCallback = {
                        param($err)
                        $null = $pesterRuntimeInvocationContext.ErrorRecord.Add($err)
                    }
                }
            }
        }

        $assertionParams = @{
            AssertionEntry     = $entry
            BoundParameters    = $PSBoundParameters
            File               = $file
            LineNumber         = $lineNumber
            LineText           = $lineText
            Negate             = $negate
            CallerSessionState = $PSCmdlet.SessionState
            ShouldThrow        = $shouldThrow
            AddErrorCallback   = $addErrorCallback
        }

        if ($inputArray.Count -eq 0) {
            Invoke-Assertion @assertionParams -ValueToTest $null
        }
        elseif ($entry.SupportsArrayInput) {
            Invoke-Assertion @assertionParams -ValueToTest $inputArray.ToArray()
        }
        else {
            foreach ($object in $inputArray) {
                Invoke-Assertion @assertionParams -ValueToTest $object
            }
        }
    }
}

function Invoke-Assertion {
    param (
        [Parameter(Mandatory)]
        [ValidateNotNull()]
        [object]
        $AssertionEntry,

        [Parameter(Mandatory)]
        [System.Collections.IDictionary]
        $BoundParameters,

        [string]
        $File,

        [Parameter(Mandatory)]
        [int]
        $LineNumber,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $LineText,

        [Parameter(Mandatory)]
        [Management.Automation.SessionState]
        $CallerSessionState,

        [Parameter()]
        [switch]
        $Negate,

        [Parameter()]
        [AllowNull()]
        [object]
        $ValueToTest,

        [Parameter()]
        [boolean]
        $ShouldThrow,

        [ScriptBlock]
        $AddErrorCallback
    )

    $testResult = & $AssertionEntry.Test -ActualValue $ValueToTest -Negate:$Negate -CallerSessionState $CallerSessionState @BoundParameters

    if (-not $testResult.Succeeded) {
        $errorRecord = [Pester.Factory]::CreateShouldErrorRecord($testResult.FailureMessage, $file, $lineNumber, $lineText, $shouldThrow)


        if ($null -eq $AddErrorCallback -or $ShouldThrow) {
            # throw this error to fail the test immediately
            throw $errorRecord
        }

        try {
            # throw and catch to not fail the test, but still have stackTrace
            # alternatively we could call Get-PSStackTrace and format it ourselves
            # in case this turns out too be slow
            throw $errorRecord
        }
        catch {
            $err = $_
        }

        # collect the error via the provided callback
        & $AddErrorCallback $err
    }
    else {
        #extract data to return if there are any on the object
        $data = $testResult.psObject.Properties.Item('Data')
        if ($data) {
            $data.Value
        }
    }
}

function Format-Because ([string] $Because) {
    if ($null -eq $Because) {
        return
    }

    $bcs = $Because.Trim()
    if ([string]::IsNullOrEmpty($bcs)) {
        return
    }

    " because $($bcs -replace 'because\s'),"
}
# file src\functions\Context.ps1
function Context {
    <#
.SYNOPSIS
Provides logical grouping of It blocks within a single Describe block.

.DESCRIPTION
Provides logical grouping of It blocks within a single Describe block.
Any Mocks defined inside a Context are removed at the end of the Context scope,
as are any files or folders added to the TestDrive during the Context block's
execution. Any BeforeEach or AfterEach blocks defined inside a Context also only
apply to tests within that Context .

.PARAMETER Name
The name of the Context. This is a phrase describing a set of tests within a describe.

.PARAMETER Tag
Optional parameter containing an array of strings.  When calling Invoke-Pester,
it is possible to specify a -Tag parameter which will only execute Context blocks
containing the same Tag.

.PARAMETER Fixture
Script that is executed. This may include setup specific to the context
and one or more It blocks that validate the expected outcomes.

.EXAMPLE
```ps
function Add-Numbers($a, $b) {
    return $a + $b
}

Describe "Add-Numbers" {

    Context "when root does not exist" {
         It "..." { ... }
    }

    Context "when root does exist" {
        It "..." { ... }
        It "..." { ... }
        It "..." { ... }
    }
}
```

.LINK
https://pester.dev/docs/commands/Describe

.LINK
https://pester.dev/docs/commands/It

.LINK
https://pester.dev/docs/commands/BeforeEach

.LINK
https://pester.dev/docs/commands/AfterEach

.LINK
https://pester.dev/docs/commands/Should

.LINK
https://pester.dev/docs/usage/mocking

.LINK
https://pester.dev/docs/usage/testdrive

#>
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string] $Name,

        [Alias('Tags')]
        [string[]] $Tag = @(),

        [Parameter(Position = 1)]
        [ValidateNotNull()]
        [ScriptBlock] $Fixture,

        # [Switch] $Focus,
        [Switch] $Skip
    )

    $Focus = $false
    if ($Fixture -eq $null) {
        if ($Name.Contains("`n")) {
            throw "Test fixture name has multiple lines and no test fixture is provided. (Have you provided a name for the test group?)"
        }
        else {
            throw 'No test fixture is provided. (Have you put the open curly brace on the next line?)'
        }
    }

    if ($ExecutionContext.SessionState.PSVariable.Get("invokedViaInvokePester")) {
        New-Block -Name $Name -ScriptBlock $Fixture -Tag $Tag -FrameworkData @{ CommandUsed = "Context" } -Focus:$Focus -Skip:$Skip
    }
    else {
        if ($invokedInteractively) {
            return
        }
        $invokedInteractively = $true
        Invoke-Interactively -CommandUsed 'Context' -ScriptName $PSCmdlet.MyInvocation.ScriptName -SessionState $PSCmdlet.SessionState -BoundParameters $PSCmdlet.MyInvocation.BoundParameters
    }
}
# file src\functions\Coverage.Plugin.ps1
function Get-CoveragePlugin {
    New-PluginObject -Name "Coverage" -Start {
        param($Context)

        $logger = if ($Context.WriteDebugMessages) {
            $sw = [System.Diagnostics.Stopwatch]::StartNew()
            # return partially apply callback to the logger when the logging is enabled
            # or implicit null
            {
                param ($Message)
                & $Context.Write_PesterDebugMessage -Scope CodeCoverage -Message $Message
            }
        }

        if ($null -ne $logger) {
            & $logger "Starting code coverage."
        }

        $config = $Context.Configuration['Coverage']

        if ($null -ne $logger) {
            & $logger "Config: $($config | & $script:SafeCommands['Out-String'])"
        }

        $breakpoints = Enter-CoverageAnalysis -CodeCoverage $config -Logger $logger

        $Context.GlobalPluginData.Add('Coverage', @{
            CommandCoverage = $breakpoints
            CoverageReport = $null
        })

        if ($null -ne $logger) {
            & $logger "Added $($breakpoints.Counts) breakpoints in $($sw.ElapsedMilliseconds) ms."
        }
    } -End {
        param($Context)

        if (-not $Context.TestRun.PluginData.ContainsKey("Coverage")) {
            return
        }

        $coverageData = $Context.TestRun.PluginData.Coverage
        $breakpoints = $coverageData.CommandCoverage

        Exit-CoverageAnalysis -CommandCoverage $breakpoints
    }
}
# file src\functions\Coverage.ps1
function Enter-CoverageAnalysis {
    [CmdletBinding()]
    param (
        [object[]] $CodeCoverage,
        [ScriptBlock] $Logger
    )

    $coverageInfo = foreach ($object in $CodeCoverage) {
            Get-CoverageInfoFromUserInput -InputObject $object -Logger $Logger
        }

    if ($null -eq $coverageInfo) {
        if ($null -ne $logger) {
            & $logger "No no files were found for coverage."
        }

        return @()
    }

    @(Get-CoverageBreakpoints -CoverageInfo $coverageInfo -Logger $Logger)
}

function Exit-CoverageAnalysis {
    param ([object] $CommandCoverage)

    & $SafeCommands['Set-StrictMode'] -Off

    # PSScriptAnalyzer it will flag this line because $null is on the LHS of -ne.
    # BUT that is correct in this case. We are filtering the list of breakpoints
    # to only get those that are not $null
    # (like if we did $breakpoints | where {$_ -ne $null})
    # so DON'T change this.
    $breakpoints = @($CommandCoverage.Breakpoint) -ne $null
    if ($breakpoints.Count -gt 0) {
        & $SafeCommands['Remove-PSBreakpoint'] -Breakpoint $breakpoints
    }
}

function Get-CoverageInfoFromUserInput {
    param (
        [Parameter(Mandatory = $true)]
        [object]
        $InputObject,
        $Logger
    )

    if ($InputObject -is [System.Collections.IDictionary]) {
        $unresolvedCoverageInfo = Get-CoverageInfoFromDictionary -Dictionary $InputObject
    }
    else {
        $Path = $InputObject -as [string]

        # Auto-detect IncludeTests-value from path-input if user provides path that is a test
        $IncludeTests = $Path -like "*$($PesterPreference.Run.TestExtension.Value)"

        $unresolvedCoverageInfo = New-CoverageInfo -Path $Path -IncludeTests $IncludeTests
    }

    Resolve-CoverageInfo -UnresolvedCoverageInfo $unresolvedCoverageInfo
}

function New-CoverageInfo {
    param ($Path, [string] $Class = $null, [string] $Function = $null, [int] $StartLine = 0, [int] $EndLine = 0, [bool] $IncludeTests = $false)

    return [pscustomobject]@{
        Path         = $Path
        Class        = $Class
        Function     = $Function
        StartLine    = $StartLine
        EndLine      = $EndLine
        IncludeTests = $IncludeTests
    }
}

function Get-CoverageInfoFromDictionary {
    param ([System.Collections.IDictionary] $Dictionary)

    $path = Get-DictionaryValueFromFirstKeyFound -Dictionary $Dictionary -Key 'Path', 'p'
    if ($null -eq $path -or 0 -ge @($path).Count) {
        throw "Coverage value '$($Dictionary | & $script:SafeCommands['Out-String'])' is missing required Path key."
    }

    $startLine = Get-DictionaryValueFromFirstKeyFound -Dictionary $Dictionary -Key 'StartLine', 'Start', 's'
    $endLine = Get-DictionaryValueFromFirstKeyFound -Dictionary $Dictionary -Key 'EndLine', 'End', 'e'
    [string] $class = Get-DictionaryValueFromFirstKeyFound -Dictionary $Dictionary -Key 'Class', 'c'
    [string] $function = Get-DictionaryValueFromFirstKeyFound -Dictionary $Dictionary -Key 'Function', 'f'
    $includeTests = Get-DictionaryValueFromFirstKeyFound -Dictionary $Dictionary -Key 'IncludeTests'

    $startLine = Convert-UnknownValueToInt -Value $startLine -DefaultValue 0
    $endLine = Convert-UnknownValueToInt -Value $endLine -DefaultValue 0
    [bool] $includeTests = Convert-UnknownValueToInt -Value $includeTests -DefaultValue 0

    return New-CoverageInfo -Path $path -StartLine $startLine -EndLine $endLine -Class $class -Function $function -IncludeTests $includeTests
}

function Convert-UnknownValueToInt {
    param ([object] $Value, [int] $DefaultValue = 0)

    try {
        return [int] $Value
    }
    catch {
        return $DefaultValue
    }
}

function Resolve-CoverageInfo {
    param ([psobject] $UnresolvedCoverageInfo)

    $path = $UnresolvedCoverageInfo.Path

    $testsPattern = "*$($PesterPreference.Run.TestExtension.Value)"
    $includeTests = $UnresolvedCoverageInfo.IncludeTests

    try {
        $resolvedPaths = & $SafeCommands['Resolve-Path'] -Path $path -ErrorAction Stop |
            & $SafeCommands['Where-Object'] { $includeTests -or $_.Path -notlike $testsPattern }
    }
    catch {
        & $SafeCommands['Write-Error'] "Could not resolve coverage path '$path': $($_.Exception.Message)"
        return
    }

    $filePaths = foreach ($resolvedPath in $resolvedPaths) {
        $item = & $SafeCommands['Get-Item'] -LiteralPath $resolvedPath
        if ($item -is [System.IO.FileInfo] -and ('.ps1', '.psm1') -contains $item.Extension) {
            $item.FullName
        }
        elseif (-not $item.PsIsContainer) {
            # todo: enable this warning for non wildcarded paths? otherwise it prints a ton of warnings for documenatation and so on when using "folder/*" wildcard
            # & $SafeCommands['Write-Warning'] "CodeCoverage path '$path' resolved to a non-PowerShell file '$($item.FullName)'; this path will not be part of the coverage report."
        }
    }

    $params = @{
        StartLine = $UnresolvedCoverageInfo.StartLine
        EndLine   = $UnresolvedCoverageInfo.EndLine
        Class     = $UnresolvedCoverageInfo.Class
        Function  = $UnresolvedCoverageInfo.Function
    }

    foreach ($filePath in $filePaths) {
        $params['Path'] = $filePath
        New-CoverageInfo @params
    }
}

function Get-CoverageBreakpoints {
    [CmdletBinding()]
    param (
        [object[]] $CoverageInfo,
        [ScriptBlock]$Logger
    )

    $fileGroups = @($CoverageInfo | & $SafeCommands['Group-Object'] -Property Path)
    foreach ($fileGroup in $fileGroups) {
        if ($null -ne $Logger) {
            $sw = [System.Diagnostics.Stopwatch]::StartNew()
            & $Logger "Initializing code coverage analysis for file '$($fileGroup.Name)'"
        }
        $totalCommands = 0
        $analyzedCommands = 0

        :commandLoop
        foreach ($command in Get-CommandsInFile -Path $fileGroup.Name) {
            $totalCommands++

            foreach ($coverageInfoObject in $fileGroup.Group) {
                if (Test-CoverageOverlapsCommand -CoverageInfo $coverageInfoObject -Command $command) {
                    $analyzedCommands++
                    New-CoverageBreakpoint -Command $command
                    continue commandLoop
                }
            }
        }
        if ($null -ne $Logger) {
            & $Logger  "Analyzing $analyzedCommands of $totalCommands commands in file '$($fileGroup.Name)' for code coverage, in $($sw.ElapsedMilliseconds) ms"
        }
    }
}

function Get-CommandsInFile {
    param ([string] $Path)

    $errors = $null
    $tokens = $null
    $ast = [System.Management.Automation.Language.Parser]::ParseFile($Path, [ref] $tokens, [ref] $errors)

    if ($PSVersionTable.PSVersion.Major -ge 5) {
        # In PowerShell 5.0, dynamic keywords for DSC configurations are represented by the DynamicKeywordStatementAst
        # class.  They still trigger breakpoints, but are not a child class of CommandBaseAst anymore.

        $predicate = {
            $args[0] -is [System.Management.Automation.Language.DynamicKeywordStatementAst] -or
            $args[0] -is [System.Management.Automation.Language.CommandBaseAst]
        }
    }
    else {
        $predicate = { $args[0] -is [System.Management.Automation.Language.CommandBaseAst] }
    }

    $searchNestedScriptBlocks = $true
    $ast.FindAll($predicate, $searchNestedScriptBlocks)
}

function Test-CoverageOverlapsCommand {
    param ([object] $CoverageInfo, [System.Management.Automation.Language.Ast] $Command)

    if ($CoverageInfo.Class -or $CoverageInfo.Function) {
        Test-CommandInScope -Command $Command -Class $CoverageInfo.Class -Function $CoverageInfo.Function
    }
    else {
        Test-CoverageOverlapsCommandByLineNumber @PSBoundParameters
    }

}

function Test-CommandInScope {
    param ([System.Management.Automation.Language.Ast] $Command, [string] $Class, [string] $Function)

    $classResult = !$Class
    $functionResult = !$Function
    for ($ast = $Command; $null -ne $ast; $ast = $ast.Parent) {
        if (!$classResult -and $PSVersionTable.PSVersion.Major -ge 5) {
            # Classes have been introduced in PowerShell 5.0
            $classAst = $ast -as [System.Management.Automation.Language.TypeDefinitionAst]
            if ($null -ne $classAst -and $classAst.Name -like $Class) {
                $classResult = $true
            }
        }
        if (!$functionResult) {
            $functionAst = $ast -as [System.Management.Automation.Language.FunctionDefinitionAst]
            if ($null -ne $functionAst -and $functionAst.Name -like $Function) {
                $functionResult = $true
            }
        }
        if ($classResult -and $functionResult) {
            return $true
        }
    }

    return $false
}

function Test-CoverageOverlapsCommandByLineNumber {
    param ([object] $CoverageInfo, [System.Management.Automation.Language.Ast] $Command)

    $commandStart = $Command.Extent.StartLineNumber
    $commandEnd = $Command.Extent.EndLineNumber
    $coverStart = $CoverageInfo.StartLine
    $coverEnd = $CoverageInfo.EndLine

    # An EndLine value of 0 means to cover the entire rest of the file from StartLine
    # (which may also be 0)
    if ($coverEnd -le 0) {
        $coverEnd = [int]::MaxValue
    }

    return (Test-RangeContainsValue -Value $commandStart -Min $coverStart -Max $coverEnd) -or
    (Test-RangeContainsValue -Value $commandEnd -Min $coverStart -Max $coverEnd)
}

function Test-RangeContainsValue {
    param ([int] $Value, [int] $Min, [int] $Max)
    return $Value -ge $Min -and $Value -le $Max
}

function New-CoverageBreakpoint {
    param ([System.Management.Automation.Language.Ast] $Command)

    if (IsIgnoredCommand -Command $Command) {
        return
    }

    $params = @{
        Script = $Command.Extent.File
        Line   = $Command.Extent.StartLineNumber
        Column = $Command.Extent.StartColumnNumber
        Action = { }
    }

    $breakpoint = & $SafeCommands['Set-PSBreakpoint'] @params

    [pscustomobject] @{
        File        = $Command.Extent.File
        Class       = Get-ParentClassName -Ast $Command
        Function    = Get-ParentFunctionName -Ast $Command
        StartLine   = $Command.Extent.StartLineNumber
        EndLine     = $Command.Extent.EndLineNumber
        StartColumn = $Command.Extent.StartColumnNumber
        EndColumn   = $Command.Extent.EndColumnNumber
        Command     = Get-CoverageCommandText -Ast $Command
        Breakpoint  = $breakpoint
    }
}

function IsIgnoredCommand {
    param ([System.Management.Automation.Language.Ast] $Command)

    if (-not $Command.Extent.File) {
        # This can happen if the script contains "configuration" or any similarly implemented
        # dynamic keyword.  PowerShell modifies the script code and reparses it in memory, leading
        # to AST elements with no File in their Extent.
        return $true
    }

    if ($PSVersionTable.PSVersion.Major -ge 4) {
        if ($Command.Extent.Text -eq 'Configuration') {
            # More DSC voodoo.  Calls to "configuration" generate breakpoints, but their HitCount
            # stays zero (even though they are executed.)  For now, ignore them, unless we can come
            # up with a better solution.
            return $true
        }

        if (IsChildOfHashtableDynamicKeyword -Command $Command) {
            # The lines inside DSC resource declarations don't trigger their breakpoints when executed,
            # just like the "configuration" keyword itself.  I don't know why, at this point, but just like
            # configuration, we'll ignore it so it doesn't clutter up the coverage analysis with useless junk.
            return $true
        }
    }

    if (IsClosingLoopCondition -Command $Command) {
        # For some reason, the closing expressions of do/while and do/until loops don't trigger their breakpoints.
        # To avoid useless clutter, we'll ignore those lines as well.
        return $true
    }

    return $false
}

function IsChildOfHashtableDynamicKeyword {
    param ([System.Management.Automation.Language.Ast] $Command)

    for ($ast = $Command.Parent; $null -ne $ast; $ast = $ast.Parent) {
        if ($PSVersionTable.PSVersion.Major -ge 5) {
            # The ast behaves differently for DSC resources with version 5+.  There's a new DynamicKeywordStatementAst class,
            # and they no longer are represented by CommandAst objects.

            if ($ast -is [System.Management.Automation.Language.DynamicKeywordStatementAst] -and
                $ast.CommandElements[-1] -is [System.Management.Automation.Language.HashtableAst]) {
                return $true
            }
        }
        else {
            if ($ast -is [System.Management.Automation.Language.CommandAst] -and
                $null -ne $ast.DefiningKeyword -and
                $ast.DefiningKeyword.BodyMode -eq [System.Management.Automation.Language.DynamicKeywordBodyMode]::Hashtable) {
                return $true
            }
        }
    }

    return $false
}

function IsClosingLoopCondition {
    param ([System.Management.Automation.Language.Ast] $Command)

    $ast = $Command

    while ($null -ne $ast.Parent) {
        if (($ast.Parent -is [System.Management.Automation.Language.DoWhileStatementAst] -or
                $ast.Parent -is [System.Management.Automation.Language.DoUntilStatementAst]) -and
            $ast.Parent.Condition -eq $ast) {
            return $true
        }

        $ast = $ast.Parent
    }

    return $false
}

function Get-ParentClassName {
    param ([System.Management.Automation.Language.Ast] $Ast)

    if ($PSVersionTable.PSVersion.Major -ge 5) {
        # Classes have been introduced in PowerShell 5.0

        $parent = $Ast.Parent

        while ($null -ne $parent -and $parent -isnot [System.Management.Automation.Language.TypeDefinitionAst]) {
            $parent = $parent.Parent
        }
    }

    if ($null -eq $parent) {
        return ''
    }
    else {
        return $parent.Name
    }
}

function Get-ParentFunctionName {
    param ([System.Management.Automation.Language.Ast] $Ast)

    $parent = $Ast.Parent

    while ($null -ne $parent -and $parent -isnot [System.Management.Automation.Language.FunctionDefinitionAst]) {
        $parent = $parent.Parent
    }

    if ($null -eq $parent) {
        return ''
    }
    else {
        return $parent.Name
    }
}

function Get-CoverageCommandText {
    param ([System.Management.Automation.Language.Ast] $Ast)

    $reportParentExtentTypes = @(
        [System.Management.Automation.Language.ReturnStatementAst]
        [System.Management.Automation.Language.ThrowStatementAst]
        [System.Management.Automation.Language.AssignmentStatementAst]
        [System.Management.Automation.Language.IfStatementAst]
    )

    $parent = Get-ParentNonPipelineAst -Ast $Ast

    if ($null -ne $parent) {
        if ($parent -is [System.Management.Automation.Language.HashtableAst]) {
            return Get-KeyValuePairText -HashtableAst $parent -ChildAst $Ast
        }
        elseif ($reportParentExtentTypes -contains $parent.GetType()) {
            return $parent.Extent.Text
        }
    }

    return $Ast.Extent.Text
}

function Get-ParentNonPipelineAst {
    param ([System.Management.Automation.Language.Ast] $Ast)

    $parent = $null
    if ($null -ne $Ast) {
        $parent = $Ast.Parent
    }

    while ($parent -is [System.Management.Automation.Language.PipelineAst]) {
        $parent = $parent.Parent
    }

    return $parent
}

function Get-KeyValuePairText {
    param (
        [System.Management.Automation.Language.HashtableAst] $HashtableAst,
        [System.Management.Automation.Language.Ast] $ChildAst
    )

    & $SafeCommands['Set-StrictMode'] -Off

    foreach ($keyValuePair in $HashtableAst.KeyValuePairs) {
        if ($keyValuePair.Item2.PipelineElements -contains $ChildAst) {
            return '{0} = {1}' -f $keyValuePair.Item1.Extent.Text, $keyValuePair.Item2.Extent.Text
        }
    }

    # This shouldn't happen, but just in case, default to the old output of just the expression.
    return $ChildAst.Extent.Text
}

function Get-CoverageMissedCommands {
    param ([object[]] $CommandCoverage)
    $CommandCoverage | & $SafeCommands['Where-Object'] { $_.Breakpoint.HitCount -eq 0 }
}

function Get-CoverageHitCommands {
    param ([object[]] $CommandCoverage)
    $CommandCoverage | & $SafeCommands['Where-Object'] { $_.Breakpoint.HitCount -gt 0 }
}

function Merge-CommandCoverage {
    param ([object[]] $CommandCoverage)

    # todo: this is a quick implementation of merging lists of breakpoints together, this is needed
    # because the code coverage is stored per container and so in the end a lot of commands are missed
    # in the container while they are hit in other, what we want is to know how many of the commands were
    # hit in at least one file. This simple implementation does not add together the number of hits on each breakpoint
    # so the HitCommands is not accurate, it only keeps the first breakpoint that points to that command and it's hit count
    # this should be improved in the future.

    # todo: move this implementation to the calling function so we don't need to split and merge the collection twice and we
    # can also accumulate the hit count across the different breakpoints

    $hitBps = @{}
    $hits = [System.Collections.Generic.List[object]]@()
    foreach ($bp in $CommandCoverage) {
        if (0 -lt $bp.Breakpoint.HitCount) {
            $key = "$($bp.File):$($bp.StartLine):$($bp.StartColumn)"
            if (-not $hitBps.ContainsKey($key)) {
                # adding to a hashtable to make sure we can look up the keys quickly
                # and also to an array list to make sure we can later dump them in the correct order
                $hitBps.Add($key, $bp)
                $null = $hits.Add($bp)
            }
        }
    }

    $missedBps = @{}
    $misses = [System.Collections.Generic.List[object]]@()
    foreach ($bp in $CommandCoverage) {
        if (0 -eq $bp.Breakpoint.HitCount) {
            $key = "$($bp.File):$($bp.StartLine):$($bp.StartColumn)"
            if (-not $hitBps.ContainsKey($key)) {
                if (-not $missedBps.ContainsKey($key)) {
                    $missedBps.Add($key, $bp)
                    $null = $misses.Add($bp)
                }
            }
        }
    }

    # this is also not very efficient because in the next step we are splitting this collection again
    # into hit and missed breakpoints
    $c = $hits.GetEnumerator() + $misses.GetEnumerator()
    $c
}

function Get-CoverageReport {
    # make sure this is an array, otherwise the counts start failing
    # on powershell 3
    param ([object[]] $CommandCoverage)

    $properties = @(
        'File'
        @{ Name = 'Line'; Expression = { $_.StartLine } }
        'StartLine'
        'EndLine'
        'StartColumn'
        'EndColumn'
        'Class'
        'Function'
        'Command'
        @{ Name = 'HitCount'; Expression = { $_.Breakpoint.HitCount } }
    )

    $missedCommands = @(Get-CoverageMissedCommands -CommandCoverage @($CommandCoverage) | & $SafeCommands['Select-Object'] $properties)
    $hitCommands = @(Get-CoverageHitCommands -CommandCoverage @($CommandCoverage) | & $SafeCommands['Select-Object'] $properties)
    $analyzedFiles = @(@($CommandCoverage) | & $SafeCommands['Select-Object'] -ExpandProperty File -Unique)


    [pscustomobject] @{
        NumberOfCommandsAnalyzed = $CommandCoverage.Count
        NumberOfFilesAnalyzed    = $analyzedFiles.Count
        NumberOfCommandsExecuted = $hitCommands.Count
        NumberOfCommandsMissed   = $missedCommands.Count
        MissedCommands           = $missedCommands
        HitCommands              = $hitCommands
        AnalyzedFiles            = $analyzedFiles
    }
}

function Get-CommonParentPath {
    param ([string[]] $Path)

    $pathsToTest = @(
        $Path |
            Normalize-Path |
            & $SafeCommands['Select-Object'] -Unique
    )

    if ($pathsToTest.Count -gt 0) {
        $parentPath = & $SafeCommands['Split-Path'] -Path $pathsToTest[0] -Parent

        while ($parentPath.Length -gt 0) {
            $nonMatches = $pathsToTest -notmatch "^$([regex]::Escape($parentPath))"

            if ($nonMatches.Count -eq 0) {
                return $parentPath
            }
            else {
                $parentPath = & $SafeCommands['Split-Path'] -Path $parentPath -Parent
            }
        }
    }

    return [string]::Empty
}

function Get-RelativePath {
    param ( [string] $Path, [string] $RelativeTo )
    return $Path -replace "^$([regex]::Escape("$RelativeTo$([System.IO.Path]::DirectorySeparatorChar)"))?"
}

function Normalize-Path {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('PSPath', 'FullName')]
        [string[]] $Path
    )

    # Split-Path and Join-Path will replace any AltDirectorySeparatorChar instances with the DirectorySeparatorChar
    # (Even if it's not the one that the split / join happens on.)  So splitting / rejoining a path will give us
    # consistent separators for later string comparison.

    process {
        if ($null -ne $Path) {
            foreach ($p in $Path) {
                $normalizedPath = & $SafeCommands['Split-Path'] $p -Leaf

                if ($normalizedPath -ne $p) {
                    $parent = & $SafeCommands['Split-Path'] $p -Parent
                    $normalizedPath = & $SafeCommands['Join-Path'] $parent $normalizedPath
                }

                $normalizedPath
            }
        }
    }
}

function Get-JaCoCoReportXml {
    param (
        [parameter(Mandatory = $true)]
        $CommandCoverage,
        [parameter(Mandatory = $true)]
        [object] $CoverageReport,
        [parameter(Mandatory = $true)]
        [long] $TotalMilliseconds
    )

    if ($null -eq $CoverageReport -or ($pester.Show -eq [Pester.OutputTypes]::None) -or $CoverageReport.NumberOfCommandsAnalyzed -eq 0) {
        return
    }

    $now = & $SafeCommands['Get-Date']
    $nineteenSeventy = & $SafeCommands['Get-Date'] -Date "01/01/1970"
    [long] $endTime = [math]::Floor((New-TimeSpan -start $nineteenSeventy -end $now).TotalMilliseconds)
    [long] $startTime = [math]::Floor($endTime - $TotalMilliseconds)

    $folderGroups = $CommandCoverage | & $SafeCommands["Group-Object"] -Property {
        & $SafeCommands["Split-Path"] $_.File -Parent
    }

    $packageList = [System.Collections.Generic.List[psobject]]@()

    $report = @{
        Instruction = @{ Missed = 0; Covered = 0 }
        Line        = @{ Missed = 0; Covered = 0 }
        Method      = @{ Missed = 0; Covered = 0 }
        Class       = @{ Missed = 0; Covered = 0 }
    }

    foreach ($folderGroup in $folderGroups) {

        $package = @{
            Name        = $folderGroup.Name
            Classes     = [ordered] @{ }
            Instruction = @{ Missed = 0; Covered = 0 }
            Line        = @{ Missed = 0; Covered = 0 }
            Method      = @{ Missed = 0; Covered = 0 }
            Class       = @{ Missed = 0; Covered = 0 }
        }

        foreach ($command in $folderGroup.Group) {
            $file = $command.File
            $function = $command.Function
            if (!$function) { $function = '<script>' }
            $line = $command.StartLine.ToString()

            $missed = if ($command.Breakpoint.HitCount) { 0 } else { 1 }
            $covered = if ($command.Breakpoint.HitCount) { 1 } else { 0 }

            if (!$package.Classes.Contains($file)) {
                $package.Class.Missed += $missed
                $package.Class.Covered += $covered
                $package.Classes.$file = @{
                    Methods     = [ordered] @{ }
                    Lines       = [ordered] @{ }
                    Instruction = @{ Missed = 0; Covered = 0 }
                    Line        = @{ Missed = 0; Covered = 0 }
                    Method      = @{ Missed = 0; Covered = 0 }
                    Class       = @{ Missed = $missed; Covered = $covered }
                }
            }

            if (!$package.Classes.$file.Methods.Contains($function)) {
                $package.Method.Missed += $missed
                $package.Method.Covered += $covered
                $package.Classes.$file.Method.Missed += $missed
                $package.Classes.$file.Method.Covered += $covered
                $package.Classes.$file.Methods.$function = @{
                    FirstLine   = $line
                    Instruction = @{ Missed = 0; Covered = 0 }
                    Line        = @{ Missed = 0; Covered = 0 }
                    Method      = @{ Missed = $missed; Covered = $covered }
                }
            }

            if (!$package.Classes.$file.Lines.Contains($line)) {
                $package.Line.Missed += $missed
                $package.Line.Covered += $covered
                $package.Classes.$file.Line.Missed += $missed
                $package.Classes.$file.Line.Covered += $covered
                $package.Classes.$file.Methods.$function.Line.Missed += $missed
                $package.Classes.$file.Methods.$function.Line.Covered += $covered
                $package.Classes.$file.Lines.$line = @{
                    Instruction = @{ Missed = 0; Covered = 0 }
                }
            }

            $package.Instruction.Missed += $missed
            $package.Instruction.Covered += $covered
            $package.Classes.$file.Instruction.Missed += $missed
            $package.Classes.$file.Instruction.Covered += $covered
            $package.Classes.$file.Methods.$function.Instruction.Missed += $missed
            $package.Classes.$file.Methods.$function.Instruction.Covered += $covered
            $package.Classes.$file.Lines.$line.Instruction.Missed += $missed
            $package.Classes.$file.Lines.$line.Instruction.Covered += $covered
        }

        $report.Class.Missed += $package.Class.Missed
        $report.Class.Covered += $package.Class.Covered
        $report.Method.Missed += $package.Method.Missed
        $report.Method.Covered += $package.Method.Covered
        $report.Line.Missed += $package.Line.Missed
        $report.Line.Covered += $package.Line.Covered
        $report.Instruction.Missed += $package.Instruction.Missed
        $report.Instruction.Covered += $package.Instruction.Covered

        $packageList.Add($package)
    }

    $commonParent = Get-CommonParentPath -Path $CoverageReport.AnalyzedFiles
    $commonParentLeaf = & $SafeCommands["Split-Path"] $commonParent -Leaf

    # the JaCoCo xml format without the doctype, as the XML stuff does not like DTD's.
    $jaCoCoReport = '<?xml version="1.0" encoding="UTF-8" standalone="no"?>'
    $jaCoCoReport += '<report name="">'
    $jaCoCoReport += '<sessioninfo id="this" start="" dump="" />'
    $jaCoCoReport += '</report>'

    [xml] $jaCoCoReportXml = $jaCoCoReport
    $reportElement = $jaCoCoReportXml.report
    $reportElement.name = "Pester ($now)"
    $reportElement.sessioninfo.start = $startTime.ToString()
    $reportElement.sessioninfo.dump = $endTime.ToString()

    foreach ($package in $packageList) {
        $packageRelativePath = Get-RelativePath -Path $package.Name -RelativeTo $commonParent

        if ($null -eq $packageRelativePath) {
            $packageName = $commonParentLeaf
        }
        else {
            $packageName = "{0}/{1}" -f $commonParentLeaf, $($packageRelativePath.Replace("\", "/"))
        }

        $packageElement = Add-XmlElement $reportElement "package" @{
            name = ($packageName -replace "/$", "")
        }

        foreach ($file in $package.Classes.Keys) {
            $class = $package.Classes.$file
            $classElementRelativePath = (Get-RelativePath -Path $file -RelativeTo $commonParent).Replace("\", "/")
            $classElementName = "{0}/{1}" -f $commonParentLeaf, $classElementRelativePath
            $classElementName = $classElementName.Substring(0, $($classElementName.LastIndexOf(".")))
            $classElement = Add-XmlElement $packageElement 'class' -Attributes ([ordered] @{
                    name           = $classElementName
                    sourcefilename = (& $SafeCommands["Split-Path"] -Path $classElementRelativePath -Leaf)
                })

            foreach ($function in $class.Methods.Keys) {
                $method = $class.Methods.$function
                $methodElement = Add-XmlElement $classElement 'method' -Attributes ([ordered] @{
                        name = $function
                        desc = '()'
                        line = $method.FirstLine
                    })
                Add-JaCoCoCounter Instruction $method $methodElement
                Add-JaCoCoCounter Line $method $methodElement
                Add-JaCoCoCounter Method $method $methodElement
            }

            Add-JaCoCoCounter Instruction $class $classElement
            Add-JaCoCoCounter Line $class $classElement
            Add-JaCoCoCounter Method $class $classElement
            Add-JaCoCoCounter Class $class $classElement
        }

        foreach ($file in $package.Classes.Keys) {
            $class = $package.Classes.$file
            $sourceFileElement = Add-XmlElement $packageElement 'sourcefile' -Attributes ([ordered] @{
                    name = (& $SafeCommands["Split-Path"] -Path $file -Leaf)
                })

            foreach ($line in $class.Lines.Keys) {
                $null = Add-XmlElement $sourceFileElement 'line' -Attributes ([ordered] @{
                        nr = $line
                        mi = $class.Lines.$line.Instruction.Missed
                        ci = $class.Lines.$line.Instruction.Covered
                        mb = 0
                        cb = 0
                    })
            }

            Add-JaCoCoCounter Instruction $class $sourceFileElement
            Add-JaCoCoCounter Line $class $sourceFileElement
            Add-JaCoCoCounter Method $class $sourceFileElement
            Add-JaCoCoCounter Class $class $sourceFileElement
        }

        Add-JaCoCoCounter Instruction $package $packageElement
        Add-JaCoCoCounter Line $package $packageElement
        Add-JaCoCoCounter Method $package $packageElement
        Add-JaCoCoCounter Class $package $packageElement
    }

    Add-JaCoCoCounter Instruction $report $reportElement
    Add-JaCoCoCounter Line $report $reportElement
    Add-JaCoCoCounter Method $report $reportElement
    Add-JaCoCoCounter Class $report $reportElement

    # There is no pretty way to insert the Doctype, as microsoft has deprecated the DTD stuff.
    $jaCoCoReportDocType = '<!DOCTYPE report PUBLIC "-//JACOCO//DTD Report 1.1//EN" "report.dtd">'
    $xml = $jaCocoReportXml.OuterXml.Insert(54, $jaCoCoReportDocType)

    return $xml
}

function Add-XmlElement {
    param (
        [parameter(Mandatory = $true)] [System.Xml.XmlNode] $Parent,
        [parameter(Mandatory = $true)] [string] $Name,
        [System.Collections.IDictionary] $Attributes
    )
    $element = $Parent.AppendChild($Parent.OwnerDocument.CreateElement($Name))
    if ($Attributes) {
        foreach ($key in $Attributes.Keys) {
            $attribute = $element.Attributes.Append($Parent.OwnerDocument.CreateAttribute($key))
            $attribute.Value = $Attributes.$key
        }
    }
    return $element
}

function Add-JaCoCoCounter {
    param (
        [parameter(Mandatory = $true)] [ValidateSet('Instruction', 'Line', 'Method', 'Class')] [string] $Type,
        [parameter(Mandatory = $true)] [System.Collections.IDictionary] $Data,
        [parameter(Mandatory = $true)] [System.Xml.XmlNode] $Parent
    )
    if ($Data.$Type.Missed -isnot [int] -or $Data.$Type.Covered -isnot [int]) {
        throw 'Counter data expected'
    }
    $null = Add-XmlElement $Parent 'counter' -Attributes ([ordered] @{
            type    = $Type.ToUpperInvariant()
            missed  = $Data.$Type.Missed
            covered = $Data.$Type.Covered
        })
}
# file src\functions\Describe.ps1
function Describe {
    <#
.SYNOPSIS
Creates a logical group of tests.

.DESCRIPTION
Creates a logical group of tests. All Mocks, TestDrive and TestRegistry contents
defined within a Describe block are scoped to that Describe; they
will no longer be present when the Describe block exits.  A Describe
block may contain any number of Context and It blocks.

.PARAMETER Name
The name of the test group. This is often an expressive phrase describing
the scenario being tested.

.PARAMETER Fixture
The actual test script. If you are following the AAA pattern (Arrange-Act-Assert),
this typically holds the arrange and act sections. The Asserts will also lie
in this block but are typically nested each in its own It block. Assertions are
typically performed by the Should command within the It blocks.

.PARAMETER Tag
Optional parameter containing an array of strings.  When calling Invoke-Pester,
it is possible to specify a -Tag parameter which will only execute Describe blocks
containing the same Tag.

.EXAMPLE
function Add-Numbers($a, $b) {
    return $a + $b
}

Describe "Add-Numbers" {
    It "adds positive numbers" {
        $sum = Add-Numbers 2 3
        $sum | Should -Be 5
    }

    It "adds negative numbers" {
        $sum = Add-Numbers (-2) (-2)
        $sum | Should -Be (-4)
    }

    It "adds one negative number to positive number" {
        $sum = Add-Numbers (-2) 2
        $sum | Should -Be 0
    }

    It "concatenates strings if given strings" {
        $sum = Add-Numbers two three
        $sum | Should -Be "twothree"
    }
}

.LINK
It
Context
Invoke-Pester
about_Should
about_Mocking
about_TestDrive

#>

    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string] $Name,

        [Alias('Tags')]
        [string[]] $Tag = @(),

        [Parameter(Position = 1)]
        [ValidateNotNull()]
        [ScriptBlock] $Fixture,

        # [Switch] $Focus,
        [Switch] $Skip
    )

    $Focus = $false
    if ($null -eq $Fixture) {
        if ($Name.Contains("`n")) {
            throw "Test fixture name has multiple lines and no test fixture is provided. (Have you provided a name for the test group?)"
        }
        else {
            throw 'No test fixture is provided. (Have you put the open curly brace on the next line?)'
        }
    }


    if ($ExecutionContext.SessionState.PSVariable.Get('invokedViaInvokePester')) {
        New-Block -Name $Name -ScriptBlock $Fixture -Tag $Tag -FrameworkData @{ CommandUsed = 'Describe' } -Focus:$Focus -Skip:$Skip
    }
    else {
        Invoke-Interactively -CommandUsed 'Describe' -ScriptName $PSCmdlet.MyInvocation.ScriptName -SessionState $PSCmdlet.SessionState -BoundParameters $PSCmdlet.MyInvocation.BoundParameters
    }
}

function Invoke-Interactively ($CommandUsed, $ScriptName, $SessionState, $BoundParameters) {
    # interactive execution (by F5 in an editor, by F8 on selection, or by pasting to console)
    # do not run interactively in non-saved files
    # (vscode will use path like "untitled:Untitled-*" so we check if the path is rooted)
    if (-not [String]::IsNullOrEmpty($ScriptName) -and [IO.Path]::IsPathRooted($ScriptName)) {

        if ($null -ne $script:lastExecutedAt -and ([datetime]::now - $script:lastExecutedAt).TotalMilliseconds -lt 100 -and $script:lastExecutedFile -eq $ScriptName) {
            # skip file if the same file was executed less than 100 ms ago. This is here because we will run the file from the first
            # describe and the subsequent describes in the same file would try to re-run the file. 100ms window should be good enough
            # to be transparent for the interactive use, yet big enough to advance from the end of the command to the next, even on slow systems
            # use the file name as well to allow running multiple files in sequence

            $script:lastExecutedFile = $ScriptName
            $script:lastExecutedAt = [datetime]::Now

            return
        }

        # we are invoking a file, try call Invoke-Pester on the whole file,
        # but make sure we are invoking it in the caller session state, because
        # paths don't stay attached to session state
        $invokePester =  {
            param($private:Path)
            Invoke-Pester -Path $Path | Out-Null
        }

        Set-ScriptBlockScope -SessionState $SessionState -ScriptBlock $invokePester
        & $invokePester $ScriptName
        $script:lastExecutedFile = $ScriptName
        $script:lastExecutedAt = [datetime]::Now
    }
    else {
        throw "Pester can run only saved files interactively. Please save your file to a disk."

        # there is a number of problems with this that I don't know how to solve right now
        # - the scripblock below will be discovered which shows a weird message in the console (maybe just suppress?)
        # every block will get it's own summary if we ar running multiple of them (can we somehow get to the actuall executed code?) or know which one is the last one?

        # use an intermediate module to carry the bound paremeters
        # but don't touch the session state the scriptblock is attached
        # to, this way we are still running the provided scriptblocks where
        # they are coming from (in the SessionState they are attached to),
        # this could be replaced by providing params if the current api allowed it
        $sb = & {
            # only local variables are copied in closure
            # make a new scope so we copy only what is needed
            param($BoundParameters, $CommandUsed)
            {
                & $CommandUsed @BoundParameters
            }.GetNewClosure()
        } $BoundParameters $CommandUsed

        Invoke-Pester -ScriptBlock $sb | Out-Null
    }
}

function Assert-DescribeInProgress {
    # TODO: Enforce block structure in the Runtime.Pester if needed, in the meantime this is just a placeholder
}
# file src\functions\Environment.ps1
function GetPesterPsVersion {
    # accessing the value indirectly so it can be mocked
    (& $SafeCommands['Get-Variable'] 'PSVersionTable' -ValueOnly).PSVersion.Major
}

function GetPesterOs {
    # Prior to v6, PowerShell was solely on Windows. In v6, the $IsWindows variable was introduced.
    if ((GetPesterPsVersion) -lt 6) {
        'Windows'
    }
    elseif (& $SafeCommands['Get-Variable'] -Name 'IsWindows' -ErrorAction 'SilentlyContinue' -ValueOnly ) {
        'Windows'
    }
    elseif (& $SafeCommands['Get-Variable'] -Name 'IsMacOS' -ErrorAction 'SilentlyContinue' -ValueOnly ) {
        'macOS'
    }
    elseif (& $SafeCommands['Get-Variable'] -Name 'IsLinux' -ErrorAction 'SilentlyContinue' -ValueOnly ) {
        'Linux'
    }
    else {
        throw "Unsupported Operating system!"
    }
}

function Get-TempDirectory {
    if ((GetPesterOs) -eq 'macOS') {
        # Special case for macOS using the real path instead of /tmp which is a symlink to this path
        "/private/tmp"
    }
    else {
        [System.IO.Path]::GetTempPath()
    }
}

function Get-TempRegistry {
    $pesterTempRegistryRoot = 'Microsoft.PowerShell.Core\Registry::HKEY_CURRENT_USER\Software\Pester'
    if (-not (Test-Path $pesterTempRegistryRoot)) {
        try {
            $null = New-Item -Path $pesterTempRegistryRoot -ErrorAction Stop
        }
        catch [Exception] {
            throw ([Exception]"Was not able to create a Pester Registry key for TestRegistry", ($_.Exception))
        }
    }
    return $pesterTempRegistryRoot
}
# file src\functions\Get-ShouldOperator.ps1
function Get-ShouldOperator {
    <#
    .SYNOPSIS
    Display the assertion operators available for use with Should.

    .DESCRIPTION
    Get-ShouldOperator returns a list of available Should parameters,
    their aliases, and examples to help you craft the tests you need.

    Get-ShouldOperator will list all available operators,
    including any registered by the user with Add-ShouldOperator.

    .NOTES
    Pester uses dynamic parameters to populate Should arguments.

    This limits the user's ability to discover the available assertions via
    standard PowerShell discovery patterns (like `Get-Help Should -Parameter *`).

    .EXAMPLE
    Get-ShouldOperator
    Return all available Should assertion operators and their aliases.

    .EXAMPLE
    Get-ShouldOperator -Name Be
    Return help examples for the Be assertion operator.
    -Name is a dynamic parameter that tab completes all available options.

    .LINK
    https://pester.dev/docs/commands/Should

    #>
    [CmdletBinding()]
    param ()

    # Use a dynamic parameter to create a dynamic ValidateSet
    # Define parameter -Name and tab-complete all current values of $AssertionOperators
    # Discovers included assertions (-Be, -Not) and any registered by the user via Add-ShouldOperator
    # https://martin77s.wordpress.com/2014/06/09/dynamic-validateset-in-a-dynamic-parameter/
    DynamicParam {
        $ParameterName = 'Name'

        $RuntimeParameterDictionary = & $SafeCommands['New-Object'] System.Management.Automation.RuntimeDefinedParameterDictionary
        $AttributeCollection = & $SafeCommands['New-Object'] System.Collections.ObjectModel.Collection[System.Attribute]
        $ParameterAttribute = & $SafeCommands['New-Object'] System.Management.Automation.ParameterAttribute

        $AttributeCollection.Add($ParameterAttribute)

        $arrSet = $AssertionOperators.Values |
        Select-Object -Property Name, Alias |
        ForEach-Object { $_.Name; $_.Alias }

        $ValidateSetAttribute = & $SafeCommands['New-Object']System.Management.Automation.ValidateSetAttribute($arrSet)

        $AttributeCollection.Add($ValidateSetAttribute)

        $RuntimeParameter = & $SafeCommands['New-Object'] System.Management.Automation.RuntimeDefinedParameter($ParameterName, [string], $AttributeCollection)
        $RuntimeParameterDictionary.Add($ParameterName, $RuntimeParameter)
        return $RuntimeParameterDictionary
    }

    BEGIN {
        # Bind the parameter to a friendly variable
        $Name = $PsBoundParameters[$ParameterName]
    }

    END {
        if ($Name) {
            $operator = $AssertionOperators.Values | Where-Object { $Name -eq $_.Name -or $_.Alias -contains $Name }
            $help = Get-Help $operator.InternalName -Examples -ErrorAction SilentlyContinue

            if (($help | Measure-Object).Count -ne 1) {
                Write-Warning ("No help found for Should operator '{0}'" -f ((Get-AssertionOperatorEntry $Name).InternalName))
            }
            else {
                $help
            }
        }
        else {
            $AssertionOperators.Keys | ForEach-Object {
                $aliases = (Get-AssertionOperatorEntry $_).Alias

                # Return name and alias(es) for all registered Should operators
                [PSCustomObject] @{
                    Name  = $_
                    Alias = $aliases -join ', '
                }
            }
        }
    }
}
# file src\functions\In.ps1
function In {
    <#
    .SYNOPSIS
    A convenience function that executes a script from a specified path.

    .DESCRIPTION
    Before the script block passed to the execute parameter is invoked,
    the current location is set to the path specified. Once the script
    block has been executed, the location will be reset to the location
    the script was in prior to calling In.

    .PARAMETER Path
    The path that the execute block will be executed in.

    .PARAMETER execute
    The script to be executed in the path provided.

    .LINK
    https://github.com/pester/Pester/wiki/In

    #>
    [CmdletBinding(DefaultParameterSetName="Default")]
    param(
        [Parameter(Mandatory, ParameterSetName="Default", Position=0)]
        [String] $Path,
        [Parameter(Mandatory, ParameterSetName="TestDrive", Position=0)]
        [Switch] $TestDrive,
        [Parameter(Mandatory, Position = 1)]
        [Alias("Execute")]
        [ScriptBlock] $ScriptBlock
    )

    # test drive is not available during discovery, ideally no code should
    # depend on location during discovery, but I cannot rely on that, so unless
    # the path is TestDrive the path is changed in discovery as well as during
    # the run phase
    $doNothing = $false
    if ($TestDrive) {
        if (Is-Discovery) {
            $doNothing = $true
        }
        else {
            $Path = (Get-PSDrive 'TestDrive').Root
        }
    }

    $originalPath = $pwd
    if (-not $doNothing) {
        & $SafeCommands['Set-Location'] $Path
        $pwd = $Path
    }
    try {
        & $ScriptBlock
    }
    finally {
        if (-not $doNothing) {
            & $SafeCommands['Set-Location'] $originalPath
            $pwd = $originalPath
        }
    }
}
# file src\functions\InModuleScope.ps1
function InModuleScope {
    <#
.SYNOPSIS
   Allows you to execute parts of a test script within the
   scope of a PowerShell script module.
.DESCRIPTION
   By injecting some test code into the scope of a PowerShell
   script module, you can use non-exported functions, aliases
   and variables inside that module, to perform unit tests on
   its internal implementation.

   InModuleScope may be used anywhere inside a Pester script,
   either inside or outside a Describe block.
.PARAMETER ModuleName
   The name of the module into which the test code should be
   injected. This module must already be loaded into the current
   PowerShell session.
.PARAMETER ScriptBlock
   The code to be executed within the script module.
.EXAMPLE
    ```ps
    # The script module:
    function PublicFunction
    {
        # Does something
    }

    function PrivateFunction
    {
        return $true
    }

    Export-ModuleMember -Function PublicFunction

    # The test script:

    Import-Module MyModule

    InModuleScope MyModule {
        Describe 'Testing MyModule' {
            It 'Tests the Private function' {
                PrivateFunction | Should -Be $true
            }
        }
    }
    ```

    Normally you would not be able to access "PrivateFunction" from
    the PowerShell session, because the module only exported
    "PublicFunction".  Using InModuleScope allowed this call to
    "PrivateFunction" to work successfully.
#>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $ModuleName,

        [Parameter(Mandatory = $true)]
        [scriptblock]
        $ScriptBlock,

        [HashTable]
        $Parameters,

        $ArgumentList
    )

    $module = Get-ScriptModule -ModuleName $ModuleName -ErrorAction Stop

    # TODO: could this simply be $PSCmdlet.SessionState? Because the original scope we are moving from
    # is the scope in which this command is running, right?
    # $originalState = $Pester.SessionState
    # $originalScriptBlockScope = Get-ScriptBlockScope -ScriptBlock $ScriptBlock

    # try {
    # $sessionState = Set-SessionStateHint -PassThru -Hint "Module - $($module.Name)" -SessionState $module.SessionState
    # $Pester.SessionState = $sessionState
    # Set-ScriptBlockScope -ScriptBlock $ScriptBlock -SessionState $sessionState

    # do {
    # Write-ScriptBlockInvocationHint -Hint "InModuleScope" -ScriptBlock $ScriptBlock
    & $module $ScriptBlock @Parameters @ArgumentList
    # } until ($true)
    # }
    # finally {
    # $Pester.SessionState = $originalState
    # Set-ScriptBlockScope -ScriptBlock $ScriptBlock -SessionStateInternal $originalScriptBlockScope
    # }
}

function Get-ScriptModule {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $ModuleName
    )

    try {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Runtime "Searching for a module $ModuleName."
        }
        $modules = @(& $SafeCommands['Get-Module'] -Name $ModuleName -All -ErrorAction Stop)
    }
    catch {
        throw "No modules named '$ModuleName' are currently loaded."
    }

    if ($modules.Count -eq 0) {
        throw "No modules named '$ModuleName' are currently loaded."
    }

    $scriptModules = @($modules | & $SafeCommands['Where-Object'] { $_.ModuleType -eq 'Script' })
    if ($scriptModules.Count -gt 1) {
        throw "Multiple script modules named '$ModuleName' are currently loaded.  Make sure to remove any extra copies of the module from your session before testing."
    }

    if ($scriptModules.Count -eq 0) {
        $actualTypes = @(
            $modules |
            & $SafeCommands['Where-Object'] { $_.ModuleType -ne 'Script' } |
            & $SafeCommands['Select-Object'] -ExpandProperty ModuleType -Unique
        )

        $actualTypes = $actualTypes -join ', '

        throw "Module '$ModuleName' is not a Script module.  Detected modules of the following types: '$actualTypes'"
    }
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Runtime "Found module $ModuleName version $($scriptModules[0].Version)."
    }
    return $scriptModules[0]
}
# file src\functions\It.ps1
function It {
    <#
.SYNOPSIS
Validates the results of a test inside of a Describe block.

.DESCRIPTION
The It command is intended to be used inside of a Describe or Context Block.
If you are familiar with the AAA pattern (Arrange-Act-Assert), the body of
the It block is the appropriate location for an assert. The convention is to
assert a single expectation for each It block. The code inside of the It block
should throw a terminating error if the expectation of the test is not met and
thus cause the test to fail. The name of the It block should expressively state
the expectation of the test.

In addition to using your own logic to test expectations and throw exceptions,
you may also use Pester's Should command to perform assertions in plain language.

You can intentionally mark It block result as inconclusive by using Set-TestInconclusive
command as the first tested statement in the It block.

.PARAMETER Name
An expressive phrase describing the expected test outcome.

.PARAMETER Test
The script block that should throw an exception if the
expectation of the test is not met.If you are following the
AAA pattern (Arrange-Act-Assert), this typically holds the
Assert.

.PARAMETER Pending
Use this parameter to explicitly mark the test as work-in-progress/not implemented/pending when you
need to distinguish a test that fails because it is not finished yet from a tests
that fail as a result of changes being made in the code base. An empty test, that is a
test that contains nothing except whitespace or comments is marked as Pending by default.

.PARAMETER Skip
Use this parameter to explicitly mark the test to be skipped. This is preferable to temporarily
commenting out a test, because the test remains listed in the output. Use the Strict parameter
of Invoke-Pester to force all skipped tests to fail.

.PARAMETER TestCases
Optional array of hashtable (or any IDictionary) objects.  If this parameter is used,
Pester will call the test script block once for each table in the TestCases array,
splatting the dictionary to the test script block as input.  If you want the name of
the test to appear differently for each test case, you can embed tokens into the Name
parameter with the syntax 'Adds numbers <A> and <B>' (assuming you have keys named A and B
in your TestCases hashtables.)

.EXAMPLE
function Add-Numbers($a, $b) {
    return $a + $b
}

Describe "Add-Numbers" {
    It "adds positive numbers" {
        $sum = Add-Numbers 2 3
        $sum | Should -Be 5
    }

    It "adds negative numbers" {
        $sum = Add-Numbers (-2) (-2)
        $sum | Should -Be (-4)
    }

    It "adds one negative number to positive number" {
        $sum = Add-Numbers (-2) 2
        $sum | Should -Be 0
    }

    It "concatenates strings if given strings" {
        $sum = Add-Numbers two three
        $sum | Should -Be "twothree"
    }
}

.EXAMPLE
function Add-Numbers($a, $b) {
    return $a + $b
}

Describe "Add-Numbers" {
    $testCases = @(
        @{ a = 2;     b = 3;       expectedResult = 5 }
        @{ a = -2;    b = -2;      expectedResult = -4 }
        @{ a = -2;    b = 2;       expectedResult = 0 }
        @{ a = 'two'; b = 'three'; expectedResult = 'twothree' }
    )

    It 'Correctly adds <a> and <b> to get <expectedResult>' -TestCases $testCases {
        param ($a, $b, $expectedResult)

        $sum = Add-Numbers $a $b
        $sum | Should -Be $expectedResult
    }
}

.LINK
https://github.com/pester/Pester/wiki/It

.LINK
Describe
Context
Set-TestInconclusive
about_should
#>
    [CmdletBinding(DefaultParameterSetName = 'Normal')]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string] $Name,

        [Parameter(Position = 1)]
        [ScriptBlock] $Test = {},

        [System.Collections.IDictionary[]] $TestCases,

        [String[]] $Tag,

        [Parameter(ParameterSetName = 'Pending')]
        [Switch] $Pending,

        [Parameter(ParameterSetName = 'Skip')]
        [Switch] $Skip

        # [Parameter(ParameterSetName = 'Skip')]
        # [String] $SkipBecause,

        # [Switch]$Focus
    )

    $Focus = $false
    if ($PSBoundParameters.ContainsKey('Pending')) {
        $PSBoundParameters.Remove('Pending')

        $Skip = $Pending
        # $SkipBecause = "This test is pending."
    }

    if (any $TestCases) {
        New-ParametrizedTest -Name $Name -ScriptBlock $Test -Data $TestCases -Tag $Tag -Focus:$Focus -Skip:$Skip
    }
    else {
        New-Test -Name $Name -ScriptBlock $Test -Tag $Tag -Focus:$Focus -Skip:$Skip
    }
}
# file src\functions\Mock.ps1


function Add-MockBehavior {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Behaviors,
        [Parameter(Mandatory)]
        $Behavior
    )

    if ($Behavior.IsDefault) {
        $Behaviors.Default.Add($Behavior)
    }
    else {
        $Behaviors.Parametrized.Add($Behavior)
    }
}

function New-MockBehavior {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $ContextInfo,
        [ScriptBlock] $MockWith = { },
        [Switch] $Verifiable,
        [ScriptBlock] $ParameterFilter,
        [Parameter(Mandatory)]
        $Hook,
        [string[]]$RemoveParameterType,
        [string[]]$RemoveParameterValidation
    )

    [PSCustomObject] @{
        CommandName = $ContextInfo.Command.Name
        ModuleName  = if ($ContextInfo.IsFromRequestedModule) { $ContextInfo.Module.Name } else { $null }
        Filter      = $ParameterFilter
        IsDefault   = $null -eq $ParameterFilter
        Verifiable  = $Verifiable
        ScriptBlock = $MockWith
        Hook        = $Hook
        PSTypeName  = 'MockBehavior'
    }
}

function EscapeSingleQuotedStringContent ($Content) {
    if ($global:PSVersionTable.PSVersion.Major -ge 5) {
        [System.Management.Automation.Language.CodeGeneration]::EscapeSingleQuotedStringContent($Content)
    }
    else {
        $Content -replace "['‘’‚‛]", '$&$&'
    }
}

function Create-MockHook ($contextInfo, $InvokeMockCallback) {
    $commandName = $contextInfo.Command.Name
    $moduleName = if ($contextInfo.IsFromRequestedModule) { $contextInfo.Module.Name } else { '' }
    $metadata = $null
    $cmdletBinding = ''
    $paramBlock = ''
    $dynamicParamBlock = ''
    $dynamicParamScriptBlock = $null

    if ($contextInfo.Command.psobject.Properties['ScriptBlock'] -or $contextInfo.Command.CommandType -eq 'Cmdlet') {
        $metadata = [System.Management.Automation.CommandMetaData]$contextInfo.Command
        $null = $metadata.Parameters.Remove('Verbose')
        $null = $metadata.Parameters.Remove('Debug')
        $null = $metadata.Parameters.Remove('ErrorAction')
        $null = $metadata.Parameters.Remove('WarningAction')
        $null = $metadata.Parameters.Remove('ErrorVariable')
        $null = $metadata.Parameters.Remove('WarningVariable')
        $null = $metadata.Parameters.Remove('OutVariable')
        $null = $metadata.Parameters.Remove('OutBuffer')

        # Some versions of PowerShell may include dynamic parameters here
        # We will filter them out and add them at the end to be
        # compatible with both earlier and later versions
        $dynamicParams = foreach ($m in $metadata.Parameters.Values) { if ($m.IsDynamic) { $m } }
        if ($null -ne $dynamicParams) {
            foreach ($p in $dynamicParams) {
                $null = $metadata.Parameters.Remove($d.name)
            }
        }
        $cmdletBinding = [Management.Automation.ProxyCommand]::GetCmdletBindingAttribute($metadata)
        if ($global:PSVersionTable.PSVersion.Major -ge 3 -and $contextInfo.Command.CommandType -eq 'Cmdlet') {
            if ($cmdletBinding -ne '[CmdletBinding()]') {
                $cmdletBinding = $cmdletBinding.Insert($cmdletBinding.Length - 2, ',')
            }
            $cmdletBinding = $cmdletBinding.Insert($cmdletBinding.Length - 2, 'PositionalBinding=$false')
        }

        # Will modify $metadata object in-place
        $originalMetadata = $metadata
        $metadata = Repair-ConflictingParameters -Metadata $metadata -RemoveParameterType $RemoveParameterType -RemoveParameterValidation $RemoveParameterValidation
        $paramBlock = [Management.Automation.ProxyCommand]::GetParamBlock($metadata)

        if ($contextInfo.Command.CommandType -eq 'Cmdlet') {
            $dynamicParamBlock = "dynamicparam { & `$MyInvocation.MyCommand.Mock.Get_MockDynamicParameter -CmdletName '$($contextInfo.Command.Name)' -Parameters `$PSBoundParameters }"
        }
        else {
            $dynamicParamStatements = Get-DynamicParamBlock -ScriptBlock $contextInfo.Command.ScriptBlock

            if ($dynamicParamStatements -match '\S') {
                $metadataSafeForDynamicParams = [System.Management.Automation.CommandMetaData]$contextInfo.Command
                foreach ($param in $metadataSafeForDynamicParams.Parameters.Values) {
                    $param.ParameterSets.Clear()
                }

                $paramBlockSafeForDynamicParams = [System.Management.Automation.ProxyCommand]::GetParamBlock($metadataSafeForDynamicParams)
                $comma = if ($metadataSafeForDynamicParams.Parameters.Count -gt 0) {
                    ','
                }
                else {
                    ''
                }
                $dynamicParamBlock = "dynamicparam { & `$MyInvocation.MyCommand.Mock.Get_MockDynamicParameter -ModuleName '$moduleName' -FunctionName '$commandName' -Parameters `$PSBoundParameters -Cmdlet `$PSCmdlet -DynamicParamScriptBlock `$MyInvocation.MyCommand.Mock.Hook.DynamicParamScriptBlock }"

                $code = @"
                    $cmdletBinding
                    param(
                        [object] `${P S Cmdlet}$comma
                        $paramBlockSafeForDynamicParams
                    )

                    `$PSCmdlet = `${P S Cmdlet}

                    $dynamicParamStatements
"@

                $dynamicParamScriptBlock = [scriptblock]::Create($code)

                $sessionStateInternal = $script:ScriptBlockSessionStateInternalProperty.GetValue($contextInfo.Command.ScriptBlock)

                if ($null -ne $sessionStateInternal) {
                    $script:ScriptBlockSessionStateInternalProperty.SetValue($dynamicParamScriptBlock, $sessionStateInternal)
                }
            }
        }
    }

    $mockPrototype = @"
    if (`$null -ne `$MyInvocation.MyCommand.Mock.Write_PesterDebugMessage) { & `$MyInvocation.MyCommand.Mock.Write_PesterDebugMessage -Message "Mock bootstrap function #FUNCTIONNAME# called from block #BLOCK#." }
    `$MyInvocation.MyCommand.Mock.Args = `$null
    if (#CANCAPTUREARGS#) {
        if (`$null -ne `$MyInvocation.MyCommand.Mock.Write_PesterDebugMessage) { & `$MyInvocation.MyCommand.Mock.Write_PesterDebugMessage -Message "Capturing arguments of the mocked command." }
        `$MyInvocation.MyCommand.Mock.Args = `$MyInvocation.MyCommand.Mock.ExecutionContext.SessionState.PSVariable.GetValue('local:args')
    }
    `$MyInvocation.MyCommand.Mock.PSCmdlet = `$MyInvocation.MyCommand.Mock.ExecutionContext.SessionState.PSVariable.GetValue('local:PSCmdlet')


    `if (`$null -ne `$MyInvocation.MyCommand.Mock.PSCmdlet)
    {
        `$MyInvocation.MyCommand.Mock.SessionState = `$MyInvocation.MyCommand.Mock.PSCmdlet.SessionState
    }

    # MockCallState initialization is injected only into the begin block by the code that generates this prototype
    # also it is not a good idea to share it via the function local data because then it will get overwritten by nested
    # mock if there is any, instead it should be a varible that gets defined in begin and so it survives during the whole
    # pipeline, but does not overwrite other variables, because we are running in different scopes. Mindblowing.
    & `$MyInvocation.MyCommand.Mock.Invoke_Mock -CommandName '#FUNCTIONNAME#' -ModuleName '#MODULENAME#' ```
        -BoundParameters `$PSBoundParameters ```
        -ArgumentList `$MyInvocation.MyCommand.Mock.Args ```
        -CallerSessionState `$MyInvocation.MyCommand.Mock.SessionState ```
        -MockCallState `$_____MockCallState ```
        -FromBlock '#BLOCK#' ```
        -Hook `$MyInvocation.MyCommand.Mock.Hook #INPUT#
"@
    $newContent = $mockPrototype
    $newContent = $newContent -replace '#FUNCTIONNAME#', (EscapeSingleQuotedStringContent $CommandName)
    $newContent = $newContent -replace '#MODULENAME#', (EscapeSingleQuotedStringContent $ModuleName)

    $canCaptureArgs = '$true'
    if ($contextInfo.Command.CommandType -eq 'Cmdlet' -or
        ($contextInfo.Command.CommandType -eq 'Function' -and $contextInfo.Command.CmdletBinding)) {
        $canCaptureArgs = '$false'
    }
    $newContent = $newContent -replace '#CANCAPTUREARGS#', $canCaptureArgs

    $code = @"
    $cmdletBinding
    param ( $paramBlock )
    $dynamicParamBlock
    begin
    {
        # MockCallState is set only in begin block, to persist state between
        # begin, process, and end blocks
        `$_____MockCallState = @{}
        $($newContent -replace '#BLOCK#', 'Begin' -replace '#INPUT#')
    }

    process
    {
        $($newContent -replace '#BLOCK#', 'Process' -replace '#INPUT#', '-InputObject @($input)')
    }

    end
    {
        $($newContent -replace '#BLOCK#', 'End' -replace '#INPUT#')
    }
"@

    $mockScript = [scriptblock]::Create($code)

    $mock = @{
        OriginalCommand         = $contextInfo.Command
        CommandName             = $commandName
        SessionState            = $contextInfo.SessionState
        CallerSessionState      = $contextInfo.CallerSessionState
        Metadata                = $metadata
        DynamicParamScriptBlock = $dynamicParamScriptBlock
        Aliases                 = [Collections.Generic.List[object]]@($commandName)
        BootstrapFunctionName   = 'PesterMock_' + [Guid]::NewGuid().Guid
    }

    if ($mock.OriginalCommand.ModuleName) {
        $mock.Aliases.Add("$($mock.OriginalCommand.ModuleName)\$($CommandName)")
    }

    if ('Application' -eq $Mock.OriginalCommand.CommandType) {
        $aliasWithoutExt = $CommandName -replace $Mock.OriginalCommand.Extension

        $mock.Aliases.Add($aliasWithoutExt)
    }

    $parameters = @{
        BootstrapFunctionName = $mock.BootstrapFunctionName
        Definition            = $mockScript
        Aliases               = $mock.Aliases

        Set_Alias             = $SafeCommands["Set-Alias"]
    }

    $defineFunctionAndAliases = {
        param($___Mock___parameters)
        # Make sure the you don't use _______parameters variable here, otherwise you overwrite
        # the variable that is defined in the same scope and the subsequent invocation of scrips will
        # be seriously broken (e.g. you will start resolving setups). But such is life of running in once scope.
        # from upper scope for no reason. But the reason is that you deleted ______param in this scope,
        # and so ______param from the parent scope was inherited

        ## THIS RUNS IN USER SCOPE, BE CAREFUL WHAT YOU PUBLISH AND COSUME


        # it is possible to remove the script: (and -Scope Script) from here and from the alias, which makes the Mock scope just like a function.
        # but that breaks mocking inside of Pester itself, because the mock is defined in this function and dies with it
        # this is a cool concept to play with, but scoping mocks more granularly than per It is not something people asked for, and cleaning up
        # mocks is trivial now they are wrote in distinct tables based on where they are defined, so let's just do it as before, script scoped
        # function and alias, and cleaning it up in teardown

        # define the function and returns an array so we need to take the function out
        @($ExecutionContext.InvokeProvider.Item.Set("Function:\script:$($___Mock___parameters.BootstrapFunctionName)", $___Mock___parameters.Definition, $true, $true))[0]

        # define all aliases
        foreach ($______current in $___Mock___parameters.Aliases) {
            # this does not work because the syntax does not work, but would be faster
            # $ExecutionContext.InvokeProvider.Item.Set("Alias:script\:$______current", $___Mock___parameters.BootstrapFunctionName, $true, $true)
            & $___Mock___parameters.Set_Alias -Name $______current -Value $___Mock___parameters.BootstrapFunctionName -Scope Script
        }

        # clean up the variables because we are injecting them to the current scope
        $ExecutionContext.SessionState.PSVariable.Remove('______current')
        $ExecutionContext.SessionState.PSVariable.Remove('___Mock___parameters')
    }

    $definedFunction = Invoke-InMockScope -SessionState $mock.SessionState -ScriptBlock $defineFunctionAndAliases -Arguments @($parameters) -NoNewScope
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock -Message "Defined new hook with bootstrap function $($parameters.BootstrapFunctionName)$(if ($parameters.Aliases.Count -gt 0) {" and aliases $($parameters.Aliases -join ", ")"})."
    }

    # attaching this object on the newly created function
    # so it has access to our internal and safe functions directly
    # and also to avoid any local variables, because everything is
    # accessed via $MyInvocation.MyCommand
    $functionLocalData = @{
        Args                     = $null
        SessionState             = $null

        Invoke_Mock              = $InvokeMockCallBack
        Get_MockDynamicParameter = $SafeCommands["Get-MockDynamicParameter"]
        # returning empty scriptblock when we should not write debug to avoid patching it in mock prototype
        Write_PesterDebugMessage = if ($PesterPreference.Debug.WriteDebugMessages.Value) { { param($Message) & $SafeCommands["Write-PesterDebugMessage"] -Scope MockCore -Message $Message } } else { $null }

        # used as temp variable
        PSCmdlet                 = $null

        # data from the time we captured and created this mock
        Hook                     = $mock

        ExecutionContext         = $ExecutionContext
    }

    $definedFunction.psobject.properties.Add([Pester.Factory]::CreateNoteProperty('Mock', $functionLocalData))

    $mock
}

function Should-InvokeVerifiableInternal {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Behaviors
    )

    $unverified = [System.Collections.Generic.List[Object]]@()
    foreach ($b in $Behaviors) {
        if ($b.Verifiable) {
            $unverified.Add($b)
        }
    }

    if ($unVerified.Count -gt 0) {
        foreach ($b in $unVerified) {
            $message = "$([System.Environment]::NewLine) Expected $($b.CommandName) "
            if ($b.ModuleName) {
                $message += "in module $($b.ModuleName) "
            }
            $message += "to be called with $($b.Filter)"
        }

        return [PSCustomObject] @{
            Succeeded      = $false
            FailureMessage = $message
        }
    }

    return [PSCustomObject] @{
        Succeeded      = $true
        FailureMessage = $null
    }
}

function Should-InvokeInternal {
    [CmdletBinding(DefaultParameterSetName = 'ParameterFilter')]
    param(
        [Parameter(Mandatory = $true)]
        [hashtable] $ContextInfo,

        [int]$Times = 1,

        [Parameter(ParameterSetName = 'ParameterFilter')]
        [ScriptBlock]$ParameterFilter = { $True },

        [Parameter(ParameterSetName = 'ExclusiveFilter', Mandatory = $true)]
        [scriptblock] $ExclusiveFilter,

        [string] $ModuleName,

        [switch]$Exactly,

        [Parameter(Mandatory)]
        [Management.Automation.SessionState] $SessionState,

        [Parameter(Mandatory)]
        [HashTable] $MockTable
    )

    if ($PSCmdlet.ParameterSetName -eq 'ParameterFilter') {
        $filter = $ParameterFilter
        $filterIsExclusive = $false
    }
    else {
        $filter = $ExclusiveFilter
        $filterIsExclusive = $true
    }

    if (-not $PSBoundParameters.ContainsKey('ModuleName') -and $null -ne $SessionState.Module) {
        $ModuleName = $SessionState.Module.Name
    }

    $ModuleName = if ($ContextInfo.IsFromRequestedModule) { $ContextInfo.Module.Name } else { $null }
    $CommandName = $ContextInfo.Command.Name

    $callHistory = $MockTable["$ModuleName||$CommandName"]

    $moduleMessage = ''
    if ($ModuleName) {
        $moduleMessage = " in module $ModuleName"
    }

    # if (-not $callHistory) {
    #     throw "You did not declare a mock of the $commandName Command${moduleMessage}."
    # }

    $matchingCalls = [System.Collections.Generic.List[object]]@()
    $nonMatchingCalls = [System.Collections.Generic.List[object]]@()

    foreach ($historyEntry in $callHistory) {

        $params = @{
            ScriptBlock     = $filter
            BoundParameters = $historyEntry.BoundParams
            ArgumentList    = $historyEntry.Args
            Metadata        = $ContextInfo.Hook.Metadata
            SessionState    = $ContextInfo.Hook.CallerSessionState
        }

        # if ($null -ne $ContextInfo.Hook.Metadata -and $null -ne $params.ScriptBlock) {
        #     $params.ScriptBlock = New-BlockWithoutParameterAliasesNew-BlockWithoutParameterAliases -Metadata $ContextInfo.Hook.Metadata -Block $params.ScriptBlock
        # }

        if (Test-ParameterFilter @params) {
            $null = $matchingCalls.Add($historyEntry)
        }
        else {
            $null = $nonMatchingCalls.Add($historyEntry)
        }
    }

    if ($matchingCalls.Count -ne $Times -and ($Exactly -or ($Times -eq 0))) {
        return [PSCustomObject] @{
            Succeeded      = $false
            FailureMessage = "Expected ${commandName}${moduleMessage} to be called $Times times exactly but was called $($matchingCalls.Count) times"
        }
    }
    elseif ($matchingCalls.Count -lt $Times) {
        return [PSCustomObject] @{
            Succeeded      = $false
            FailureMessage = "Expected ${commandName}${moduleMessage} to be called at least $Times times but was called $($matchingCalls.Count) times"
        }
    }
    elseif ($filterIsExclusive -and $nonMatchingCalls.Count -gt 0) {
        return [PSCustomObject] @{
            Succeeded      = $false
            FailureMessage = "Expected ${commandName}${moduleMessage} to only be called with with parameters matching the specified filter, but $($nonMatchingCalls.Count) non-matching calls were made"
        }
    }

    return [PSCustomObject] @{
        Succeeded      = $true
        FailureMessage = $null
    }
}

function Remove-MockHook {
    param (
        [Parameter(Mandatory)]
        $Hooks
    )

    $removeMockStub = {
        param (
            [string] $CommandName,
            [string[]] $Aliases
        )

        if ($ExecutionContext.InvokeProvider.Item.Exists("Function:\$CommandName", $true, $true)) {
            $ExecutionContext.InvokeProvider.Item.Remove("Function:\$CommandName", $false, $true, $true)
        }

        foreach ($alias in $Aliases) {
            if ($ExecutionContext.InvokeProvider.Item.Exists("Alias:$alias", $true, $true)) {
                $ExecutionContext.InvokeProvider.Item.Remove("Alias:$alias", $false, $true, $true)
            }
        }
    }

    foreach ($h in $Hooks) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock -Message "Removing function $($h.BootstrapFunctionName)$(if($h.Aliases) { " and aliases $($h.Aliases -join ", ")" }) for$(if($h.ModuleName) { " $($h.ModuleName) -" }) $($h.CommandName)."
        }

        $null = Invoke-InMockScope -SessionState $h.CallerSessionState -ScriptBlock $removeMockStub -Arguments $h.BootstrapFunctionName, $h.Aliases
    }
}

function Resolve-Command {
    param (
        [string] $CommandName,
        [string] $ModuleName,
        [Parameter(Mandatory)]
        [Management.Automation.SessionState] $SessionState
    )

    # saving the caller session state here, below the command is looked up and
    # the $SessionState is overwritten with the session state in which the command
    # was found (if -ModuleName was specified), but we will be running the mock body
    # in the caller scope (in the test scope), to be able to use the variables defined in the test inside of the mock
    # so we need to hold onto the caller scope
    $callerSessionState = $SessionState

    $command = $null
    $module = $null

    $findAndResolveCommand = {
        param ($Name)

        # this scriptblock gets bound to multiple session states so we can find
        # commands in module or in caller scope
        $command = $ExecutionContext.InvokeCommand.GetCommand($Name, 'All')
        # resolve command from alias recursively
        while ($null -ne $command -and $command.CommandType -eq [System.Management.Automation.CommandTypes]::Alias) {
            $resolved = $command.ResolvedCommand
            if ($null -eq $resolved) {
                throw "Alias $($command.Name) points to a command $($command.Definition) that but the actual commands no longer exists!"
            }
            $command = $resolved
        }

        return $command
    }

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock "Resolving command $CommandName."
    }
    if ($ModuleName) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock "ModuleName was specified searching for the command in module $ModuleName."
        }
        $module = Get-ScriptModule -ModuleName $ModuleName -ErrorAction Stop
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock "Found module $($module.Name) version $($module.Version)."
        }
        # this is the target session state in which we will insert the mock
        $SessionState = $module.SessionState
        $command = & $module $findAndResolveCommand -Name $CommandName
        if ($command) {
            if ($command.Module -eq $module) {
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Mock "Found the command $($CommandName) in module $($module.Name) version $($module.Version)$(if ($CommandName -ne $command.Name) {" and it resolved to $($command.Name)"})."
                }
            }
            else {
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Mock "Found the command $($CommandName) in a different module$(if ($CommandName -ne $command.Name) {" and it resolved to $($command.Name)"})."
                }
            }
        }
        else {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Mock "Did not find command $CommandName in module $($module.Name) version $($module.Version)."
            }
        }
    }

    if (-not $command) {


        # TODO: this resolves the command in the caller scope if the command was not found in the module scope, but that does not make sense does it? When the user specifies that he want's to use Module it should use just Module. Disabling the fall through makes tests fail.

        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock "Searching for command $CommandName in the caller scope."
        }
        Set-ScriptBlockScope -ScriptBlock $findAndResolveCommand -SessionState $SessionState
        $command = & $findAndResolveCommand -Name $CommandName
        if ($command) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Mock "Found the command $CommandName in the caller scope$(if ($CommandName -ne $command.Name) {" and it resolved to $($command.Name)"})."
            }
        }
        else {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Mock "Did not find command $CommandName in the caller scope."
            }
        }
    }

    if (-not $command) {
        throw ([System.Management.Automation.CommandNotFoundException] "Could not find Command $CommandName")
    }


    if ($command.Name -like 'PesterMock_*') {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope MockCore "The resolved command is a mock bootstrap function, pointing the mock to the same command info and session state as the original mock."
        }
        # the target module into which we inserted the mock
        $module = $command.Mock.Hook.SessionState.Module
        return @{
            Command                 = $command.Mock.Hook.OriginalCommand
            # the session state of the target module
            SessionState            = $command.Mock.Hook.SessionState
            # the session state in which we invoke the mock body (where the test runs)
            CallerSessionState      = $command.Mock.Hook.CallerSessionState
            # the module that defines the command
            Module                  = $command.Mock.Hook.OriginalCommand.Module
            # true if we inserted the mock into a module
            IsFromModule            = $null -ne $module
            # true if the commmand comes from the target module
            IsFromRequestedModule   = $null -ne $module -and $ModuleName -eq $command.Mock.Hook.OriginalCommand.Module.Name
            IsMockBootstrapFunction = $true
            Hook                    = $command.Mock.Hook
        }
    }

    $module = $command.Module
    return @{
        Command                 = $command
        SessionState            = $SessionState
        CallerSessionState      = $callerSessionState
        Module                  = $module

        IsFromModule            = $null -ne $module
        IsFromRequestedModule   = $null -ne $module -and $module.Name -eq $ModuleName
        IsMockBootstrapFunction = $false
        Hook                    = $null
    }
}

function Invoke-MockInternal {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $CommandName,

        [Parameter(Mandatory = $true)]
        [hashtable] $MockCallState,

        [string]
        $ModuleName,

        [hashtable]
        $BoundParameters = @{ },

        [object[]]
        $ArgumentList = @(),

        [object] $CallerSessionState,

        [ValidateSet('Begin', 'Process', 'End')]
        [string] $FromBlock,

        [object] $InputObject,

        [Parameter(Mandatory)]
        $Behaviors,

        [Parameter(Mandatory)]
        [HashTable]
        $CallHistory,

        [Parameter(Mandatory)]
        $Hook
    )

    switch ($FromBlock) {
        Begin {
            $MockCallState['InputObjects'] = [System.Collections.Generic.List[object]]@()
            $MockCallState['ShouldExecuteOriginalCommand'] = $false
            $MockCallState['BeginBoundParameters'] = $BoundParameters.Clone()
            # argument list must not be null, if the bootstrap functions has no parameters
            # we get null and need to replace it with empty array to make the splatting work
            # later on.
            $MockCallState['BeginArgumentList'] = $ArgumentList

            return
        }

        Process {
            # the incoming caller session state is the place from where
            # the mock hook is invoked, this does not have to be the same as
            # the test "caller scope" that we saved earlier, we won't use the
            # test caller scope here, but the scope from which the mock was called
            $SessionState = if ($CallerSessionState) { $CallerSessionState } else { $Hook.SessionState }

            # the @() are needed for powerShell3 otherwise it throws CheckAutomationNullInCommandArgumentArray (unless there is any breakpoint defined anywhere, then it works just fine :DDD)
            $behavior = FindMatchingBehavior -Behaviors @($Behaviors) -BoundParameters $BoundParameters -ArgumentList @($ArgumentList) -SessionState $SessionState -Hook $Hook

            if ($null -ne $behavior) {
                $call = @{
                    BoundParams = $BoundParameters
                    Args        = $ArgumentList
                    Hook        = $Hook
                    Behavior    = $behavior
                }
                $key = "$($behavior.ModuleName)||$($behavior.CommandName)"
                if (-not $CallHistory.ContainsKey($key)) {
                    $CallHistory.Add($key, [Collections.Generic.List[object]]@($call))
                }
                else {
                    $CallHistory[$key].Add($call)
                }

                ExecuteBehavior -Behavior $behavior `
                    -Hook $Hook `
                    -BoundParameters $BoundParameters `
                    -ArgumentList @($ArgumentList)

                return
            }
            else {
                $MockCallState['ShouldExecuteOriginalCommand'] = $true
                if ($null -ne $InputObject) {
                    $null = $MockCallState['InputObjects'].AddRange(@($InputObject))
                }

                return
            }
        }

        End {
            if ($MockCallState['ShouldExecuteOriginalCommand']) {
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Mock "Invoking the original command."
                }

                $MockCallState['BeginBoundParameters'] = Reset-ConflictingParameters -BoundParameters $MockCallState['BeginBoundParameters']

                if ($MockCallState['InputObjects'].Count -gt 0) {
                    $scriptBlock = {
                        param ($Command, $ArgumentList, $BoundParameters, $InputObjects)
                        $InputObjects | & $Command @ArgumentList @BoundParameters
                    }
                }
                else {
                    $scriptBlock = {
                        param ($Command, $ArgumentList, $BoundParameters, $InputObjects)
                        & $Command @ArgumentList @BoundParameters
                    }
                }

                $SessionState = if ($CallerSessionState) {
                    $CallerSessionState
                }
                else {
                    $Hook.SessionState
                }

                Set-ScriptBlockScope -ScriptBlock $scriptBlock -SessionState $SessionState

                # In order to mock Set-Variable correctly we need to write the variable
                # two scopes above
                if ("Set-Variable" -eq $Hook.OriginalCommand.Name) {
                    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                        Write-PesterDebugMessage -Scope Mock "Original command is Set-Variable, patching the call."
                    }
                    if ($MockCallState['BeginBoundParameters'].Keys -notcontains "Scope") {
                        $MockCallState['BeginBoundParameters'].Add( "Scope", 2)
                    }
                    # local is the same as scope 0, in that case we also write to scope 2
                    elseif ("Local", "0" -contains $MockCallState['BeginBoundParameters'].Scope) {
                        $MockCallState['BeginBoundParameters'].Scope = 2
                    }
                    elseif ($MockCallState['BeginBoundParameters'].Scope -match "\d+") {
                        $MockCallState['BeginBoundParameters'].Scope = 2 + $matches[0]
                    }
                    else {
                        # not sure what the user did, but we won't change it
                    }
                }

                if ($null -eq ($MockCallState['BeginArgumentList'])) {
                    $arguments = @()
                }
                else {
                    $arguments = $MockCallState['BeginArgumentList']
                }
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-ScriptBlockInvocationHint -Hint "Mock - Original Command" -ScriptBlock $scriptBlock
                }
                & $scriptBlock -Command $Hook.OriginalCommand `
                    -ArgumentList $arguments `
                    -BoundParameters $MockCallState['BeginBoundParameters'] `
                    -InputObjects $MockCallState['InputObjects']
            }
        }
    }
}

function FindMock {
    param (
        [Parameter(Mandatory)]
        [String] $CommandName,
        $ModuleName,
        [Parameter(Mandatory)]
        [HashTable] $MockTable
    )

    $result = @{
        Mock        = $null
        MockFound   = $false
        CommandName = $CommandName
        ModuleName  = $ModuleName
    }
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock "Looking for mock $($ModuleName)||$CommandName."
    }
    $MockTable["$($ModuleName)||$CommandName"]

    if ($null -ne $mock) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock "Found mock $(if (-not [string]::IsNullOrEmpty($ModuleName)) {"with module name $($ModuleName)"})||$CommandName."
        }
        $result.MockFound = $true
    }
    else {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock "No mock found, re-trying without module name ||$CommandName."
        }
        $mock = $MockTable["||$CommandName"]
        $result.ModuleName = $null
        if ($null -ne $mock) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Mock "Found mock without module name, setting the target module to empty."
            }
            $result.MockFound = $true
        }
        else {
            $result.MockFound = $false
        }
    }

    return $result
}

function FindMatchingBehavior {
    param (
        [Parameter(Mandatory)]
        $Behaviors,
        [hashtable] $BoundParameters = @{ },
        [object[]] $ArgumentList = @(),
        [Parameter(Mandatory)]
        [Management.Automation.SessionState] $SessionState,
        $Hook
    )

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock "Finding a mock behavior."
    }

    $foundDefaultBehavior = $false
    $defaultBehavior = $null
    foreach ($b in $Behaviors) {

        if ($b.IsDefault -and -not $foundDefaultBehavior) {
            # store the most recently defined default behavior we find
            $defaultBehavior = $b
            $foundDefaultBehavior = $true
        }

        if (-not $b.IsDefault) {
            $params = @{
                ScriptBlock     = $b.Filter
                BoundParameters = $BoundParameters
                ArgumentList    = $ArgumentList
                Metadata        = $Hook.Metadata
                SessionState    = $Hook.CallerSessionState
            }

            if (Test-ParameterFilter @params) {
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Mock "{ $($b.ScriptBlock) } passed parameter filter and will be used for the mock call."
                }
                return $b
            }
        }
    }

    if ($foundDefaultBehavior) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock "{ $($defaultBehavior.ScriptBlock) } is a default behavior and will be used for the mock call."
        }
        return $defaultBehavior
    }

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock "No parametrized or default behaviors were found filter."
    }
    return $null
}

function LastThat {
    param (
        $Collection,
        $Predicate
    )

    $count = $Collection.Count
    for ($i = $count; $i -gt 0; $i--) {
        $item = $Collection[$i]
        if (&$Predicate $Item) {
            return $Item
        }
    }
}


function ExecuteBehavior {
    param (
        $Behavior,
        $Hook,
        [hashtable] $BoundParameters = @{ },
        [object[]] $ArgumentList = @()
    )

    $ModuleName = $Behavior.ModuleName
    $CommandName = $Behavior.CommandName
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock "Executing mock behavior for mock$(if ($ModuleName) {" $ModuleName -" }) $CommandName."
    }

    $Behavior.Verifiable = $false

    $scriptBlock = {
        param (
            [Parameter(Mandatory = $true)]
            [scriptblock]
            ${Script Block},

            [hashtable]
            $___BoundParameters___ = @{ },

            [object[]]
            $___ArgumentList___ = @(),

            [System.Management.Automation.CommandMetadata]
            ${Meta data},

            [System.Management.Automation.SessionState]
            ${Session State},

            ${R e p o r t S c o p e},

            ${M o d u l e N a m e},

            ${Set Dynamic Parameter Variable}
        )

        # This script block exists to hold variables without polluting the test script's current scope.
        # Dynamic parameters in functions, for some reason, only exist in $PSBoundParameters instead
        # of being assigned a local variable the way static parameters do.  By calling Set-DynamicParameterVariable,
        # we create these variables for the caller's use in a Parameter Filter or within the mock itself, and
        # by doing it inside this temporary script block, those variables don't stick around longer than they
        # should.

        & ${Set Dynamic Parameter Variable} -SessionState ${Session State} -Parameters $___BoundParameters___ -Metadata ${Meta data}
        # Name property is not present on Application Command metadata in PowerShell 2
        & ${R e p o r t S c o p e} -ModuleName ${M o d u l e N a m e} -CommandName $(try {
                ${Meta data}.Name
            }
            catch {
            }) -ScriptBlock ${Script Block}
        & ${Script Block} @___BoundParameters___ @___ArgumentList___
    }

    if ($null -eq $Hook) {
        throw "Hook should not be null."
    }

    if ($null -eq $Hook.SessionState) {
        throw "Hook.SessionState should not be null."
    }

    Set-ScriptBlockScope -ScriptBlock $scriptBlock -SessionState $Hook.CallerSessionState
    $splat = @{
        'Script Block'                   = $Behavior.ScriptBlock
        '___ArgumentList___'             = $ArgumentList
        '___BoundParameters___'          = $BoundParameters
        'Meta data'                      = $Hook.Metadata
        'Session State'                  = $Hook.CallerSessionState
        'R e p o r t S c o p e'          = {
            param ($CommandName, $ModuleName, $ScriptBlock)
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-ScriptBlockInvocationHint -Hint "Mock - of command $CommandName$(if ($ModuleName) { "from module $ModuleName"})" -ScriptBlock $ScriptBlock
            }
        }
        'Set Dynamic Parameter Variable' = $SafeCommands['Set-DynamicParameterVariable']
    }

    # the real scriptblock is passed to the other one, we are interested in the mock, not the wrapper, so I pass $block.ScriptBlock, and not $scriptBlock
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-ScriptBlockInvocationHint -Hint "Mock - of command $CommandName$(if ($ModuleName) { "from module $ModuleName"})" -ScriptBlock ($behavior.ScriptBlock)
    }
    & $scriptBlock @splat
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock "Behavior for$(if ($ModuleName) { " $ModuleName -"}) $CommandName was executed."
    }
}

function Invoke-InMockScope {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.SessionState]
        $SessionState,

        [Parameter(Mandatory = $true)]
        [scriptblock]
        $ScriptBlock,

        [Parameter(Mandatory = $true)]
        $Arguments,

        [Switch]
        $NoNewScope
    )

    Set-ScriptBlockScope -ScriptBlock $ScriptBlock -SessionState $SessionState
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-ScriptBlockInvocationHint -Hint "Mock - InMockScope" -ScriptBlock $ScriptBlock
    }
    if ($NoNewScope) {
        . $ScriptBlock @Arguments
    }
    else {
        & $ScriptBlock @Arguments
    }
}

function Test-ParameterFilter {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [scriptblock]
        $ScriptBlock,

        [System.Collections.IDictionary]
        $BoundParameters,

        [object[]]
        $ArgumentList,

        [System.Management.Automation.CommandMetadata]
        $Metadata,

        [Parameter(Mandatory)]
        [Management.Automation.SessionState]
        $SessionState
    )

    if ($null -eq $BoundParameters) {
        $BoundParameters = @{ }
    }

    $arguments = $ArgumentList
    # $() gets rid of the @() defined for powershell 3
    if ($null -eq $($ArgumentList)) {
        $arguments = @()
    }

    $context = Get-ContextToDefine -BoundParameters $BoundParameters -Metadata $Metadata

    $wrapper = {
        param ($private:______mock_parameters)
        Set-StrictMode -Off

        foreach ($private:______current in $private:______mock_parameters.Context.GetEnumerator()) {
            $private:______mock_parameters.SessionState.PSVariable.Set($private:______current.Key, $private:______current.Value)
        }

        #TODO: a hacky solution to make Should throw on failure in Mock ParameterFilter, to make it good enough for the first release $______isInMockParameterFilter
        # this should not be private, it should leak into Should command when used in ParameterFilter
        $______isInMockParameterFilter = $true
        # $private:BoundParameters = $private:______mock_parameters.BoundParameters
        $private:Arguments = $private:______mock_parameters.Arguments
        # TODO: not binding the bound parameters here because it would make the parameters unbound when the user does
        # not provide a param block, which they would never provide, so that is okay, but if there is a workaround this then
        # it would be nice to have. maybe changing the order in which I bind?
        & $private:______mock_parameters.ScriptBlock @Arguments
    }

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        $hasContext = 0 -lt $Context.Count
        $c = $(if ($hasContext) {foreach ($p in $Context.GetEnumerator()) { "$($p.Key) = $($p.Value)" }}) -join ", "
        Write-PesterDebugMessage -Scope Mock -Message "Running mock filter { $scriptBlock } $(if ($hasContext) { "with context: $c" } else { "without any context"})."
    }

    Set-ScriptBlockScope -ScriptBlock $wrapper -SessionState $SessionState

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-ScriptBlockInvocationHint -Hint "Mock - Parameter filter" -ScriptBlock $wrapper
    }
    $parameters = @{
        ScriptBlock     = $ScriptBlock
        BoundParameters = $BoundParameters
        Arguments       = $Arguments
        SessionState    = $SessionState
        Context         = $context
    }

    $result = & $wrapper $parameters
    if ($result) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock -Message "Mock filter passed."
        }
    }
    else {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock -Message "Mock filter did not pass."
        }
    }
    $result
}

function Get-ContextToDefine {
    param (
        [System.Collections.IDictionary] $BoundParameters,
        [System.Management.Automation.CommandMetadata] $Metadata
    )

    $conflictingParameterNames = Get-ConflictingParameterNames
    $r = @{ }
    # key the parameters by aliases so we can resolve to
    # the param itself and define it and all of it's aliases
    $h = @{ }
    if ($null -eq $Metadata) {
        # there is no metadata so there will be no aliases
        # return the parameters that we got, just fix the conflicting
        # names
        foreach ($p in $BoundParameters.GetEnumerator()) {
            $name = if ($p.Key -in $conflictingParameterNames) {
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Mock -Message "! Variable `$$($p.Key) is a built-in variable, rewriting it to `$_$($p.Key). Use the version with _ in your -ParameterFilter."
                }
                "_$($p.Key)"
            }
            else {
                $p.Key
            }

            $r.Add($name, $p.Value)
        }

        return $r
    }

    foreach ($p in $Metadata.Parameters.GetEnumerator()) {
        $aliases = $p.Value.Aliases
        if ($null -ne $aliases -and 0 -lt @($aliases).Count) {
            foreach ($a in $aliases) { $h.Add($a, $p) }
        }
    }

    foreach ($param in $BoundParameters.GetEnumerator()) {
        $parameterInfo = if ($h.ContainsKey($param.Key)) {
            $h.($param.Key)
        }
        elseif ($Metadata.Parameters.ContainsKey($param.Key)) {
            $Metadata.Parameters.($param.Key)
        }

        $value = $param.Value

        if ($parameterInfo) {
            foreach ($p in $parameterInfo) {
                $name = if ($p.Name -in $conflictingParameterNames) {
                    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                        Write-PesterDebugMessage -Scope Mock -Message "! Variable `$$($p.Name) is a built-in variable, rewriting it to `$_$($p.Name). Use the version with _ in your -ParameterFilter."
                    }
                    "_$($p.Name)"
                }
                else {
                    $p.Name
                }

                if (-not $r.ContainsKey($name)) {
                    $r.Add($name, $value)
                }

                foreach ($a in $p.Aliases) {
                    $name = if ($a -in $conflictingParameterNames) {
                        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                            Write-PesterDebugMessage -Scope Mock -Message "! Variable `$$($a) is a built-in variable, rewriting it to `$_$($a). Use the version with _ in your -ParameterFilter."
                        }
                        "_$($a)"
                    }
                    else {
                        $a
                    }

                    if (-not $r.ContainsKey($name)) {
                        $r.Add($name, $value)
                    }
                }
            }
        }
        else {
            # the parameter is not defined in the parameter set,
            # it is probably dynamic, let's see if I can get away with just adding
            # it to the list of stuff to define

            $name = if ($param.Key -in $script:ConflictingParameterNames) {
                if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                    Write-PesterDebugMessage -Scope Mock -Message "! Variable `$$($param.Key) is a built-in variable, rewriting it to `$_$($param.Key). Use the version with _ in your -ParameterFilter."
                }
                "_$($param.Key)"
            }
            else {
                $param.Key
            }

            if (-not $r.ContainsKey($name)) {
                $r.Add($name, $param.Value)
            }
        }
    }

    $r
}

function IsCommonParameter {
    param (
        [string] $Name,
        [System.Management.Automation.CommandMetadata] $Metadata
    )

    if ($null -ne $Metadata) {
        if ([System.Management.Automation.Internal.CommonParameters].GetProperty($Name)) {
            return $true
        }
        if ($Metadata.SupportsShouldProcess -and [System.Management.Automation.Internal.ShouldProcessParameters].GetProperty($Name)) {
            return $true
        }
        if ($Metadata.SupportsPaging -and [System.Management.Automation.PagingParameters].GetProperty($Name)) {
            return $true
        }
        if ($Metadata.SupportsTransactions -and [System.Management.Automation.Internal.TransactionParameters].GetProperty($Name)) {
            return $true
        }
    }

    return $false
}

function Set-DynamicParameterVariable {
    <#
        .SYNOPSIS
        This command is used by Pester's Mocking framework.  You do not need to call it directly.
    #>

    param (
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.SessionState]
        $SessionState,

        [hashtable]
        $Parameters,

        [System.Management.Automation.CommandMetadata]
        $Metadata
    )

    if ($null -eq $Parameters) {
        $Parameters = @{ }
    }

    foreach ($keyValuePair in $Parameters.GetEnumerator()) {
        $variableName = $keyValuePair.Key

        if (-not (IsCommonParameter -Name $variableName -Metadata $Metadata)) {
            if ($ExecutionContext.SessionState -eq $SessionState) {
                & $SafeCommands['Set-Variable'] -Scope 1 -Name $variableName -Value $keyValuePair.Value -Force -Confirm:$false -WhatIf:$false
            }
            else {
                $SessionState.PSVariable.Set($variableName, $keyValuePair.Value)
            }
        }
    }
}

function Get-DynamicParamBlock {
    param (
        [scriptblock] $ScriptBlock
    )

    if ($ScriptBlock.AST.psobject.Properties.Name -match "Body") {
        if ($null -ne $ScriptBlock.Ast.Body.DynamicParamBlock) {
            $statements = $ScriptBlock.Ast.Body.DynamicParamBlock.Statements.Extent.Text

            return $statements -join [System.Environment]::NewLine
        }
    }
}

function Get-MockDynamicParameter {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'Cmdlet')]
        [string] $CmdletName,

        [Parameter(Mandatory = $true, ParameterSetName = 'Function')]
        [string] $FunctionName,

        [Parameter(ParameterSetName = 'Function')]
        [string] $ModuleName,

        [System.Collections.IDictionary] $Parameters,

        [object] $Cmdlet,

        [Parameter(ParameterSetName = "Function")]
        $DynamicParamScriptBlock
    )

    switch ($PSCmdlet.ParameterSetName) {
        'Cmdlet' {
            Get-DynamicParametersForCmdlet -CmdletName $CmdletName -Parameters $Parameters
        }

        'Function' {
            Get-DynamicParametersForMockedFunction -DynamicParamScriptBlock $DynamicParamScriptBlock -Parameters $Parameters -Cmdlet $Cmdlet
        }
    }
}

function Get-DynamicParametersForCmdlet {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string] $CmdletName,

        [ValidateScript( {
                if ($PSVersionTable.PSVersion.Major -ge 3 -and
                    $null -ne $_ -and
                    $_.GetType().FullName -ne 'System.Management.Automation.PSBoundParametersDictionary') {
                    throw 'The -Parameters argument must be a PSBoundParametersDictionary object ($PSBoundParameters).'
                }

                return $true
            })]
        [System.Collections.IDictionary] $Parameters
    )

    try {
        $command = & $SafeCommands['Get-Command'] -Name $CmdletName -CommandType Cmdlet -ErrorAction Stop

        if (@($command).Count -gt 1) {
            throw "Name '$CmdletName' resolved to multiple Cmdlets"
        }
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }

    if ($null -eq $command.ImplementingType.GetInterface('IDynamicParameters', $true)) {
        return
    }

    if ('5.0.10586.122' -lt $PSVersionTable.PSVersion) {
        # Older version of PS required Reflection to do this.  It has run into problems on occasion with certain cmdlets,
        # such as ActiveDirectory and AzureRM, so we'll take advantage of the newer PSv5 engine features if at all possible.

        if ($null -eq $Parameters) {
            $paramsArg = @()
        }
        else {
            $paramsArg = @($Parameters)
        }

        $command = $ExecutionContext.InvokeCommand.GetCommand($CmdletName, [System.Management.Automation.CommandTypes]::Cmdlet, $paramsArg)
        $paramDictionary = [System.Management.Automation.RuntimeDefinedParameterDictionary]::new()

        foreach ($param in $command.Parameters.Values) {
            if (-not $param.IsDynamic) {
                continue
            }
            if ($Parameters.ContainsKey($param.Name)) {
                continue
            }

            $dynParam = [System.Management.Automation.RuntimeDefinedParameter]::new($param.Name, $param.ParameterType, $param.Attributes)
            $paramDictionary.Add($param.Name, $dynParam)
        }

        return $paramDictionary
    }
    else {
        if ($null -eq $Parameters) {
            $Parameters = @{ }
        }

        $cmdlet = & $SafeCommands['New-Object'] $command.ImplementingType.FullName

        $flags = [System.Reflection.BindingFlags]'Instance, Nonpublic'
        $context = $ExecutionContext.GetType().GetField('_context', $flags).GetValue($ExecutionContext)
        [System.Management.Automation.Cmdlet].GetProperty('Context', $flags).SetValue($cmdlet, $context, $null)

        foreach ($keyValuePair in $Parameters.GetEnumerator()) {
            $property = $cmdlet.GetType().GetProperty($keyValuePair.Key)
            if ($null -eq $property -or -not $property.CanWrite) {
                continue
            }

            $isParameter = [bool]($property.GetCustomAttributes([System.Management.Automation.ParameterAttribute], $true))
            if (-not $isParameter) {
                continue
            }

            $property.SetValue($cmdlet, $keyValuePair.Value, $null)
        }

        try {
            # This unary comma is important in some cases.  On Windows 7 systems, the ActiveDirectory module cmdlets
            # return objects from this method which implement IEnumerable for some reason, and even cause PowerShell
            # to throw an exception when it tries to cast the object to that interface.

            # We avoid that problem by wrapping the result of GetDynamicParameters() in a one-element array with the
            # unary comma.  PowerShell enumerates that array instead of trying to enumerate the goofy object, and
            # everyone's happy.

            # Love the comma.  Don't delete it.  We don't have a test for this yet, unless we can get the AD module
            # on a Server 2008 R2 build server, or until we write some C# code to reproduce its goofy behavior.

            , $cmdlet.GetDynamicParameters()
        }
        catch [System.NotImplementedException] {
            # Some cmdlets implement IDynamicParameters but then throw a NotImplementedException.  I have no idea why.  Ignore them.
        }
    }
}

function Get-DynamicParametersForMockedFunction {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        $DynamicParamScriptBlock,

        [System.Collections.IDictionary]
        $Parameters,

        [object]
        $Cmdlet
    )

    if ($DynamicParamScriptBlock) {
        $splat = @{ 'P S Cmdlet' = $Cmdlet }
        return & $DynamicParamScriptBlock @Parameters @splat
    }
}

function Test-IsClosure {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [scriptblock]
        $ScriptBlock
    )

    $sessionStateInternal = $script:ScriptBlockSessionStateInternalProperty.GetValue($ScriptBlock)
    if ($null -eq $sessionStateInternal) {
        return $false
    }

    $flags = [System.Reflection.BindingFlags]'Instance,NonPublic'
    $module = $sessionStateInternal.GetType().GetProperty('Module', $flags).GetValue($sessionStateInternal, $null)

    return (
        $null -ne $module -and
        $module.Name -match '^__DynamicModule_([a-f\d-]+)$' -and
        $null -ne ($matches[1] -as [guid])
    )
}

function Remove-MockFunctionsAndAliases {
    # when a test is terminated (e.g. by stopping at a breakpoint and then stoping the execution of the script)
    # the aliases and bootstrap functions for the currently mocked functions will remain in place
    # Then on subsequent runs the bootstrap function will be picked up instead of the real command,
    # because there is still an alias associated with it, and the test will fail.
    # So before putting Pester state in place we should make sure that all Pester mocks are gone
    # by deleting every alias pointing to a function that starts with PesterMock_. Then we also delete the
    # bootstrap function.
    foreach ($alias in (& $script:SafeCommands['Get-Alias'] -Definition "PesterMock_*")) {
        & $script:SafeCommands['Remove-Item'] "alias:/$($alias.Name)"
    }

    foreach ($bootstrapFunction in (& $script:SafeCommands['Get-Command'] -Name "PesterMock_*")) {
        & $script:SafeCommands['Remove-Item'] "function:/$($bootstrapFunction.Name)"
    }
}

function Repair-ConflictingParameters {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.CommandMetadata])]
    param(
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.CommandMetadata]
        $Metadata,
        [Parameter()]
        [string[]]
        $RemoveParameterType,
        [Parameter()]
        [string[]]
        $RemoveParameterValidation
    )

    $repairedMetadata = [System.Management.Automation.CommandMetadata]$Metadata
    $paramMetadatas = [Collections.Generic.List[object]]@($repairedMetadata.Parameters.Values)

    # unnecessary function call that could be replaced by variable access, but is needed for tests
    $conflictingParams = Get-ConflictingParameterNames

    foreach ($paramMetadata in $paramMetadatas) {
        if ($paramMetadata.IsDynamic) {
            continue
        }

        # rewrite the metadata to avoid defining confliting parameters
        # in the function such as $PSEdition
        if ($conflictingParams -contains $paramMetadata.Name) {
            $paramName = $paramMetadata.Name
            $newName = "_$paramName"
            $paramMetadata.Name = $newName
            $paramMetadata.Aliases.Add($paramName)

            $null = $repairedMetadata.Parameters.Remove($paramName)
            $repairedMetadata.Parameters.Add($newName, $paramMetadata)
        }

        $attrIndexesToRemove = [System.Collections.Generic.List[object]]@()

        if ($RemoveParameterType -contains $paramMetadata.Name) {
            $paramMetadata.ParameterType = [object]

            for ($i = 0; $i -lt $paramMetadata.Attributes.Count; $i++) {
                $attr = $paramMetadata.Attributes[$i]
                if ($attr -is [PSTypeNameAttribute]) {
                    $null = $attrIndexesToRemove.Add($i)
                    break
                }
            }
        }

        if ($RemoveParameterValidation -contains $paramMetadata.Name) {
            for ($i = 0; $i -lt $paramMetadata.Attributes.Count; $i++) {
                $attr = $paramMetadata.Attributes[$i]
                if ($attr -is [System.Management.Automation.ValidateArgumentsAttribute]) {
                    $null = $attrIndexesToRemove.Add($i)
                }
            }
        }

        foreach ($index in $attrIndexesToRemove) {
            $null = $paramMetadata.Attributes.RemoveAt($index)
        }
    }

    $repairedMetadata
}

function Reset-ConflictingParameters {
    [CmdletBinding()]
    [OutputType([hashtable])]
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]
        $BoundParameters
    )

    $parameters = $BoundParameters.Clone()
    # unnecessary function call that could be replaced by variable access, but is needed for tests
    $names = Get-ConflictingParameterNames

    foreach ($param in $names) {
        $fixedName = "_$param"

        if (-not $parameters.ContainsKey($fixedName)) {
            continue
        }

        $parameters[$param] = $parameters[$fixedName]
        $null = $parameters.Remove($fixedName)
    }

    $parameters
}

$script:ConflictingParameterNames = @(
    '?'
    'ConsoleFileName'
    'EnabledExperimentalFeatures'
    'Error'
    'ExecutionContext'
    'false'
    'HOME'
    'Host'
    'IsCoreCLR'
    'IsMacOS'
    'IsWindows'
    'PID'
    'PSCulture'
    'PSEdition'
    'PSHOME'
    'PSUICulture'
    'PSVersionTable'
    'ShellId'
    'true'
)

function Get-ConflictingParameterNames {
    $script:ConflictingParameterNames
}

function Get-ScriptBlockAST {
    param (
        [scriptblock]
        $ScriptBlock
    )

    if ($ScriptBlock.Ast -is [System.Management.Automation.Language.ScriptBlockAst]) {
        $ast = $Block.Ast.EndBlock
    }
    elseif ($ScriptBlock.Ast -is [System.Management.Automation.Language.FunctionDefinitionAst]) {
        $ast = $Block.Ast.Body.EndBlock
    }
    else {
        throw "Pester failed to parse ParameterFilter, scriptblock is invalid type. Please reformat your ParameterFilter."
    }

    return $ast
}

function New-BlockWithoutParameterAliases {
    [OutputType([scriptblock])]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNull()]
        [System.Management.Automation.CommandMetadata]
        $Metadata,
        [Parameter(Mandatory = $true)]
        [ValidateNotNull()]
        [scriptblock]
        $Block
    )
    try {
        if ($PSVersionTable.PSVersion.Major -ge 3) {
            $params = $Metadata.Parameters.Values
            $ast = Get-ScriptBlockAST $Block
            $blockText = $ast.Extent.Text
            $variables = [array]($Ast.FindAll( { param($ast) $ast -is [System.Management.Automation.Language.VariableExpressionAst] }, $true))
            [array]::Reverse($variables)

            foreach ($var in $variables) {
                $varName = $var.VariablePath.UserPath
                $length = $varName.Length

                foreach ($param in $params) {
                    if ($param.Aliases -contains $varName) {
                        $startIndex = $var.Extent.StartOffset - $ast.Extent.StartOffset + 1 # move one position after the dollar sign

                        $blockText = $blockText.Remove($startIndex, $length).Insert($startIndex, $param.Name)

                        break # It is safe to stop checking for further params here, since aliases cannot be shared by parameters
                    }
                }
            }

            $Block = [scriptblock]::Create($blockText)
        }

        $Block
    }
    catch {
        $PSCmdlet.ThrowTerminatingError($_)
    }
}
# file src\functions\New-MockObject.ps1
function New-MockObject {
    <#
.SYNOPSIS
This function instantiates a .NET object from a type.

.DESCRIPTION
Using the New-MockObject you can mock an object based on .NET type.

An .NET assembly for the particular type must be available in the system and loaded.

.PARAMETER Type
The .NET type to create an object based on.

.EXAMPLE
```ps
$obj = New-MockObject -Type 'System.Diagnostics.Process'
$obj.GetType().FullName
    System.Diagnostics.Process
```
#>

    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [type]$Type
    )

    [System.Runtime.Serialization.Formatterservices]::GetUninitializedObject($Type)

}
# file src\functions\Output.ps1
$script:ReportStrings = DATA {
    @{
        StartMessage      = "Executing all tests in '{0}'"
        FilterMessage     = ' matching test name {0}'
        TagMessage        = ' with Tags {0}'
        MessageOfs        = "', '"

        CoverageTitle     = 'Code coverage report:'
        CoverageMessage   = 'Covered {2:P2} of {3:N0} analyzed {0} in {4:N0} {1}.'
        MissedSingular    = 'Missed command:'
        MissedPlural      = 'Missed commands:'
        CommandSingular   = 'Command'
        CommandPlural     = 'Commands'
        FileSingular      = 'File'
        FilePlural        = 'Files'

        Describe          = 'Describing {0}'
        Script            = 'Executing script {0}'
        Context           = 'Context {0}'
        Margin            = ' '
        Timing            = 'Tests completed in {0}'

        # If this is set to an empty string, the count won't be printed
        ContextsPassed    = ''
        ContextsFailed    = ''

        TestsPassed       = 'Tests Passed: {0}, '
        TestsFailed       = 'Failed: {0}, '
        TestsSkipped      = 'Skipped: {0} '
        TestsPending      = 'Pending: {0}, '
        TestsInconclusive = 'Inconclusive: {0}, '
        TestsNotRun       = 'NotRun: {0}'
    }
}

$script:ReportTheme = DATA {
    @{
        Describe         = 'Green'
        DescribeDetail   = 'DarkYellow'
        Context          = 'Cyan'
        ContextDetail    = 'DarkCyan'
        Pass             = 'DarkGreen'
        PassTime         = 'DarkGray'
        Fail             = 'Red'
        FailTime         = 'DarkGray'
        Skipped          = 'Yellow'
        SkippedTime      = 'DarkGray'
        Pending          = 'Gray'
        PendingTime      = 'DarkGray'
        NotRun           = 'Gray'
        NotRunTime       = 'DarkGray'
        Total            = 'Gray'
        Inconclusive     = 'Gray'
        InconclusiveTime = 'DarkGray'
        Incomplete       = 'Yellow'
        IncompleteTime   = 'DarkGray'
        Foreground       = 'White'
        Information      = 'DarkGray'
        Coverage         = 'White'
        CoverageWarn     = 'DarkRed'
    }
}

function Format-PesterPath ($Path, [String]$Delimiter) {
    # -is check is not enough for the arrays, the incoming value will likely be object[]
    # so we have to check if we can upcast to our required type

    if ($null -eq $Path) {
        $null
    }
    elseif ($Path -is [String]) {
        $Path
    }
    elseif ($Path -is [hashtable]) {
        # a well formed pester hashtable contains Path
        $Path.Path
    }
    elseif ($null -ne ($path -as [hashtable[]])) {
        ($path | ForEach-Object { $_.Path }) -join $Delimiter
    }
    # needs to stay at the bottom because almost everything can be upcast to array of string
    elseif ($Path -as [String[]]) {
        $Path -join $Delimiter
    }
}

function Write-PesterStart {
    param(
        [Parameter(mandatory = $true, valueFromPipeline = $true)]
        $Context
    )
    process {
        # if (-not ( $Context.Show | Has-Flag 'All, Fails, Header')) {
        #     return
        # }

        $OFS = $ReportStrings.MessageOfs

        $hash = @{
            Files        = [System.Collections.Generic.List[object]]@()
            ScriptBlocks = 0
        }

        foreach ($c in $Context.Containers) {
            switch ($c.Type) {
                "File" { $null = $hash.Files.Add($c.Item.FullName) }
                "ScriptBlock" { $null = $hash.ScriptBlocks++ }
                Default { throw "$($c.Type) is not supported." }
            }
        }

        $message = $ReportStrings.StartMessage -f (Format-PesterPath $hash.Files -Delimiter $OFS)

        $message = "$message$(if (0 -lt $hash.ScriptBlocks) { ", and in $($hash.ScriptBlocks) scriptblocks." })"
        # todo write out filters that are applied
        # if ($PesterState.TestNameFilter) {
        #     $message += $ReportStrings.FilterMessage -f "$($PesterState.TestNameFilter)"
        # }
        # if ($PesterState.ScriptBlockFilter) {
        #     $m = $(foreach ($m in $PesterState.ScriptBlockFilter) { "$($m.Path):$($m.Line)" }) -join ", "
        #     $message += $ReportStrings.FilterMessage -f $m
        # }
        # if ($PesterState.TagFilter) {
        #     $message += $ReportStrings.TagMessage -f "$($PesterState.TagFilter)"
        # }

        & $SafeCommands['Write-Host'] $message -Foreground $ReportTheme.Foreground
    }
}


function ConvertTo-PesterResult {
    param(
        [String] $Name,
        [Nullable[TimeSpan]] $Time,
        [System.Management.Automation.ErrorRecord] $ErrorRecord
    )

    $testResult = @{
        Name           = $Name
        Time           = $time
        FailureMessage = ""
        StackTrace     = ""
        ErrorRecord    = $null
        Success        = $false
        Result         = "Failed"
    }

    if (-not $ErrorRecord) {
        $testResult.Result = "Passed"
        $testResult.Success = $true
        return $testResult
    }

    if (@('PesterAssertionFailed', 'PesterTestSkipped', 'PesterTestInconclusive', 'PesterTestPending') -contains $ErrorRecord.FullyQualifiedErrorID) {
        # we use TargetObject to pass structured information about the error.
        $details = $ErrorRecord.TargetObject

        $failureMessage = $details.Message
        $file = $details.File
        $line = $details.Line
        $Text = $details.LineText

        if (-not $Pester.Strict) {
            switch ($ErrorRecord.FullyQualifiedErrorID) {
                PesterTestInconclusive {
                    $testResult.Result = "Inconclusive"; break;
                }
                PesterTestPending {
                    $testResult.Result = "Pending"; break;
                }
                PesterTestSkipped {
                    $testResult.Result = "Skipped"; break;
                }
            }
        }
    }
    else {
        $failureMessage = $ErrorRecord.ToString()
        $file = $ErrorRecord.InvocationInfo.ScriptName
        $line = $ErrorRecord.InvocationInfo.ScriptLineNumber
        $Text = $ErrorRecord.InvocationInfo.Line
    }

    $testResult.FailureMessage = $failureMessage
    $testResult.StackTrace = "at <ScriptBlock>, ${file}: line ${line}$([System.Environment]::NewLine)${line}: ${Text}"
    $testResult.ErrorRecord = $ErrorRecord

    return $testResult
}

function Write-PesterReport {
    param (
        [Parameter(mandatory = $true, valueFromPipeline = $true)]
        $RunResult
    )
    # if(-not ($PesterState.Show | Has-Flag Summary)) { return }

    & $SafeCommands['Write-Host'] ($ReportStrings.Timing -f (Get-HumanTime ($RunResult.Duration))) -Foreground $ReportTheme.Foreground

    $Success, $Failure = if ($RunResult.FailedCount -gt 0) {
        $ReportTheme.Foreground, $ReportTheme.Fail
    }
    else {
        $ReportTheme.Pass, $ReportTheme.Information
    }

    $Skipped = if ($RunResult.SkippedCount -gt 0) {
        $ReportTheme.Skipped
    }
    else {
        $ReportTheme.Information
    }

    $NotRun = if ($RunResult.NotRunCount -gt 0) {
        $ReportTheme.NotRun
    }
    else {
        $ReportTheme.Information
    }

    $Total = if ($RunResult.TotalCount -gt 0) {
        $ReportTheme.Total
    }
    else {
        $ReportTheme.Information
    }

    # $Pending = if ($RunResult.PendingCount -gt 0) {
    #     $ReportTheme.Pending
    # }
    # else {
    #     $ReportTheme.Information
    # }
    # $Inconclusive = if ($RunResult.InconclusiveCount -gt 0) {
    #     $ReportTheme.Inconclusive
    # }
    # else {
    #     $ReportTheme.Information
    # }

    # Try {
    #     $PesterStatePassedScenariosCount = $PesterState.PassedScenarios.Count
    # }
    # Catch {
    #     $PesterStatePassedScenariosCount = 0
    # }

    # Try {
    #     $PesterStateFailedScenariosCount = $PesterState.FailedScenarios.Count
    # }
    # Catch {
    #     $PesterStateFailedScenariosCount = 0
    # }

    # if ($ReportStrings.ContextsPassed) {
    #     & $SafeCommands['Write-Host'] ($ReportStrings.ContextsPassed -f $PesterStatePassedScenariosCount) -Foreground $Success -NoNewLine
    #     & $SafeCommands['Write-Host'] ($ReportStrings.ContextsFailed -f $PesterStateFailedScenariosCount) -Foreground $Failure
    # }
    # if ($ReportStrings.TestsPassed) {
        & $SafeCommands['Write-Host'] ($ReportStrings.TestsPassed -f $RunResult.PassedCount) -Foreground $Success -NoNewLine
        & $SafeCommands['Write-Host'] ($ReportStrings.TestsFailed -f $RunResult.FailedCount) -Foreground $Failure -NoNewLine
        & $SafeCommands['Write-Host'] ($ReportStrings.TestsSkipped -f $RunResult.SkippedCount) -Foreground $Skipped -NoNewLine
        & $SafeCommands['Write-Host'] ($ReportStrings.TestsTotal -f $RunResult.TotalCount) -Foreground $Total -NoNewLine
        & $SafeCommands['Write-Host'] ($ReportStrings.TestsNotRun -f $RunResult.NotRunCount) -Foreground $NotRun

    if (0 -lt $RunResult.FailedBlocksCount) {
        & $SafeCommands['Write-Host'] ("BeforeAll \ AfterAll failed: {0}" -f $RunResult.FailedBlocksCount) -Foreground $ReportTheme.Fail
        & $SafeCommands['Write-Host'] ($(foreach ($b in $RunResult.FailedBlocks) { "  - $($b.Path -join '.')" }) -join [Environment]::NewLine) -Foreground $ReportTheme.Fail
    }

    if (0 -lt $RunResult.FailedContainersCount) {
        $cs = foreach ($container in $RunResult.FailedContainers) {
            $path = if ("File" -eq $container.Type) {
                $container.Item.FullName
            }
            elseif ("ScriptBlock" -eq $container.Type) {
                "<ScriptBlock>$($container.Item.File):$($container.Item.StartPosition.StartLine)"
            }
            else {
                throw "Container type '$($container.Type)' is not supported."
            }

            "  - $path"
        }
        & $SafeCommands['Write-Host'] ("Container failed: {0}" -f $RunResult.FailedContainersCount) -Foreground $ReportTheme.Fail
        & $SafeCommands['Write-Host'] ($cs -join [Environment]::NewLine) -Foreground $ReportTheme.Fail
    }
        # & $SafeCommands['Write-Host'] ($ReportStrings.TestsPending -f $RunResult.PendingCount) -Foreground $Pending -NoNewLine
        # & $SafeCommands['Write-Host'] ($ReportStrings.TestsInconclusive -f $RunResult.InconclusiveCount) -Foreground $Inconclusive
    # }
}

function Write-CoverageReport {
    param ([object] $CoverageReport)

    if ($null -eq $CoverageReport -or ($pester.Show -eq [Pester.OutputTypes]::None) -or $CoverageReport.NumberOfCommandsAnalyzed -eq 0) {
        return
    }

    $totalCommandCount = $CoverageReport.NumberOfCommandsAnalyzed
    $fileCount = $CoverageReport.NumberOfFilesAnalyzed
    $executedPercent = ($CoverageReport.NumberOfCommandsExecuted / $CoverageReport.NumberOfCommandsAnalyzed).ToString("P2")

    $command = if ($totalCommandCount -gt 1) {
        $ReportStrings.CommandPlural
    }
    else {
        $ReportStrings.CommandSingular
    }
    $file = if ($fileCount -gt 1) {
        $ReportStrings.FilePlural
    }
    else {
        $ReportStrings.FileSingular
    }

    $commonParent = Get-CommonParentPath -Path $CoverageReport.AnalyzedFiles
    $report = $CoverageReport.MissedCommands | & $SafeCommands['Select-Object'] -Property @(
        @{ Name = 'File'; Expression = { Get-RelativePath -Path $_.File -RelativeTo $commonParent } }
        'Class'
        'Function'
        'Line'
        'Command'
    )

    & $SafeCommands['Write-Host']
    & $SafeCommands['Write-Host'] $ReportStrings.CoverageTitle -Foreground $ReportTheme.Coverage

    if ($CoverageReport.MissedCommands.Count -gt 0) {
        & $SafeCommands['Write-Host'] ($ReportStrings.CoverageMessage -f $command, $file, $executedPercent, $totalCommandCount, $fileCount) -Foreground $ReportTheme.CoverageWarn
        if ($CoverageReport.MissedCommands.Count -eq 1) {
            & $SafeCommands['Write-Host'] $ReportStrings.MissedSingular -Foreground $ReportTheme.CoverageWarn
        }
        else {
            & $SafeCommands['Write-Host'] $ReportStrings.MissedPlural -Foreground $ReportTheme.CoverageWarn
        }
        $report | & $SafeCommands['Format-Table'] -AutoSize | & $SafeCommands['Out-Host']
    }
    else {
        & $SafeCommands['Write-Host'] ($ReportStrings.CoverageMessage -f $command, $file, $executedPercent, $totalCommandCount, $fileCount) -Foreground $ReportTheme.Coverage
    }
}

function ConvertTo-FailureLines {
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $ErrorRecord,
        [switch] $ForceFullError
    )
    process {
        $lines = [PSCustomObject] @{
            Message = @()
            Trace   = @()
        }

        # return $lines

        ## convert the exception messages
        $exception = $ErrorRecord.Exception
        $exceptionLines = @()

        while ($exception) {
            $exceptionName = $exception.GetType().Name
            $thisLines = $exception.Message.Split([string[]]($([System.Environment]::NewLine), "`n"), [System.StringSplitOptions]::RemoveEmptyEntries)
            if (0 -lt @($thisLines).Count -and $ErrorRecord.FullyQualifiedErrorId -ne 'PesterAssertionFailed') {
                $thisLines[0] = "$exceptionName`: $($thisLines[0])"
            }
            [array]::Reverse($thisLines)
            $exceptionLines += $thisLines
            $exception = $exception.InnerException
        }
        [array]::Reverse($exceptionLines)
        $lines.Message += $exceptionLines
        if ($ErrorRecord.FullyQualifiedErrorId -eq 'PesterAssertionFailed') {
            $lines.Message += "at $($ErrorRecord.TargetObject.LineText.Trim()), $($ErrorRecord.TargetObject.File):$($ErrorRecord.TargetObject.Line)".Split([string[]]($([System.Environment]::NewLine), "`n"), [System.StringSplitOptions]::RemoveEmptyEntries)
        }

        if ( -not ($ErrorRecord | & $SafeCommands['Get-Member'] -Name ScriptStackTrace) ) {
            if ($ErrorRecord.FullyQualifiedErrorID -eq 'PesterAssertionFailed') {
                $lines.Trace += "at line: $($ErrorRecord.TargetObject.Line) in $($ErrorRecord.TargetObject.File)"
            }
            else {
                $lines.Trace += "at line: $($ErrorRecord.InvocationInfo.ScriptLineNumber) in $($ErrorRecord.InvocationInfo.ScriptName)"
            }
            return $lines
        }

        ## convert the stack trace if present (there might be none if we are raising the error ourselves)
        # todo: this is a workaround see https://github.com/pester/Pester/pull/886
        if ($null -ne $ErrorRecord.ScriptStackTrace) {
            $traceLines = $ErrorRecord.ScriptStackTrace.Split([Environment]::NewLine, [System.StringSplitOptions]::RemoveEmptyEntries)
        }

        if ($ForceFullError -or $PesterPreference.Debug.ShowFullErrors.Value) {
            $lines.Trace += $traceLines
        }
        else {
            # omit the lines internal to Pester
            if ((GetPesterOS) -ne 'Windows') {
                [String]$isPesterFunction = '^at .*, .*/Pester.psm1: line [0-9]*$'
                [String]$isShould = '^at (Should<End>|Invoke-Assertion), .*/Pester.psm1: line [0-9]*$'
                # [String]$pattern6 = '^at <ScriptBlock>, (<No file>|.*/Pester.psm1): line [0-9]*$'
            }
            else {
                [String]$isPesterFunction = '^at .*, .*\\Pester.psm1: line [0-9]*$'
                [String]$isShould = '^at (Should<End>|Invoke-Assertion), .*\\Pester.psm1: line [0-9]*$'
            }

            # reducing the stack trace so we see only stack trace until the current It block and not up until the invocation of the
            # whole test script itself. This is achieved by shortening the stack trace when any Runtime function is hit.
            # what we don't want to do here is shorten the stack on the Should or Invoke-Assertion. That would remove any
            # lines describing potential functions that are invoked in the test. e.g. doing function a() { 1 | Should -Be 2 }; a
            # we want to be able to see that we invoked the assertion inside of function a
            # the internal calls to Should and Invoke-Assertion are filtered out later by the second match
            foreach ($line in $traceLines) {
                if ($line -match $isPesterFunction -and $line -notmatch $isShould) {
                    break
                }

                $isPesterInternalFunction = $line -match $isPesterFunction

                if (-not $isPesterInternalFunction) {
                    $lines.Trace += $line
                }
            }
        }

        # make error navigateable in VSCode
        $lines.Trace = $lines.Trace -replace ':\s*line\s*(\d+)\s*$', ':$1'
        return $lines
    }
}

function ConvertTo-HumanTime {
    param ([TimeSpan]$TimeSpan)
    if ($TimeSpan.Ticks -lt [timespan]::TicksPerSecond) {
        "$([int]($TimeSpan.TotalMilliseconds))ms"
    }
    else {
        "$([math]::round($TimeSpan.TotalSeconds ,2))s"
    }
}

function Get-WriteScreenPlugin ($Verbosity) {
    # add -FrameworkSetup Write-PesterStart $pester $Script and -FrameworkTeardown { $pester | Write-PesterReport }
    # The plugin is not imported when output None is specified so the usual level of output is Normal.

    $p = @{
        Name = 'WriteScreen'
    }

    if ("Detailed" -eq $Verbosity) {
        $p.Start = {
            param ($Context)

            # Write-PesterStart $Context
        }
    }

    $p.DiscoveryStart = {
        param ($Context)

        & $SafeCommands["Write-Host"] -ForegroundColor Magenta "`nStarting discovery in $(@($Context.BlockContainers).Length) files."
    }

    if ($PesterPreference.Output.Verbosity.Value -in 'Detailed', 'Diagnostic') {
        $p.ContainerDiscoveryStart = {
            param ($Context)
            & $SafeCommands["Write-Host"] -ForegroundColor Magenta "Discovering in $($Context.BlockContainer.Item)."
        }
    }

    if ($PesterPreference.Output.Verbosity.Value -in 'Detailed', 'Diagnostic') {
        $p.ContainerDiscoveryEnd = {
            param ($Context)
            # todo: this is very very slow because of View-flat
            & $SafeCommands["Write-Host"] -ForegroundColor Magenta "Found $(@(View-Flat -Block $Context.Block).Count) tests. $(ConvertTo-HumanTime $Context.Duration)"
        }
    }

    $p.DiscoveryEnd = {
        param ($Context)

        # if ($Context.AnyFocusedTests) {
        #     $focusedTests = $Context.FocusedTests
        #     & $SafeCommands["Write-Host"] -ForegroundColor Magenta "There are some ($($focusedTests.Count)) focused tests '$($(foreach ($p in $focusedTests) { $p -join "." }) -join ",")' running just them."
        # }

        # . Found $count$(if(1 -eq $count) { " test" } else { " tests" })
        & $SafeCommands["Write-Host"] -ForegroundColor Magenta "Discovery finished in $(ConvertTo-HumanTime $Context.Duration)."
    }

    if ($PesterPreference.Output.Verbosity.Value -in 'Detailed', 'Diagnostic') {
        $p.ContainerRunStart = {
            param ($Context)

            if ("file" -eq $Context.Block.BlockContainer.Type) {
                # write two spaces to separate each file
                & $SafeCommands["Write-Host"] -ForegroundColor Magenta "`nRunning tests from '$($Context.Block.BlockContainer.Item)'"
            }
        }
    }

    $p.ContainerRunEnd = {
        param ($Context)

        if ($Context.Result.ErrorRecord.Count -gt 0) {
            & $SafeCommands["Write-Host"] -ForegroundColor $ReportTheme.Fail "[-] $($Context.Result.Item) failed with:"
            Write-ErrorToScreen $Context.Result.ErrorRecord
        }

        if ('Normal' -eq $PesterPreference.Output.Verbosity.Value) {
            $humanTime = "$(Get-HumanTime ($Context.Result.Duration)) ($(Get-HumanTime $Context.Result.UserDuration)|$(Get-HumanTime $Context.Result.FrameworkDuration))"

            if ($Context.Result.Passed) {
                & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Pass "[+] $($Context.Result.Item)" -NoNewLine
                & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.PassTime " $humanTime"
            }

            # this won't work skipping the whole file when all it's tests are skipped is not a feature yet in 5.0.0
            if ($Context.Result.Skip) {
                & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Skipped "[!] $($Context.Result.Item)" -NoNewLine
                & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.SkippedTime " $humanTime"
            }
        }
    }

    if ($PesterPreference.Output.Verbosity.Value -in 'Detailed', 'Diagnostic') {
        $p.EachBlockSetupStart = {
            param ($Context)
            # the $context does not mean Context block, it's just a generic name
            # for the invocation context of this callback

            $commandUsed = $Context.Block.FrameworkData.CommandUsed

            $block = $Context.Block
            # -1 moves the block closer to the start of theline
            $level = $block.Path.Count - 1
            $margin = $ReportStrings.Margin * $level

            $text = $ReportStrings.$commandUsed -f $block.Name

            if ($PesterPreference.Debug.ShowNavigationMarkers.Value) {
                $text += ", $($block.ScriptBlock.File):$($block.ScriptBlock.StartPosition.StartLine)"
            }

            if (0 -eq $level -and -not $block.First) {
                # write extra line before top-level describe / context if it is not first
                # in that case there are already two spaces before the name of the file
                & $SafeCommands['Write-Host']
            }
            & $SafeCommands['Write-Host'] "${margin}${Text}" -ForegroundColor $ReportTheme.$CommandUsed
        }
    }

    $p.EachTestTeardownEnd = {
        param ($Context)

        # we are currently in scope of describe so $Test is hardtyped and conflicts
        $_test = $Context.Test

        if ($PesterPreference.Output.Verbosity.Value -in 'Detailed', 'Diagnostic') {
            $level = $_test.Path.Count
            $margin = $ReportStrings.Margin * ($level)
            $error_margin = $margin + $ReportStrings.Margin
            $out = $_test.ExpandedName
            if ($_test.ErrorRecord.FullyQualifiedErrorId -eq 'PesterTestSkipped') {
                $skippedMessage = [String]$_Test.ErrorRecord
                [String]$out += " $skippedMessage"
            }
        }
        elseif ('Normal' -eq $PesterPreference.Output.Verbosity.Value) {
            $level = 0
            $margin = ''
            $error_margin = $ReportStrings.Margin
            $out = "$($_test.Block.Path -join '.').$($_test.ExpandedName)"
        }
        else {
            throw "Unsupported level out output '$($PesterPreference.Output.Verbosity.Value)'"
        }

        $humanTime = "$(Get-HumanTime ($_test.Duration)) ($(Get-HumanTime $_test.UserDuration)|$(Get-HumanTime $_test.FrameworkDuration))"

        if ($PesterPreference.Debug.ShowNavigationMarkers.Value) {
            $out += ", $($_test.ScriptBlock.File):$($_Test.ScriptBlock.StartPosition.StartLine)"
        }

        $result = $_test.Result
        switch ($result) {
            Passed {
                if ($PesterPreference.Output.Verbosity.Value -in 'Detailed', 'Diagnostic') {
                    & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Pass "$margin[+] $out" -NoNewLine
                    & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.PassTime " $humanTime"
                }
                break
            }

            Failed {
                & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Fail "$margin[-] $out" -NoNewLine
                & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.FailTime " $humanTime"

                # review how we should write errors for VS code based on https://github.com/PowerShell/vscode-powershell/pull/2447
                # and use the env variable mentioned there
                # if($PesterPreference.Debug.WriteVSCodeMarker.Value) {
                #     & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Fail $($_test.ErrorRecord[-1].DisplayStackTrace -replace '(?m)^',$error_margin)
                #     & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Fail $($_test.ErrorRecord[-1].DisplayErrorMessage -replace '(?m)^',$error_margin)
                # }
                # else {
                    Write-ErrorToScreen $_test.ErrorRecord -ErrorMargin $error_margin
                # }
                break
            }

            Skipped {
                if ($PesterPreference.Output.Verbosity.Value -in 'Detailed', 'Diagnostic') {
                    & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Skipped "$margin[!] $out" -NoNewLine
                    & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.SkippedTime " $humanTime"
                }
                break
            }

            Pending {
                if ($PesterPreference.Output.Verbosity.Value -in 'Detailed', 'Diagnostic') {
                    $because = if ($_test.FailureMessage) { ", because $($_test.FailureMessage)" } else { $null }
                    & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Pending "$margin[?] $out" -NoNewLine
                    & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Pending ", is pending$because" -NoNewLine
                    & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.PendingTime " $humanTime"
                }
                break
            }

            Inconclusive {
                if ($PesterPreference.Output.Verbosity.Value -in 'Detailed', 'Diagnostic') {
                    $because = if ($_test.FailureMessage) { ", because $($_test.FailureMessage)" } else { $null }
                    & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Inconclusive "$margin[?] $out" -NoNewLine
                    & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Inconclusive ", is inconclusive$because" -NoNewLine
                    & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.InconclusiveTime " $humanTime"
                }

                break
            }

            default {
                if ($PesterPreference.Output.Verbosity.Value -in 'Detailed', 'Diagnostic') {
                    # TODO:  Add actual Incomplete status as default rather than checking for null time.
                    if ($null -eq $_test.Duration) {
                        & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Incomplete "$margin[?] $out" -NoNewLine
                        & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.IncompleteTime " $humanTime"
                    }
                }
            }
        }
    }

    $p.EachBlockTeardownEnd = {
        param ($Context)
        if (-not $Context.Block.OwnPassed) {
            if ($PesterPreference.Output.Verbosity.Value -in 'Detailed', 'Diagnostic') {
                $level = $Context.Block.Path.Count
                $margin = $ReportStrings.Margin * ($level)
                $error_margin = $margin + $ReportStrings.Margin
            }

            $level = 0
            $margin = 0
            $error_margin = $ReportStrings.Margin

            foreach ($e in $Context.Block.ErrorRecord) { ConvertTo-FailureLines $e }
            & $SafeCommands['Write-Host'] -ForegroundColor Red "[-] $($Context.Block.FrameworkData.CommandUsed) $($Context.Block.Path -join ".") failed"
            Write-ErrorToScreen $Context.Block.ErrorRecord $error_margin
        }
    }

    $p.End = {
        param ( $Context )

        Write-PesterReport $Context.TestRun
    }

    New-PluginObject @p
}

function Write-ErrorToScreen {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        $Err,
        [string] $ErrorMargin
    )

    $multipleErrors = 1 -lt $Err.Count


    $out = if ($multipleErrors) {
        $c = 0
        $(foreach ($e in $Err) {
            $isFormattedError = $null -ne $e.DisplayErrorMessage
            "[$(($c++))] $(if ($isFormattedError){ $e.DisplayErrorMessage } else { $e.Exception })$(if ($null -ne $e.DisplayStackTrace) {"$([Environment]::NewLine)$($e.DisplayStackTrace)"})"
        }) -join [Environment]::NewLine
    }
    else {
        $isFormattedError = $null -ne $Err.DisplayErrorMessage
        "$(if ($isFormattedError){ $Err.DisplayErrorMessage } else { $Err.Exception })$(if ($isFormattedError) { if ($null -ne $Err.DisplayStackTrace) {"$([Environment]::NewLine)$($Err.DisplayStackTrace)"}} else { if  ($null -ne $Err.ScriptStackTrace) {"$([Environment]::NewLine)$($Err.ScriptStackTrace)"}})"
    }

    $withMargin = ($out -split [Environment]::NewLine) -replace '(?m)^', $ErrorMargin -join [Environment]::NewLine
    & $SafeCommands['Write-Host'] -ForegroundColor $ReportTheme.Fail "$withMargin"
}
# file src\functions\Pester.Debugging.ps1
function Count-Scopes {
    param(
        [Parameter(Mandatory = $true)]
        $ScriptBlock)

    if ($script:DisableScopeHints) {
        return 0
    }

    # automatic variable that can help us count scopes must be constant a must not be all scopes
    # from the standard ones only Error seems to be that, let's ensure it is like that everywhere run
    # other candidate variables can be found by this code
    # Get-Variable  | where { -not ($_.Options -band [Management.Automation.ScopedItemOptions]"AllScope") -and $_.Options -band $_.Options -band [Management.Automation.ScopedItemOptions]"Constant" }

    # get-variable steps on it's toes and recurses when we mock it in a test
    # and we are also invoking this in user scope so we need to pass the reference
    # to the safely captured function in the user scope
    $safeGetVariable = $script:SafeCommands['Get-Variable']
    $sb = {
        param($safeGetVariable)
        $err = (& $safeGetVariable -Name Error).Options
        if ($err -band "AllScope" -or (-not ($err -band "Constant"))) {
            throw "Error variable is set to AllScope, or is not marked as constant cannot use it to count scopes on this platform."
        }

        $scope = 0
        while ($null -eq (& $safeGetVariable -Name Error -Scope $scope -ErrorAction SilentlyContinue)) {
            $scope++
        }

        $scope - 1 # because we are in a function
    }

    $flags = [System.Reflection.BindingFlags]'Instance,NonPublic'
    $property = [scriptblock].GetProperty('SessionStateInternal', $flags)
    $ssi = $property.GetValue($ScriptBlock, $null)
    $property.SetValue($sb, $ssi, $null)

    &$sb $safeGetVariable
}

function Write-ScriptBlockInvocationHint {
    param(
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock,
        [Parameter(Mandatory = $true)]
        [String]
        $Hint
    )

    if ($global:DisableScopeHints) {
        return
    }


    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope SessionState -LazyMessage {
            $scope = Get-ScriptBlockHint $ScriptBlock
            $count = Count-Scopes -ScriptBlock $ScriptBlock
            "Invoking scriptblock from location '$Hint' in state '$scope', $count scopes deep:"
            "{"
            $ScriptBlock.ToString().Trim()
            "}"
        }
    }
}

function Test-Hint {
    param (
        [Parameter(Mandatory = $true)]
        $InputObject
    )

    if ($script:DisableScopeHints) {
        return $true
    }

    $property = $InputObject | Get-Member -Name Hint -MemberType NoteProperty
    if ($null -eq $property) {
        return $false
    }

    [string]::IsNullOrWhiteSpace($property.Value)
}

function Set-Hint {
    param(
        [Parameter(Mandatory = $true)]
        [String] $Hint,
        [Parameter(Mandatory = $true)]
        $InputObject,
        [Switch] $Force
    )

    if ($script:DisableScopeHints) {
        return
    }

    if ($InputObject | Get-Member -Name Hint -MemberType NoteProperty) {
        $hintIsNotSet = [string]::IsNullOrWhiteSpace($InputObject.Hint)
        if ($Force -or $hintIsNotSet) {
            $InputObject.Hint = $Hint
        }
    }
    else {
        # do not change this to be called without the pipeline, it will throw: Cannot evaluate parameter 'InputObject' because its argument is specified as a script block and there is no input. A script block cannot be evaluated without input.
        $InputObject | Add-Member -Name Hint -Value $Hint -MemberType NoteProperty
    }
}

function Set-SessionStateHint {
    param(
        [Parameter(Mandatory = $true)]
        [String] $Hint,
        [Parameter(Mandatory = $true)]
        [Management.Automation.SessionState] $SessionState,
        [Switch] $PassThru
    )

    if ($script:DisableScopeHints) {
        if ($PassThru) {
            return $SessionState
        }
        return
    }

    # in all places where we capture SessionState we mark its internal state with a hint
    # the internal state does not change and we use it to invoke scriptblock in diferent
    # states, setting the hint on SessionState is only secondary to make is easier to debug
    $flags = [System.Reflection.BindingFlags]'Instance,NonPublic'
    $internalSessionState = $SessionState.GetType().GetProperty('Internal', $flags).GetValue($SessionState, $null)
    if ($null -eq $internalSessionState) {
        throw "SessionState does not have any internal SessionState, this should never happen."
    }

    $hashcode = $internalSessionState.GetHashCode()
    # optionally sets the hint if there was none, so the hint from the
    # function that first captured this session state is preserved
    Set-Hint -Hint "$Hint ($hashcode))" -InputObject $internalSessionState
    # the public session state should always depend on the internal state
    Set-Hint -Hint $internalSessionState.Hint -InputObject $SessionState -Force

    if ($PassThru) {
        $SessionState
    }
}

function Get-SessionStateHint {
    param(
        [Parameter(Mandatory = $true)]
        [Management.Automation.SessionState] $SessionState
    )

    if ($script:DisableScopeHints) {
        return
    }

    # the hint is also attached to the session state object, but sessionstate objects are recreated while
    # the internal state stays static so to see the hint on object that we receive via $PSCmdlet.SessionState we need
    # to look at the InternalSessionState. the internal state should be never null so just looking there is enough
    $flags = [System.Reflection.BindingFlags]'Instance,NonPublic'
    $internalSessionState = $SessionState.GetType().GetProperty('Internal', $flags).GetValue($SessionState, $null)
    if (Test-Hint $internalSessionState) {
        $internalSessionState.Hint
    }
}

function Set-ScriptBlockHint {
    param(
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock,
        [string] $Hint
    )

    if ($script:DisableScopeHints) {
        return
    }

    $flags = [System.Reflection.BindingFlags]'Instance,NonPublic'
    $internalSessionState = $ScriptBlock.GetType().GetProperty('SessionStateInternal', $flags).GetValue($ScriptBlock, $null)
    if ($null -eq $internalSessionState) {
        if (Test-Hint -InputObject $ScriptBlock) {
            # the scriptblock already has a hint and there is not internal state
            # so the hint on the scriptblock is enough
            # if there was an internal state we would try to copy the hint from it
            # onto the scriptblock to keep them in sync
            return
        }

        if ($null -eq $Hint) {
            throw "Cannot set ScriptBlock hint because it is unbound ScriptBlock (with null internal state) and no -Hint was provided."
        }

        # adds hint on the ScriptBlock
        # the internal session state is null so we must attach the hint directly
        # on the scriptblock
        Set-Hint -Hint "$Hint (Unbound)" -InputObject $ScriptBlock -Force
    }
    else {
        if (Test-Hint -InputObject $internalSessionState) {
            # there already is hint on the internal state, we take it and sync
            # it with the hint on the object
            Set-Hint -Hint $internalSessionState.Hint -InputObject $ScriptBlock -Force
            return
        }

        if ($null -eq $Hint) {
            throw "Cannot set ScriptBlock hint because it's internal state does not have any Hint and no external -Hint was provided."
        }

        $hashcode = $internalSessionState.GetHashCode()
        $Hint = "$Hint - ($hashCode)"
        Set-Hint -Hint $Hint -InputObject $internalSessionState -Force
        Set-Hint -Hint $Hint -InputObject $ScriptBlock -Force
    }
}

function Get-ScriptBlockHint {
    param(
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock
    )

    if ($script:DisableScopeHints) {
        return
    }

    # the hint is also attached to the scriptblock object, but not all scriptblocks are tagged by us,
    # the internal state stays static so to see the hint on object that we receive we need to look at the InternalSessionState
    $flags = [System.Reflection.BindingFlags]'Instance,NonPublic'
    $internalSessionState = $ScriptBlock.GetType().GetProperty('SessionStateInternal', $flags).GetValue($ScriptBlock, $null)


    if ($null -ne $internalSessionState -and (Test-Hint $internalSessionState)) {
        return $internalSessionState.Hint
    }

    if (Test-Hint $ScriptBlock) {
        return $ScriptBlock.Hint
    }

    "Unknown unbound ScriptBlock"
}
# file src\functions\Pester.Scoping.ps1
function Set-ScriptBlockScope {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [scriptblock]
        $ScriptBlock,

        [Parameter(Mandatory = $true, ParameterSetName = 'FromSessionState')]
        [System.Management.Automation.SessionState]
        $SessionState,

        [Parameter(Mandatory = $true, ParameterSetName = 'FromSessionStateInternal')]
        [AllowNull()]
        $SessionStateInternal
    )

    if ($PSCmdlet.ParameterSetName -eq 'FromSessionState') {
        $SessionStateInternal = $script:SessionStateInternalProperty.GetValue($SessionState, $null)
    }

    $scriptBlockSessionState = $script:ScriptBlockSessionStateInternalProperty.GetValue($ScriptBlock, $null)

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        # hint can be attached on the internal state (preferable) when the state is there.
        # if we are given unbound scriptblock with null internal state then we hope that
        # the source cmdlet set the hint directly on the ScriptBlock,
        # otherwise the origin is unknown and the cmdlet that allowed this scriptblock in
        # should be found and add hint

        $hint = $scriptBlockSessionState.Hint
        if ($null -eq $hint) {
            if ($null -ne $ScriptBlock.Hint) {
                $hint = $ScriptBlock.Hint
            }
            else {
                $hint = 'Unknown unbound ScriptBlock'
            }
        }

        Write-PesterDebugMessage -Scope SessionState "Setting ScriptBlock state from source state '$hint' to '$($SessionStateInternal.Hint)'"
    }

    $script:ScriptBlockSessionStateInternalProperty.SetValue($ScriptBlock, $SessionStateInternal, $null)

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Set-ScriptBlockHint -ScriptBlock $ScriptBlock
    }
}

function Get-ScriptBlockScope {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [scriptblock]
        $ScriptBlock
    )

    $sessionStateInternal = $script:ScriptBlockSessionStateInternalProperty.GetValue($ScriptBlock, $null)
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope SessionState "Getting scope from ScriptBlock '$($sessionStateInternal.Hint)'"
    }
    $sessionStateInternal
}
# file src\functions\Pester.SessionState.Mock.ps1
# session state bound functions that act as endpoints,
# so the internal funtions can make their session state
# consumption explicit and are testable (also prevents scrolling past
# the whole documentation :D )

function Get-MockPlugin () {
    New-PluginObject -Name "Mock" `
        -ContainerRunStart {
            param($Context)

            $Context.Block.PluginData.Mock = @{
                Hooks       = [System.Collections.Generic.List[object]]@()
                CallHistory = @{}
                Behaviors   = @{}
            }
        } -EachBlockSetupStart {
        param($Context)
        $Context.Block.PluginData.Mock = @{
            Hooks       = [System.Collections.Generic.List[object]]@()
            CallHistory = @{}
            Behaviors   = @{}
        }
    } -EachTestSetupStart {
        param($Context)
        $Context.Test.PluginData.Mock = @{
            Hooks       = [System.Collections.Generic.List[object]]@()
            CallHistory = @{}
            Behaviors   = @{}
        }
    } -EachTestTeardownEnd {
        param($Context)
        # we are defining that table in the setup but the teardowns
        # need to be resilient, because they will run even if the setups
        # did not run
        # TODO: resolve this path safely
        $hooks = $Context.Test.PluginData.Mock.Hooks
        Remove-MockHook -Hooks $hooks
    } -EachBlockTeardownEnd {
        param($Context)
        # TODO: resolve this path safely
        $hooks = $Context.Block.PluginData.Mock.Hooks
        Remove-MockHook -Hooks $hooks
    } -ContainerRunEnd {
        param($Context)
        # TODO: resolve this path safely
        $hooks = $Context.Block.PluginData.Mock.Hooks
        Remove-MockHook -Hooks $hooks
    }
}

function Mock {

    <#
.SYNOPSIS
Mocks the behavior of an existing command with an alternate
implementation.

.DESCRIPTION
This creates new behavior for any existing command within the scope of a
Describe or Context block. The function allows you to specify a script block
that will become the command's new behavior.

Optionally, you may create a Parameter Filter which will examine the
parameters passed to the mocked command and will invoke the mocked
behavior only if the values of the parameter values pass the filter. If
they do not, the original command implementation will be invoked instead
of a mock.

You may create multiple mocks for the same command, each using a different
ParameterFilter. ParameterFilters will be evaluated in reverse order of
their creation. The last one created will be the first to be evaluated.
The mock of the first filter to pass will be used. The exception to this
rule are Mocks with no filters. They will always be evaluated last since
they will act as a "catch all" mock.

Mocks can be marked Verifiable. If so, the Assert-VerifiableMock command
can be used to check if all Verifiable mocks were actually called. If any
verifiable mock is not called, Should -InvokeVerifiable will throw an
exception and indicate all mocks not called.

If you wish to mock commands that are called from inside a script module,
you can do so by using the -ModuleName parameter to the Mock command. This
injects the mock into the specified module. If you do not specify a
module name, the mock will be created in the same scope as the test script.
You may mock the same command multiple times, in different scopes, as needed.
Each module's mock maintains a separate call history and verified status.

.PARAMETER CommandName
The name of the command to be mocked.

.PARAMETER MockWith
A ScriptBlock specifying the behavior that will be used to mock CommandName.
The default is an empty ScriptBlock.
NOTE: Do not specify param or dynamicparam blocks in this script block.
These will be injected automatically based on the signature of the command
being mocked, and the MockWith script block can contain references to the
mocked commands parameter variables.

.PARAMETER Verifiable
When this is set, the mock will be checked when Should -InvokeVerifiable is
called.

.PARAMETER ParameterFilter
An optional filter to limit mocking behavior only to usages of
CommandName where the values of the parameters passed to the command
pass the filter.

This ScriptBlock must return a boolean value. See examples for usage.

.PARAMETER ModuleName
Optional string specifying the name of the module where this command
is to be mocked.  This should be a module that _calls_ the mocked
command; it doesn't necessarily have to be the same module which
originally implemented the command.

.EXAMPLE
Mock Get-ChildItem { return @{FullName = "A_File.TXT"} }

Using this Mock, all calls to Get-ChildItem will return a hashtable with a
FullName property returning "A_File.TXT"

.EXAMPLE
Mock Get-ChildItem { return @{FullName = "A_File.TXT"} } -ParameterFilter { $Path -and $Path.StartsWith($env:temp) }

This Mock will only be applied to Get-ChildItem calls within the user's temp directory.

.EXAMPLE
Mock Set-Content {} -Verifiable -ParameterFilter { $Path -eq "some_path" -and $Value -eq "Expected Value" }

When this mock is used, if the Mock is never invoked and Should -InvokeVerifiable is called, an exception will be thrown. The command behavior will do nothing since the ScriptBlock is empty.

.EXAMPLE
Mock Get-ChildItem { return @{FullName = "A_File.TXT"} } -ParameterFilter { $Path -and $Path.StartsWith($env:temp\1) }
Mock Get-ChildItem { return @{FullName = "B_File.TXT"} } -ParameterFilter { $Path -and $Path.StartsWith($env:temp\2) }
Mock Get-ChildItem { return @{FullName = "C_File.TXT"} } -ParameterFilter { $Path -and $Path.StartsWith($env:temp\3) }

Multiple mocks of the same command may be used. The parameter filter determines which is invoked. Here, if Get-ChildItem is called on the "2" directory of the temp folder, then B_File.txt will be returned.

.EXAMPLE
Mock Get-ChildItem { return @{FullName="B_File.TXT"} } -ParameterFilter { $Path -eq "$env:temp\me" }
Mock Get-ChildItem { return @{FullName="A_File.TXT"} } -ParameterFilter { $Path -and $Path.StartsWith($env:temp) }

Get-ChildItem $env:temp\me

Here, both mocks could apply since both filters will pass. A_File.TXT will be returned because it was the most recent Mock created.

.EXAMPLE
Mock Get-ChildItem { return @{FullName = "B_File.TXT"} } -ParameterFilter { $Path -eq "$env:temp\me" }
Mock Get-ChildItem { return @{FullName = "A_File.TXT"} }

Get-ChildItem c:\windows

Here, A_File.TXT will be returned. Since no filter was specified, it will apply to any call to Get-ChildItem that does not pass another filter.

.EXAMPLE
Mock Get-ChildItem { return @{FullName = "B_File.TXT"} } -ParameterFilter { $Path -eq "$env:temp\me" }
Mock Get-ChildItem { return @{FullName = "A_File.TXT"} }

Get-ChildItem $env:temp\me

Here, B_File.TXT will be returned. Even though the filterless mock was created more recently. This illustrates that filterless Mocks are always evaluated last regardless of their creation order.

.EXAMPLE
Mock Get-ChildItem { return @{FullName = "A_File.TXT"} } -ModuleName MyTestModule

Using this Mock, all calls to Get-ChildItem from within the MyTestModule module
will return a hashtable with a FullName property returning "A_File.TXT"

.EXAMPLE
Get-Module -Name ModuleMockExample | Remove-Module
New-Module -Name ModuleMockExample  -ScriptBlock {
    function Hidden { "Internal Module Function" }
    function Exported { Hidden }

    Export-ModuleMember -Function Exported
} | Import-Module -Force

Describe "ModuleMockExample" {

    It "Hidden function is not directly accessible outside the module" {
        { Hidden } | Should -Throw
    }

    It "Original Hidden function is called" {
        Exported | Should -Be "Internal Module Function"
    }

    It "Hidden is replaced with our implementation" {
        Mock Hidden { "Mocked" } -ModuleName ModuleMockExample
        Exported | Should -Be "Mocked"
    }
}

This example shows how calls to commands made from inside a module can be
mocked by using the -ModuleName parameter.


.LINK
Should
Describe
Context
It
about_Should
about_Mocking
#>
    # Mock
    [CmdletBinding()]
    param(
        [string]$CommandName,
        [ScriptBlock]$MockWith = {},
        [switch]$Verifiable,
        [ScriptBlock]$ParameterFilter,
        [string]$ModuleName,
        [string[]]$RemoveParameterType,
        [string[]]$RemoveParameterValidation
    )
    if (Is-Discovery) {
        # this is to allow mocks in between Describe and It which is discouraged but common
        # and will make for an easier move to v5
        return
    }

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock -Message "Setting up $(if ($ParameterFilter) {"parametrized"} else {"default"}) mock for$(if ($ModuleName) {" $ModuleName -"}) $CommandName."
    }

    $SessionState = $PSCmdlet.SessionState

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        $null = Set-ScriptBlockHint -Hint "Unbound MockWith - Captured in Mock" -ScriptBlock $MockWith
        $null = if ($ParameterFilter) { Set-ScriptBlockHint -Hint "Unbound ParameterFilter - Captured in Mock" -ScriptBlock $ParameterFilter }
    }

    # takes 0.4 ms max
    $invokeMockCallBack = $ExecutionContext.SessionState.InvokeCommand.GetCommand('Invoke-Mock', 'function')

    $mockData = Get-MockDataForCurrentScope
    $contextInfo = Resolve-Command $CommandName $ModuleName -SessionState $SessionState

    if ($contextInfo.IsMockBootstrapFunction) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock -Message "Mock resolves to an existing hook, will only define mock behavior."
        }
        $hook = $contextInfo.Hook
    }
    else {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock -Message "Mock does not have a hook yet, creating a new one."
        }
        $hook = Create-MockHook -ContextInfo $contextInfo -InvokeMockCallback $invokeMockCallBack
        $mockData.Hooks.Add($hook)
    }

    if ($mockData.Behaviors.ContainsKey($contextInfo.Command.Name)) {
        $behaviors = $mockData.Behaviors[$contextInfo.Command.Name]
    }
    else {
        $behaviors = [System.Collections.Generic.List[Object]]@()
        $mockData.Behaviors[$contextInfo.Command.Name] = $behaviors
    }

    $behavior = New-MockBehavior -ContextInfo $contextInfo -MockWith $MockWith -Verifiable:$Verifiable -ParameterFilter $ParameterFilter -Hook $hook
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock -Message "Adding a new $(if ($behavior.IsDefault) {"default"} else {"parametrized"}) behavior to $(if ($behavior.ModuleName) { " $($behavior.ModuleName) -"})$($behavior.CommandName)."
    }
    $behaviors.Add($behavior)
}

function Get-AllMockBehaviors {
    param(
        [Parameter(Mandatory)]
        [String] $CommandName
    )
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock "Getting all defined mock behaviors in this and parent scopes for command $CommandName."
    }
    # this is used for invoking mocks
    # in there we care about all mocks attached to the current test
    # or any of the mocks above it
    # this does not list mocks in other tests
    $currentTest = Get-CurrentTest
    $inTest = $null -ne $currentTest

    $behaviors = [System.Collections.Generic.List[Object]]@()
    if ($inTest) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock "We are in a test. Finding all behaviors in this test."
        }
        $bs = @(if ($currentTest.PluginData.Mock.Behaviors.ContainsKey($CommandName)) {
            $currentTest.PluginData.Mock.Behaviors.$CommandName
        })
        if ($null -ne $bs -and $bs.Count -gt 0) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Mock "Found behaviors for '$CommandName' in the test."
            }
            $bss = @(for ($i = $bs.Count - 1; $i -ge 0; $i--) { $bs[$i] })
            $behaviors.AddRange($bss)
        }
        else {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Mock "Found no behaviors for '$CommandName' in this test."
            }
        }
    }
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock "Finding all behaviors in this block and parent blocks."
    }
    $block = Get-CurrentBlock

    # recurse up
    $behaviorsInTestCount = $behaviors.Count
    while ($null -ne $block) {

        # action
        $bs = @(if ($block.PluginData.Mock.Behaviors.ContainsKey($CommandName)) {
            $block.PluginData.Mock.Behaviors.$CommandName
        })

        if ($null -ne $bs -and 0 -lt @($bs).Count) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope Mock "Found behaviors for '$CommandName' in '$($block.Name)'."
            }
            $bss = @(for ($i = $bs.Count - 1; $i -ge 0; $i--) { $bs[$i] })
            $behaviors.AddRange($bss)
        }
        # action end

        $block = $block.Parent
    }

    if ($PesterPreference.Debug.WriteDebugMessages.Value -and $behaviorsInTestCount -eq $behaviors.Count) {
        Write-PesterDebugMessage -Scope Mock "No behaviors for '$CommandName' were found in this or any parent blocks."
    }

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock -LazyMessage {
            "Found $($behaviors.Count) behaviors for '$CommandName': "
            foreach ($b in $behaviors) {
                "    Body: { $($b.ScriptBlock.ToString().Trim()) }"
                "    Filter: $(if ($b.Filter) { "{ $($b.Filter.ToString().Trim()) }" } else { '$null' })"
                "    Verifiable: $($b.Verifiable)"
            }
        }
    }

    $behaviors
}

function Get-VerifiableBehaviors {
    [CmdletBinding()]
    param(
    )
    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock "Getting all verifiable mock behaviors in this scope."
    }

    $currentTest = Get-CurrentTest
    $inTest = $null -ne $currentTest

    $behaviors = [System.Collections.Generic.List[Object]]@()
    if ($inTest) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock "We are in a test. Finding all behaviors in this test."
        }
        $allBehaviors = $currentTest.PluginData.Mock.Behaviors.Values
        if ($null -ne $allBehaviors -and $allBehaviors.Count -gt 0) {
            # all behaviors for all commands
            foreach ($commandBehaviors in $allBehaviors) {
                if ($null -ne $commandBehaviors -and $commandBehaviors.Count -gt 0) {
                    # all behaviors for single command
                    foreach ($behavior in $commandBehaviors) {
                        if ($behavior.Verifiable) {
                            $behaviors.Add($behavior)
                        }
                    }
                }
            }
        }
    }
    $block = Get-CurrentBlock

    # recurse up
    while ($null -ne $block) {

        ## action
        $allBehaviors = $block.PluginData.Mock.Behaviors.Values
        # all behaviors for all commands
        if ($null -ne $allBehaviors -or $allBehaviors.Count -ne 0) {
            foreach ($commandBehaviors in $allBehaviors) {
                if ($null -ne $commandBehaviors -and $commandBehaviors.Count -gt 0) {
                    # all behaviors for single command
                    foreach ($behavior in $commandBehaviors) {
                        if ($behavior.Verifiable) {
                            $behaviors.Add($behavior)
                        }
                    }
                }
            }
        }

        # end action
        $block = $block.Parent
    }
    # end

    $behaviors
}


function Get-AssertMockTable {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Frame,
        [Parameter(Mandatory)]
        [String] $CommandName,
        [String] $ModuleName
    )
    # frame looks like this
    # [PSCustomObject]@{
    #     Scope = int
    #     Frame = block | test
    #     IsTest = bool
    # }

    $key = "$ModuleName||$CommandName"
    $scope = $Frame.Scope
    $inTest = $Frame.IsTest
    # this is used for assertions, in here we need to collect
    # all call histories for the given command in the scope.
    # if the scope number is bigger than 0 then we need all
    # in the whole scope including all its

    if ($inTest -and 0 -eq $scope) {
        # we are in test and we care only about the test scope,
        # this is easy, we just look for call history of the command


        $history = if ($Frame.Frame.PluginData.Mock.CallHistory.ContainsKey($Key)) {
            # do not enumerate so we get the same thing back
            # even if it is a collection
            $Frame.Frame.PluginData.Mock.CallHistory.$Key
        }

        if ($history) {
            return @{
                "$key" = [Collections.Generic.List[object]]@($history)
            }
        }
        else {
            return @{
                "$key" = [Collections.Generic.List[object]]@()
            }

            # TODO: This figures out if the mock was defined, when there  were 0 calls, it adds overhead
            # and does not work with the current layout of hooks and history
            # $test = $Frame.Frame
            # $mockInTest = tryGetValue $test.PluginData.Mock.Hooks $key
            # if ($mockInTest) {
            #     # the mock was defined in it but it was not called in this scope
            #     return @{
            #         "$key" = @()
            #     }
            # }
            # else {
            #     # try finding the mock definition in upper scopes, because it was not found in the current test
            #     $mockInBlock = Recurse-Up $test.Block {
            #         param ($b)
            #         if ((tryGetProperty $b.PluginData Mock) -and (tryGetProperty $b.PluginData.Mock Hooks)) {
            #             tryGetValue $b.PluginData.Mock.Hooks $key
            #         }
            #     }

            #     if (none $mockInBlock) {
            #         throw "Could not find any mock definition for $CommandName$(if ($ModuleName) { " from module $ModuleName"})."
            #     }
            #     else {
            #         # the mock was defined in some upper scope but it was not called in this it
            #         return @{
            #             "$key" = @()
            #         }
            #     }
            #}
        }
    }


    # this is harder, we have scope and we are in a block, we need to look
    # in this block and any child for mock calls

    $currentBlock = if ($inTest) { $Frame.Frame.Block } else { $Frame.Frame }
    if ($inTest) {
        # we are in test but we only inspect blocks, so getting current block automatically
        # makes us in scope 1, so if we got 1 from the parameter we need to translate it to 0
        $scope -= 1
    }

    if ($scope -eq 0) {
        # in scope 0 the current block is the base block
        $block = $currentBlock
    }
    elseif ($scope -eq 1) {
        # in scope 1 it is the parent
        $block = if ($null -ne $currentBlock.Parent) { $currentBlock.Parent } else { $currentBlock }
    }
    else {
        # otherwise we just walk up as many scopes as needed until
        # we reach the desired scope, or the root of the tree, the above ifs could
        # be replaced by this, but they are easier to write and use for the most common
        # cases
        $i = $currentBlock
        $level = $scope - 1
        while ($level -gt 0 -and ($null -ne $i.Parent)) {
            $level--
            $i = $i.Parent
        }
        $block = $i
    }


    # we have our block so we need to collect all the history for the given mock

    $history = [System.Collections.Generic.List[Object]]@()
    $addToHistory = {
        param($b)

        if (-not $b.pluginData.ContainsKey('Mock')) {
            return
        }

        $mockData = $b.pluginData.Mock

        $callHistory = $mockData.CallHistory


        $v = if ($callHistory.ContainsKey($key)) {
            $callHistory.$key
        }

        if ($null -ne $v -and 0 -ne $v.Count) {
            $history.AddRange([System.Collections.Generic.List[Object]]@($v))
        }
    }

    Fold-Block -Block $Block -OnBlock $addToHistory -OnTest $addToHistory
    if (0 -eq $history.Count) {
        # we did not find any calls, is the mock even defined?
        # TODO: should we look in the scope and the upper scopes for the mock or just assume 0 calls were done?
        return @{
            "$key" = [Collections.Generic.List[object]]@()
        }
    }


    return @{
        "$key" = [Collections.Generic.List[object]]@($history)
    }
}

function Get-MockDataForCurrentScope {
    [CmdletBinding()]
    param(
    )

    # this returns a mock table based on location, that we
    # then use to add the mock into, keep in mind that what we
    # pass must be a reference, so the data can be written in this
    # table

    $location = $currentTest = Get-CurrentTest
    $inTest = $null -ne $currentTest

    if (-not $inTest) {
        $location = $currentBlock = Get-CurrentBlock
    }

    if (none @($currentTest, $currentBlock)) {
        throw "I am neither in a test or a block, where am I?"
    }

    if (-not $location.PluginData.Mock) {
        throw "Mock data are not setup for this scope, what happened?"
    }

    if ($inTest) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock "We are in a test. Returning mock table from test scope."
        }
    }
    else {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope Mock "We are in a block, one time setup or similar. Returning mock table from test block."
        }
    }

    $location.PluginData.Mock
}

function Assert-VerifiableMock {
    <#
.SYNOPSIS
Checks if all verifiable Mocks has been called at least once.

THIS COMMAND IS OBSOLETE AND WILL BE REMOVED SOMEWHERE DURING v5 LIFETIME,
USE Should -InvokeVerifiable INSTEAD.
#>

    # Should does not accept a session state, so invoking it directly would
    # make the assertion run from inside of Pester module, we move it to the
    # user scope instead an run it from there to keep the scoping correct
    # for this compatibility adapter
    [CmdletBinding()]param()
    $sb = {
        Should -InvokeVerifiable
    }

    Set-ScriptBlockScope -ScriptBlock $sb -SessionState $PSCmdlet.SessionState
    & $sb
}
function Should-InvokeVerifiable {
    <#
.SYNOPSIS
Checks if any Verifiable Mock has not been invoked. If so, this will throw an exception.

.DESCRIPTION
This can be used in tandem with the -Verifiable switch of the Mock
function. Mock can be used to mock the behavior of an existing command
and optionally take a -Verifiable switch. When Should -InvokeVerifiable
is called, it checks to see if any Mock marked Verifiable has not been
invoked. If any mocks have been found that specified -Verifiable and
have not been invoked, an exception will be thrown.

.EXAMPLE
Mock Set-Content {} -Verifiable -ParameterFilter {$Path -eq "some_path" -and $Value -eq "Expected Value"}

{ ...some code that never calls Set-Content some_path -Value "Expected Value"... }

Should -InvokeVerifiable

This will throw an exception and cause the test to fail.

.EXAMPLE
Mock Set-Content {} -Verifiable -ParameterFilter {$Path -eq "some_path" -and $Value -eq "Expected Value"}

Set-Content some_path -Value "Expected Value"

Should -InvokeVerifiable

This will not throw an exception because the mock was invoked.

#>
    $behaviors = @(Get-VerifiableBehaviors)
    Should-InvokeVerifiableInternal -Behaviors $behaviors
}

Add-ShouldOperator -Name InvokeVerifiable `
    -InternalName Should-InvokeVerifiable `
    -Test         ${function:Should-InvokeVerifiable}

function Assert-MockCalled {
    <#
.SYNOPSIS
Checks if a Mocked command has been called a certain number of times
and throws an exception if it has not.

THIS COMMAND IS OBSOLETE AND WILL BE REMOVED SOMEWHERE DURING v5 LIFETIME,
USE Should -Invoke INSTEAD.
#>
    [CmdletBinding(DefaultParameterSetName = 'ParameterFilter')]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$CommandName,

        [Parameter(Position = 1)]
        [int]$Times = 1,

        [ScriptBlock]$ParameterFilter = {$True},

        [Parameter(ParameterSetName = 'ExclusiveFilter', Mandatory = $true)]
        [scriptblock] $ExclusiveFilter,

        [string] $ModuleName,

        [string] $Scope = 0,
        [switch] $Exactly
    )

    # Should does not accept a session state, so invoking it directly would
    # make the assertion run from inside of Pester module, we move it to the
    # user scope instead an run it from there to keep the scoping correct
    # for this compatibility adapter

    $sb = {
        param ($__params__p)
        Should -Invoke @__params__p
    }

    Set-ScriptBlockScope -ScriptBlock $sb -SessionState $PSCmdlet.SessionState
    & $sb $PSBoundParameters
}

function Should-Invoke {
    <#
.SYNOPSIS
Checks if a Mocked command has been called a certain number of times
and throws an exception if it has not.

.DESCRIPTION
This command verifies that a mocked command has been called a certain number
of times.  If the call history of the mocked command does not match the parameters
passed to Should -Invoke, Should -Invoke will throw an exception.

.PARAMETER CommandName
The mocked command whose call history should be checked.

.PARAMETER ModuleName
The module where the mock being checked was injected.  This is optional,
and must match the ModuleName that was used when setting up the Mock.

.PARAMETER Times
The number of times that the mock must be called to avoid an exception
from throwing.

.PARAMETER Exactly
If this switch is present, the number specified in Times must match
exactly the number of times the mock has been called. Otherwise it
must match "at least" the number of times specified.  If the value
passed to the Times parameter is zero, the Exactly switch is implied.

.PARAMETER ParameterFilter
An optional filter to qualify which calls should be counted. Only those
calls to the mock whose parameters cause this filter to return true
will be counted.

.PARAMETER ExclusiveFilter
Like ParameterFilter, except when you use ExclusiveFilter, and there
were any calls to the mocked command which do not match the filter,
an exception will be thrown.  This is a convenient way to avoid needing
to have two calls to Should -Invoke like this:

Should -Invoke SomeCommand -Times 1 -ParameterFilter { $something -eq $true }
Should -Invoke SomeCommand -Times 0 -ParameterFilter { $something -ne $true }

.PARAMETER Scope
An optional parameter specifying the Pester scope in which to check for
calls to the mocked command. For RSpec style tests, Should -Invoke will find
all calls to the mocked command in the current Context block (if present),
or the current Describe block (if there is no active Context), by default. Valid
values are Describe, Context and It. If you use a scope of Describe or
Context, the command will identify all calls to the mocked command in the
current Describe / Context block, as well as all child scopes of that block.

.EXAMPLE
C:\PS>Mock Set-Content {}

{... Some Code ...}

C:\PS>Should -Invoke Set-Content

This will throw an exception and cause the test to fail if Set-Content is not called in Some Code.

.EXAMPLE
C:\PS>Mock Set-Content -parameterFilter {$path.StartsWith("$env:temp\")}

{... Some Code ...}

C:\PS>Should -Invoke Set-Content 2 { $path -eq "$env:temp\test.txt" }

This will throw an exception if some code calls Set-Content on $path=$env:temp\test.txt less than 2 times

.EXAMPLE
C:\PS>Mock Set-Content {}

{... Some Code ...}

C:\PS>Should -Invoke Set-Content 0

This will throw an exception if some code calls Set-Content at all

.EXAMPLE
C:\PS>Mock Set-Content {}

{... Some Code ...}

C:\PS>Should -Invoke Set-Content -Exactly 2

This will throw an exception if some code does not call Set-Content Exactly two times.

.EXAMPLE
Describe 'Should -Invoke Scope behavior' {
    Mock Set-Content { }

    It 'Calls Set-Content at least once in the It block' {
        {... Some Code ...}

        Should -Invoke Set-Content -Exactly 0 -Scope It
    }
}

Checks for calls only within the current It block.

.EXAMPLE
Describe 'Describe' {
    Mock -ModuleName SomeModule Set-Content { }

    {... Some Code ...}

    It 'Calls Set-Content at least once in the Describe block' {
        Should -Invoke -ModuleName SomeModule Set-Content
    }
}

Checks for calls to the mock within the SomeModule module.  Note that both the Mock
and Should -Invoke commands use the same module name.

.EXAMPLE
Should -Invoke Get-ChildItem -ExclusiveFilter { $Path -eq 'C:\' }

Checks to make sure that Get-ChildItem was called at least one time with
the -Path parameter set to 'C:\', and that it was not called at all with
the -Path parameter set to any other value.

.NOTES
The parameter filter passed to Should -Invoke does not necessarily have to match the parameter filter
(if any) which was used to create the Mock.  Should -Invoke will find any entry in the command history
which matches its parameter filter, regardless of how the Mock was created.  However, if any calls to the
mocked command are made which did not match any mock's parameter filter (resulting in the original command
being executed instead of a mock), these calls to the original command are not tracked in the call history.
In other words, Should -Invoke can only be used to check for calls to the mocked implementation, not
to the original.

#>
    # Should -Invoke
    [CmdletBinding(DefaultParameterSetName = 'ParameterFilter')]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$CommandName,

        [Parameter(Position = 1)]
        [int]$Times = 1,

        [ScriptBlock]$ParameterFilter = {$True},

        [Parameter(ParameterSetName = 'ExclusiveFilter', Mandatory = $true)]
        [scriptblock] $ExclusiveFilter,

        [string] $ModuleName,
        [string] $Scope = 0,
        [switch] $Exactly,

        # built-in variables
        [object] $ActualValue,
        [switch] $Negate,
        [string] $Because,
        [Management.Automation.SessionState] $CallerSessionState
    )

    if ($null -ne $ActualValue) {
        if ($ActualValue -is [string]) {
            $CommandName = $ActualValue
        }
        else {
            throw "Should -Invoke does not take pipeline input or ActualValue."
        }
    }

    # Assert-DescribeInProgress -CommandName Should -Invoke
    if ('Describe', 'Context', 'It' -notcontains $Scope -and $Scope -notmatch "^\d+$") {
        throw "Parameter Scope must be one of 'Describe', 'Context', 'It' or a non-negative number."
    }

    if ($PSBoundParameters.ContainsKey("Negate")) {
        $PSBoundParameters.Remove("Negate")
    }

    $isNumericScope = $Scope -match "^\d+$"
    $currentTest = Get-CurrentTest
    $inTest = $null -ne $currentTest
    $currentBlock = Get-CurrentBlock

    $frame = if ($isNumericScope) {
        [PSCustomObject]@{
            Scope  = $Scope
            Frame  = if ($inTest) { $currentTest } else { $currentBlock }
            IsTest = $inTest
        }
    }
    else {
        if ($Scope -eq 'It') {
            if ($inTest) {
                [PSCustomObject]@{
                    Scope  = 0
                    Frame  = $currentTest
                    IsTest = $true
                }
            }
            else {
                throw "Assertion is placed outside of an It block, but -Scope It is specified."
            }
        }
        else {
            # we are not looking for an It scope, so we are looking for a block scope
            # blocks can be chained arbitrarily, so we need to walk up the tree looking
            # for the first match

            # TODO: this is ad-hoc implementation of folding the tree of parents
            # make the normal fold work better, and replace this
            $i = $currentBlock
            $level = 0
            while ($null -ne $i) {
                if ($Scope -eq $i.FrameworkData.CommandUsed) {
                    if ($inTest) {
                        # we are in a test but we looked up the scope based on the block
                        # so we need to add 1 to the scope, because the block is scope 1 for us
                        $level++
                    }

                    [PSCustomObject]@{
                        Scope  = $level
                        Frame  = if ($inTest) { $currentTest } else { $currentBlock }
                        IsTest = $inTest
                    }
                    break
                }
                $level++
                $i = $i.Parent
            }
        }
    }

    $SessionState = $CallerSessionState
    $contextInfo = Resolve-Command $CommandName $ModuleName -SessionState $SessionState
    $resolvedModule = if ($contextInfo.IsFromRequestedModule) { $contextInfo.Module.Name } else { $null }
    $resolvedCommand = $contextInfo.Command.Name

    $mockTable = Get-AssertMockTable -Frame $frame -CommandName $resolvedCommand -ModuleName $resolvedModule

    if ($PSBoundParameters.ContainsKey('Scope')) {
        $PSBoundParameters.Remove('Scope')
    }
    if ($PSBoundParameters.ContainsKey('ModuleName')) {
        $PSBoundParameters.Remove('ModuleName')
    }
    if ($PSBoundParameters.ContainsKey('CommandName')) {
        $PSBoundParameters.Remove('CommandName')
    }
    if ($PSBoundParameters.ContainsKey('ActualValue')) {
        $PSBoundParameters.Remove('ActualValue')
    }
    if ($PSBoundParameters.ContainsKey('Negate')) {
        $PSBoundParameters.Remove('Negate')
    }
    if ($PSBoundParameters.ContainsKey('CallerSessionState')) {
        $PSBoundParameters.Remove('CallerSessionState')
    }

    $result = Should-InvokeInternal @PSBoundParameters `
        -ContextInfo $contextInfo `
        -MockTable $mockTable `
        -SessionState $SessionState

    return $result
}

Add-ShouldOperator -Name Invoke `
    -InternalName Should-Invoke `
    -Test         ${function:Should-Invoke}

function Invoke-Mock {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $CommandName,

        [Parameter(Mandatory = $true)]
        [hashtable] $MockCallState,

        [string]
        $ModuleName,

        [hashtable]
        $BoundParameters = @{},

        [object[]]
        $ArgumentList = @(),

        [object] $CallerSessionState,

        [ValidateSet('Begin', 'Process', 'End')]
        [string] $FromBlock,

        [object] $InputObject,

        $Hook
    )

    if ('End' -eq $FromBlock) {
        if (-not $MockCallState.ShouldExecuteOriginalCommand) {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope MockCore "Mock for $CommandName was invoked from block $FromBlock, and should not execute the original command, returning."
            }
            return
        }
        else {
            if ($PesterPreference.Debug.WriteDebugMessages.Value) {
                Write-PesterDebugMessage -Scope MockCore "Mock for $CommandName was invoked from block $FromBlock, and should execute the original command, forwarding the call to Invoke-MockInternal without call history and without behaviors."
            }
            Invoke-MockInternal @PSBoundParameters -Behaviors @() -CallHistory @{}
            return
        }
    }

    if ('Begin' -eq $FromBlock) {
        if ($PesterPreference.Debug.WriteDebugMessages.Value) {
            Write-PesterDebugMessage -Scope MockCore "Mock for $CommandName was invoked from block $FromBlock, and should execute the original command, Invoke-MockInternal without call history and without behaviors."
        }
        Invoke-MockInternal @PSBoundParameters -Behaviors @() -CallHistory @{}
        return
    }

    if ($PesterPreference.Debug.WriteDebugMessages.Value) {
        Write-PesterDebugMessage -Scope Mock "Mock for $CommandName was invoked from block $FromBlock, resolving call history and behaviors."
    }

    # this function is called by the mock bootstrap function, so every implementer
    # should implement this (but I keep it separate from the core function so I can
    # test without dependency on scopes)
    $allBehaviors = Get-AllMockBehaviors -CommandName $CommandName
    if ([string]::IsNullOrWhiteSpace($ModuleName)) {
        $ModuleName = $null
    }
    $fromModule = $null -ne $ModuleName
    $moduleBehaviors = [System.Collections.Generic.List[Object]]@()
    $nonModuleBehaviors = [System.Collections.Generic.List[Object]]@()
    foreach ($b in $allBehaviors) {
        # sort behaviors into behaviors for the selected module
        # other modules and no-modules
        # the behaviors for other modules we don't care about so we
        # don't collect them
        if ($fromModule) {
            if ($ModuleName -eq $b.ModuleName) {
                $moduleBehaviors.Add($b)
            }
        }

        if ($null -eq $b.ModuleName) {
            $nonModuleBehaviors.Add($b)
        }
    }

    # if any behaviors exist for this module, use them. Otherwise use the non module behaviors
    $detectedModule, $behaviors = if ($null -ne $moduleBehaviors -and 0 -ne $moduleBehaviors.Count) { $ModuleName, $moduleBehaviors } else {$null, $nonModuleBehaviors}
    $callHistory = (Get-MockDataForCurrentScope).CallHistory

    Invoke-MockInternal @PSBoundParameters -Behaviors $behaviors -CallHistory $callHistory
}

function Assert-RunInProgress {
    param(
        [Parameter(Mandatory)]
        [String] $CommandName
    )

    if (Is-Discovery) {
        throw "$CommandName can run only during Run, but not during Discovery."
    }
}




# file src\functions\PesterState.ps1
# function New-PesterState
# {
#     param (
#         [String[]]$TagFilter,
#         [String[]]$ExcludeTagFilter,
#         [String[]]$TestNameFilter,
#         [System.Management.Automation.SessionState]$SessionState,
#         [Switch]$Strict,
#         [Pester.OutputTypes]$Show = 'All',
#         [object]$PesterOption,
#         [Switch]$RunningViaInvokePester
#     )

#     if ($null -eq $SessionState) {
#         $SessionState = Set-SessionStateHint -PassThru  -Hint "Module - Pester (captured in New-PesterState)" -SessionState $ExecutionContext.SessionState
#     }

#     if ($null -eq $PesterOption)
#     {
#         $PesterOption = New-PesterOption
#     }
#     elseif ($PesterOption -is [System.Collections.IDictionary])
#     {
#         try
#         {
#             $PesterOption = New-PesterOption @PesterOption
#         }
#         catch
#         {
#             throw
#         }
#     }

#     & $SafeCommands['New-Module'] -Name PesterState -AsCustomObject -ArgumentList $TagFilter, $ExcludeTagFilter, $TestNameFilter, $SessionState, $Strict, $Show, $PesterOption, $RunningViaInvokePester -ScriptBlock {
#         param (
#             [String[]]$_tagFilter,
#             [String[]]$_excludeTagFilter,
#             [String[]]$_testNameFilter,
#             [System.Management.Automation.SessionState]$_sessionState,
#             [Switch]$Strict,
#             [Pester.OutputTypes]$Show,
#             [object]$PesterOption,
#             [Switch]$RunningViaInvokePester
#         )

#         #public read-only
#         $TagFilter = $_tagFilter
#         $ExcludeTagFilter = $_excludeTagFilter
#         $TestNameFilter = $_testNameFilter

#         $script:SessionState = $_sessionState
#         $script:Stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
#         $script:MostRecentTimestamp = 0
#         $script:CommandCoverage = @()
#         $script:Strict = $Strict
#         $script:Show = $Show
#         $script:InTest = $false

#         $script:FindCodeCoverage = $false
#         $script:CodeCoverage = @()

#         $script:TestResult = @()

#         $script:TotalCount = 0
#         $script:Time = [timespan]0
#         $script:PassedCount = 0
#         $script:FailedCount = 0
#         $script:SkippedCount = 0
#         $script:PendingCount = 0
#         $script:InconclusiveCount = 0

#         $script:IncludeVSCodeMarker = $PesterOption.IncludeVSCodeMarker
#         $script:TestSuiteName       = $PesterOption.TestSuiteName
#         $script:RunningViaInvokePester = $RunningViaInvokePester

#         $script:SafeCommands = @{}

#         $script:SafeCommands['New-Object']          = & (Pester\SafeGetCommand) -Name New-Object          -Module Microsoft.PowerShell.Utility -CommandType Cmdlet
#         $script:SafeCommands['Select-Object']       = & (Pester\SafeGetCommand) -Name Select-Object       -Module Microsoft.PowerShell.Utility -CommandType Cmdlet
#         $script:SafeCommands['Export-ModuleMember'] = & (Pester\SafeGetCommand) -Name Export-ModuleMember -Module Microsoft.PowerShell.Core    -CommandType Cmdlet
#         $script:SafeCommands['Add-Member']          = & (Pester\SafeGetCommand) -Name Add-Member          -Module Microsoft.PowerShell.Utility -CommandType Cmdlet

#         function New-TestGroup([string] $Name, [string] $Hint)
#         {
#            [PSCustomObject] @{
#                 Name              = $Name
#                 Type              = 'TestGroup'
#                 Hint              = $Hint
#                 Actions           = [System.Collections.Generic.List[object]]@()
#                 BeforeEach        = & $SafeCommands['New-Object'] System.Collections.Generic.List[scriptblock]
#                 AfterEach         = & $SafeCommands['New-Object'] System.Collections.Generic.List[scriptblock]
#                 BeforeAll         = & $SafeCommands['New-Object'] System.Collections.Generic.List[scriptblock]
#                 AfterAll          = & $SafeCommands['New-Object'] System.Collections.Generic.List[scriptblock]
#                 TotalCount        = 0
#                 Time              = [timespan]0
#                 PassedCount       = 0
#                 FailedCount       = 0
#                 SkippedCount      = 0
#                 PendingCount      = 0
#                 InconclusiveCount = 0
#             }
#         }

#         $script:TestActions = New-TestGroup -Name Pester -Hint Root
#         $script:TestGroupStack = & $SafeCommands['New-Object'] System.Collections.Stack
#         $script:TestGroupStack.Push($script:TestActions)

#         function EnterTestGroup([string] $Name, [string] $Hint)
#         {
#             $newGroup = New-TestGroup @PSBoundParameters
#             $null = $script:TestGroupStack.Peek().Actions.Add($newGroup)
#             $script:TestGroupStack.Push($newGroup)
#         }

#         function LeaveTestGroup([string] $Name, [string] $Hint)
#         {
#             $currentGroup = $script:TestGroupStack.Pop()

#             if ($currentGroup.Name -ne $Name -or $currentGroup.Hint -ne $Hint)
#             {
#                 throw "TestGroups stack corrupted:  Expected name/hint of '$Name','$Hint'.  Found '$($currentGroup.Name)', '$($currentGroup.Hint)'."
#             }
#         }

#         function AddTestResult
#         {
#             param (
#                 [string]$Name,
#                 [ValidateSet("Failed","Passed","Skipped","Pending","Inconclusive")]
#                 [string]$Result,
#                 [Nullable[TimeSpan]]$Time,
#                 [string]$FailureMessage,
#                 [string]$StackTrace,
#                 [string] $ParameterizedSuiteName,
#                 [System.Collections.IDictionary] $Parameters,
#                 [System.Management.Automation.ErrorRecord] $ErrorRecord
#             )

#             # defining this function in here, because otherwise it is not available
#             function New-ErrorRecord ([string] $Message, [string] $ErrorId, [string] $File, [string] $Line, [string] $LineText) {
#                 $exception = & $SafeCommands['New-Object'] Exception $Message
#                 $errorCategory = [Management.Automation.ErrorCategory]::InvalidResult
#                 # we use ErrorRecord.TargetObject to pass structured information about the error to a reporting system.
#                 $targetObject = @{Message = $Message; File = $File; Line = $Line; LineText = $LineText}
#                 $errorRecord = & $SafeCommands['New-Object'] Management.Automation.ErrorRecord $exception, $ErrorID, $errorCategory, $targetObject
#                 return $errorRecord
#             }

#             $previousTime = $script:MostRecentTimestamp
#             $script:MostRecentTimestamp = $script:Stopwatch.Elapsed

#             if ($null -eq $Time)
#             {
#                 $Time = $script:MostRecentTimestamp - $previousTime
#             }

#             if (-not $script:Strict)
#             {
#                 $Passed = "Passed","Skipped","Pending" -contains $Result
#             }
#             else
#             {
#                 $Passed = $Result -eq "Passed"
#                 if (($Result -eq "Skipped") -or ($Result -eq "Pending"))
#                 {
#                     $FailureMessage = "The test failed because the test was executed in Strict mode and the result '$result' was translated to Failed."
#                     $ErrorRecord = New-ErrorRecord -ErrorId '*PesterTestInconclusive*' -Message $FailureMessage
#                     $Result = "Failed"
#                 }

#             }

#             $script:TotalCount++
#             $script:Time += $Time

#             switch ($Result)
#             {
#                 Passed  { $script:PassedCount++; break; }
#                 Failed  { $script:FailedCount++; break; }
#                 Skipped { $script:SkippedCount++; break; }
#                 Pending { $script:PendingCount++; break; }
#                 Inconclusive { $script:InconclusiveCount++; break; }
#             }

#             $resultRecord = & $SafeCommands['New-Object'] -TypeName PsObject -Property @{
#                 Name                   = $Name
#                 Type                   = 'TestCase'
#                 Passed                 = $Passed
#                 Result                 = $Result
#                 Time                   = $Time
#                 FailureMessage         = $FailureMessage
#                 StackTrace             = $StackTrace
#                 ErrorRecord            = $ErrorRecord
#                 ParameterizedSuiteName = $ParameterizedSuiteName
#                 Parameters             = $Parameters
#                 Show                   = $script:Show
#             }

#             $null = $script:TestGroupStack.Peek().Actions.Add($resultRecord)

#             # Attempting some degree of backward compatibility for the TestResult collection for now; deprecated and will be removed in the future
#             $describe = ''
#             $contexts = [System.Collections.Generic.List[object]]@()

#             # make a copy of the stack and reverse it
#             $reversedStack = $script:TestGroupStack.ToArray()
#             [array]::Reverse($reversedStack)

#             foreach ($group in $reversedStack)
#             {
#                 if ($group.Hint -eq 'Root' -or $group.Hint -eq 'Script') { continue }
#                 if ($describe -eq '')
#                 {
#                     $describe = $group.Name
#                 }
#                 else
#                 {
#                     $null = $contexts.Add($group.Name)
#                 }
#             }

#             $context = $contexts -join '\'

#             $script:TestResult +=[PSCustomObject] @{
#                 Describe               = $describe
#                 Context                = $context
#                 Name                   = $Name
#                 Passed                 = $Passed
#                 Result                 = $Result
#                 Time                   = $Time
#                 FailureMessage         = $FailureMessage
#                 StackTrace             = $StackTrace
#                 ErrorRecord            = $ErrorRecord
#                 ParameterizedSuiteName = $ParameterizedSuiteName
#                 Parameters             = $Parameters
#                 Show                  = $script:Show
#             }
#         }

#         function AddSetupOrTeardownBlock([scriptblock] $ScriptBlock, [string] $CommandName)
#         {
#             $currentGroup = $script:TestGroupStack.Peek()

#             $isSetupCommand = IsSetupCommand -CommandName $CommandName
#             $isGroupCommand = IsTestGroupCommand -CommandName $CommandName

#             if ($isSetupCommand)
#             {
#                 if ($isGroupCommand)
#                 {
#                     $currentGroup.BeforeAll.Add($ScriptBlock)
#                 }
#                 else
#                 {
#                     $currentGroup.BeforeEach.Add($ScriptBlock)
#                 }
#             }
#             else
#             {
#                 if ($isGroupCommand)
#                 {
#                     $currentGroup.AfterAll.Add($ScriptBlock)
#                 }
#                 else
#                 {
#                     $currentGroup.AfterEach.Add($ScriptBlock)
#                 }
#             }
#         }

#         function IsSetupCommand
#         {
#             param ([string] $CommandName)
#             return $CommandName -eq 'BeforeEach' -or $CommandName -eq 'BeforeAll'
#         }

#         function IsTestGroupCommand
#         {
#             param ([string] $CommandName)
#             return $CommandName -eq 'BeforeAll' -or $CommandName -eq 'AfterAll'
#         }

#         function GetTestCaseSetupBlocks
#         {
#             $blocks = @(
#                 foreach ($group in $this.TestGroups)
#                 {
#                     $group.BeforeEach
#                 }
#             )

#             return $blocks
#         }

#         function GetTestCaseTeardownBlocks
#         {
#             $groups = @($this.TestGroups)
#             [Array]::Reverse($groups)

#             $blocks = @(
#                 foreach ($group in $groups)
#                 {
#                     $group.AfterEach
#                 }
#             )

#             return $blocks
#         }

#         function GetCurrentTestGroupSetupBlocks
#         {
#             return $script:TestGroupStack.Peek().BeforeAll
#         }

#         function GetCurrentTestGroupTeardownBlocks
#         {
#             return $script:TestGroupStack.Peek().AfterAll
#         }

#         function EnterTest
#         {
#             if ($script:InTest)
#             {
#                 throw 'You are already in a test case.'
#             }

#             $script:InTest = $true
#         }

#         function LeaveTest
#         {
#             $script:InTest = $false
#         }

#         $ExportedVariables = "TagFilter",
#         "ExcludeTagFilter",
#         "TestNameFilter",
#         "TestResult",
#         "SessionState",
#         "CommandCoverage",
#         "FindCodeCoverage",
#         "CodeCoverage",
#         "Strict",
#         "Show",
#         "Time",
#         "TotalCount",
#         "PassedCount",
#         "FailedCount",
#         "SkippedCount",
#         "PendingCount",
#         "InconclusiveCount",
#         "IncludeVSCodeMarker",
#         "TestActions",
#         "TestGroupStack",
#         "TestSuiteName",
#         "InTest",
#         "RunningViaInvokePester"

#         $ExportedFunctions = "EnterTestGroup",
#                              "LeaveTestGroup",
#                              "AddTestResult",
#                              "AddSetupOrTeardownBlock",
#                              "GetTestCaseSetupBlocks",
#                              "GetTestCaseTeardownBlocks",
#                              "GetCurrentTestGroupSetupBlocks",
#                              "GetCurrentTestGroupTeardownBlocks",
#                              "EnterTest",
#                              "LeaveTest"

#         & $SafeCommands['Export-ModuleMember'] -Variable $ExportedVariables -function $ExportedFunctions
#     }  |
#     & $SafeCommands['Add-Member'] -PassThru -MemberType ScriptProperty -Name CurrentTestGroup -Value {
#         $this.TestGroupStack.Peek()
#     } |
#     & $SafeCommands['Add-Member'] -PassThru -MemberType ScriptProperty -Name TestGroups -Value {
#         $array = $this.TestGroupStack.ToArray()
#         [Array]::Reverse($array)
#         return $array
#     } |
#     & $SafeCommands['Add-Member'] -PassThru -MemberType ScriptProperty -Name IndentLevel -Value {
#         # We ignore the root node of the stack here, and don't start indenting until after the Script nodes inside the root
#         return [Math]::Max(0, $this.TestGroupStack.Count - 2)
#     }
# }
# file src\functions\Set-ItResult.ps1
function Set-ItResult {
    <#
    .SYNOPSIS
    Set-ItResult is used inside the It block to explicitly set the test result

    .DESCRIPTION
    Sometimes a test shouldn't be executed, sometimes the condition cannot be evaluated.
    By default such tests would typically fail and produce a big red message.
    Using Set-ItResult it is possible to set the result from the inside of the It script
    block to either inconclusive, pending or skipped.

    As of Pester 5, there is no "Inconclusive" or "Pending" test state, so all tests will now go to state skipped,
    however the test result notes will include information about being inconclusive or testing to keep this command
    backwards compatible

    .PARAMETER Inconclusive
    **DEPRECATED** Sets the test result to inconclusive. Cannot be used at the same time as -Pending or -Skipped

    .PARAMETER Pending
    **DEPRECATED** Sets the test result to pending. Cannot be used at the same time as -Inconclusive or -Skipped

    .PARAMETER Skipped
    Sets the test result to skipped. Cannot be used at the same time as -Inconclusive or -Pending

    .PARAMETER Because
    Similarily to failing tests, skipped and inconclusive tests should have reason. It allows
    to provide information to the user why the test is neither successful nor failed.

    .EXAMPLE
    ```ps
    Describe "Example" {
        It "Skipped test" {
            Set-ItResult -Skipped -Because "we want it to be skipped"
        }
    }
    ```

    the output should be

    ```
    [!] Skipped test is skipped, because we want it to be skipped
    Tests completed in 0ms
    Tests Passed: 0, Failed: 0, Skipped: 0, Pending: 0, Inconclusive 1
    ```
#>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, ParameterSetName = "Inconclusive")][switch]$Inconclusive,
        [Parameter(Mandatory = $false, ParameterSetName = "Pending")][switch]$Pending,
        [Parameter(Mandatory = $false, ParameterSetName = "Skipped")][switch]$Skipped,
        [string]$Because
    )

    Assert-DescribeInProgress -CommandName Set-ItResult

    $result = $PSCmdlet.ParameterSetName

    [String]$Message = "is skipped"
    if ($Result -ne 'Skipped') {
        [String]$Because = if ($Because) {$Result.ToUpper(), $Because -join ': '} else {$Result.ToUpper()}
    }
    if ($Because) {
        [String]$Message += ", because $Because"
    }

    switch ($null) {
        $File {
            [String]$File = $MyInvocation.ScriptName
        }
        $Line {
            [String]$Line = $MyInvocation.ScriptLineNumber
        }
        $LineText {
            [String]$LineText = $MyInvocation.Line.trim()
        }
    }

    throw [Pester.Factory]::CreateErrorRecord(
        'PesterTestSkipped', #string errorId
        $Message, #string message
        $File, #string file
        $Line, #string line
        $LineText, #string lineText
        $false #bool terminating
    )
}
# file src\functions\SetupTeardown.ps1
function BeforeEach {
    <#
    .SYNOPSIS
        Defines a series of steps to perform at the beginning of every It block within
        the current Context or Describe block.

    .DESCRIPTION
        BeforeEach, AfterEach, BeforeAll, and AfterAll are unique in that they apply
        to the entire Context or Describe block, regardless of the order of the
        statements in the Context or Describe.  For a full description of this
        behavior, as well as how multiple BeforeEach or AfterEach blocks interact
        with each other, please refer to the about_BeforeEach_AfterEach help file.

    .LINK
        https://github.com/pester/Pester/wiki/BeforeEach-and-AfterEach

    .LINK
        about_BeforeEach_AfterEach
    #>
    [CmdletBinding()]
    param
    (
        # the scriptblock to execute
        [Parameter(Mandatory = $true,
            Position = 1)]
        [Scriptblock]
        $Scriptblock
    )
    Assert-DescribeInProgress -CommandName BeforeEach

    New-EachTestSetup -ScriptBlock $Scriptblock
}

function AfterEach {
    <#
    .SYNOPSIS
        Defines a series of steps to perform at the end of every It block within
        the current Context or Describe block.

    .DESCRIPTION
        BeforeEach, AfterEach, BeforeAll, and AfterAll are unique in that they apply
        to the entire Context or Describe block, regardless of the order of the
        statements in the Context or Describe.  For a full description of this
        behavior, as well as how multiple BeforeEach or AfterEach blocks interact
        with each other, please refer to the about_BeforeEach_AfterEach help file.

    .LINK
        https://github.com/pester/Pester/wiki/BeforeEach-and-AfterEach

    .LINK
        about_BeforeEach_AfterEach
    #>
    [CmdletBinding()]
    param
    (
        # the scriptblock to execute
        [Parameter(Mandatory = $true,
            Position = 1)]
        [Scriptblock]
        $Scriptblock
    )
    Assert-DescribeInProgress -CommandName AfterEach

    New-EachTestTeardown -ScriptBlock $Scriptblock
}

function BeforeAll {
    <#
    .SYNOPSIS
        Defines a series of steps to perform at the beginning of the current Context
        or Describe block.

    .DESCRIPTION
        BeforeEach, AfterEach, BeforeAll, and AfterAll are unique in that they apply
        to the entire Context or Describe block, regardless of the order of the
        statements in the Context or Describe.

    .LINK
        https://github.com/pester/Pester/wiki/BeforeEach-and-AfterEach

    .LINK
        about_BeforeEach_AfterEach
    #>
    [CmdletBinding()]
    param
    (
        # the scriptblock to execute
        [Parameter(Mandatory = $true,
            Position = 1)]
        [Scriptblock]
        $Scriptblock
    )

    New-OneTimeTestSetup -ScriptBlock $Scriptblock
}

function AfterAll {
    <#
.SYNOPSIS
    Defines a series of steps to perform at the end of the current Context
    or Describe block.

.DESCRIPTION
    BeforeEach, AfterEach, BeforeAll, and AfterAll are unique in that they apply
    to the entire Context or Describe block, regardless of the order of the
    statements in the Context or Describe.

    .LINK
        https://github.com/pester/Pester/wiki/BeforeEach-and-AfterEach

    .LINK
    about_BeforeEach_AfterEach
#>
    [CmdletBinding()]
    param
    (
        # the scriptblock to execute
        [Parameter(Mandatory = $true,
            Position = 1)]
        [Scriptblock]
        $Scriptblock
    )
    Assert-DescribeInProgress -CommandName AfterAll

    New-OneTimeTestTeardown -ScriptBlock $Scriptblock
}
# file src\functions\TestDrive.ps1
function Get-TestDrivePlugin {

    # TODO: add OnStart block and put this in it

    if (Test-Path TestDrive:\) {
        Remove-Item (Get-PSDrive TestDrive -ErrorAction Stop).Root -Force -Recurse -Confirm:$false
        Remove-PSDrive TestDrive
    }
    New-PluginObject -Name "TestDrive" -EachBlockSetupStart {
        param($Context)
        if (-not ($Context.Block.PluginData.ContainsKey('TestDrive'))) {
            $Context.Block.PluginData.Add('TestDrive', @{
                    TestDriveAdded   = $false
                    TestDriveContent = $null
                })
        }

        # TODO: Add option, but probably in a more generic way
        # if (-not $NoTestDrive)
        # {
        if (-not (Test-Path TestDrive:\)) {
            New-TestDrive
            $Context.Block.PluginData.TestDrive.TestDriveAdded = $true
        }
        else {
            $Context.Block.PluginData.TestDrive.TestDriveContent = Get-TestDriveChildItem
        }
        # }

    } -EachBlockTearDownEnd {
        # if (-not $NoTestDrive)
        # {
        if ($Context.Block.PluginData.TestDrive.TestDriveAdded) {
            Remove-TestDrive
        }
        else {
            Clear-TestDrive -Exclude ( $Context.Block.PluginData.TestDrive.TestDriveContent | & $SafeCommands['Select-Object'] -ExpandProperty FullName)
        }
        # }
    }
}

function New-TestDrive ([Switch]$PassThru, [string] $Path) {
    if ($Path -notmatch '\S') {
        $directory = New-RandomTempDirectory
    }
    else {
        if (-not (& $SafeCommands['Test-Path'] -Path $Path)) {
            $null = & $SafeCommands['New-Item'] -ItemType Container -Path $Path
        }

        $directory = & $SafeCommands['Get-Item'] $Path
    }

    $DriveName = "TestDrive"

    #setup the test drive
    if ( -not (& $SafeCommands['Test-Path'] "${DriveName}:\") ) {
        $null = & $SafeCommands['New-PSDrive'] -Name $DriveName -PSProvider FileSystem -Root $directory -Scope Global -Description "Pester test drive"
    }

    #publish the global TestDrive variable used in few places within the module
    if (-not (& $SafeCommands['Test-Path'] "Variable:Global:$DriveName")) {
        & $SafeCommands['New-Variable'] -Name $DriveName -Scope Global -Value $directory
    }

    if ( $PassThru ) {
        & $SafeCommands['Get-PSDrive'] -Name $DriveName
    }
}


function Clear-TestDrive ([String[]]$Exclude) {
    $drive = & $SafeCommands['Get-PSDrive'] -Name TestDrive -ErrorAction Ignore

    if ($null -eq $drive) {
        # someone cleared it up before us, maybe a Pester running in a child scope
        return
    }

    $Path = $drive.Root

    $Path = (& $SafeCommands['Get-PSDrive'] -Name TestDrive).Root
    if (& $SafeCommands['Test-Path'] -Path $Path ) {

        Remove-TestDriveSymbolicLinks -Path $Path

        #Get-ChildItem -Exclude did not seem to work with full paths
        & $SafeCommands['Get-ChildItem'] -Recurse -Path $Path |
        & $SafeCommands['Sort-Object'] -Descending  -Property "FullName" |
        & $SafeCommands['Where-Object'] { $Exclude -NotContains $_.FullName } |
        & $SafeCommands['Remove-Item'] -Force -Recurse

    }
}

function New-RandomTempDirectory {
    do {
        $tempPath = Get-TempDirectory
        $Path = & $SafeCommands['Join-Path'] -Path $tempPath -ChildPath ([Guid]::NewGuid())
    } until (-not (& $SafeCommands['Test-Path'] -Path $Path ))

    & $SafeCommands['New-Item'] -ItemType Container -Path $Path
}

function Get-TestDriveChildItem {
    $Path = (& $SafeCommands['Get-PSDrive'] -Name TestDrive).Root
    if (& $SafeCommands['Test-Path'] -Path $Path ) {
        & $SafeCommands['Get-ChildItem'] -Recurse -Path $Path
    }
}

function Remove-TestDriveSymbolicLinks ([String] $Path) {

    # remove symbolic links to work around problem with Remove-Item.
    # see https://github.com/PowerShell/PowerShell/issues/621
    #     https://github.com/pester/Pester/issues/1100

    # powershell 5 and higher
    # & $SafeCommands["Get-ChildItem"] -Recurse -Path $Path -Attributes "ReparsePoint" |
    #    % { $_.Delete() }

    # issue 621 was fixed before PowerShell 6.1
    # now there is an issue with calling the Delete method in recent (6.1) builds of PowerShell
    if ( (GetPesterPSVersion) -ge 6) {
        return
    }

    # powershell 2-compatible
    $reparsePoint = [System.IO.FileAttributes]::ReparsePoint
    & $SafeCommands["Get-ChildItem"] -Recurse -Path $Path |
    where-object { ($_.Attributes -band $reparsePoint) -eq $reparsePoint } |
    foreach-object { $_.Delete() }
}

function Remove-TestDrive {

    $DriveName = "TestDrive"
    $Drive = & $SafeCommands['Get-PSDrive'] -Name $DriveName -ErrorAction Ignore
    $Path = ($Drive).Root


    if ($pwd -like "$DriveName*" ) {
        #will staying in the test drive cause issues?
        #TODO: review this
        & $SafeCommands['Write-Warning'] -Message "Your current path is set to ${pwd}:. You should leave ${DriveName}:\ before leaving Describe."
    }

    if ( $Drive ) {
        $Drive | & $SafeCommands['Remove-PSDrive'] -Force #This should fail explicitly as it impacts future pester runs
    }



    if ($null -ne $Path -and (& $SafeCommands['Test-Path'] -Path $Path)) {
        Remove-TestDriveSymbolicLinks -Path $Path
        & $SafeCommands['Remove-Item'] -Path $Path -Force -Recurse
    }

    if (& $SafeCommands['Get-Variable'] -Name $DriveName -Scope Global -ErrorAction Ignore) {
        & $SafeCommands['Remove-Variable'] -Scope Global -Name $DriveName -Force
    }
}
# file src\functions\TestRegistry.ps1
 function New-TestRegistry {
    param(
        [Switch]
        $PassThru,

        [string]
        $Path
    )

    if ($Path -notmatch '\S') {
        $directory = New-RandomTempRegistry
    }
    else {
        if (-not (& $SafeCommands['Test-Path'] -Path $Path)) {
            # the pester registry root path HKCU:\Pester is created once
            # and then stays in place, in TestDrive we use system Temp folder,
            # but no such folder exists for registry so we create our own.
            # removing the folder after test run would be possible but we potentially
            # running into conflict with other instance of Pester that is running
            # so keeping it in place is a small price to pay for being able to run
            # parallel pester sessions easily.
            # Also don't use -Force parameter here
            # because that deletes the folder and creates a race condition see
            # https://github.com/pester/Pester/issues/1181
            $null = & $SafeCommands['New-Item'] -Path $Path
        }

        $directory = & $SafeCommands['Get-Item'] $Path
    }

    $DriveName = "TestRegistry"
    #setup the test drive
    if ( -not (& $SafeCommands['Test-Path'] "${DriveName}:\") ) {
        try {
            $null = & $SafeCommands['New-PSDrive'] -Name $DriveName -PSProvider Registry -Root $directory -Scope Global -Description "Pester test registry" -ErrorAction Stop
        }
        catch {
            if ($_.FullyQualifiedErrorId -like 'DriveAlreadyExists*') {
                # it can happen that Test-Path reports false even though the drive
                # exists. I don't know why but I see it in "Context Teardown fails"
                # it would be possible to use Get-PsDrive directly for the test but it
                # is about 10ms slower and we do it in every Describe and It so it would
                # quickly add up

                # so if that happens just ignore the error, the goal of this function is to
                # create the testdrive and the testdrive already exists, so all is good.
            }
            else {
                Write-Error $_ -ErrorAction 'Stop'
            }
        }
    }

    if ( $PassThru ) {
        & $SafeCommands['Get-PSDrive'] -Name $DriveName
    }
}

function Get-TestRegistryPath () {
    "Microsoft.PowerShell.Core\Registry::" + (& $SafeCommands['Get-PSDrive'] -Name TestRegistry -ErrorAction Stop).Root
}

function Clear-TestRegistry {
    param(
        [String[]]
        $Exclude
    )

    # if the setup fails before we mark test registry added
    # we would be trying to teardown something that does not
    # exist and fail in Get-TestRegistryPath
    if (-not (& $SafeCommands['Test-Path'] "TestRegistry:\")) {
        return
    }

    $path = Get-TestRegistryPath

    if ($null -ne $path -and (& $SafeCommands['Test-Path'] -Path $Path)) {
        #Get-ChildItem -Exclude did not seem to work with full paths
        & $SafeCommands['Get-ChildItem'] -Recurse -Path $Path |
            & $SafeCommands['Sort-Object'] -Descending  -Property 'PSPath' |
            & $SafeCommands['Where-Object'] { $Exclude -NotContains $_.PSPath } |
            & $SafeCommands['Remove-Item'] -Force -Recurse
    }
}

function Get-TestRegistryChildItem {
    $path = Get-TestRegistryPath
    & $SafeCommands['Get-ChildItem'] -Recurse -Path $path
}

function New-RandomTempRegistry {
    do {
        $tempPath = Get-TempRegistry
        $Path = & $SafeCommands['Join-Path'] -Path $tempPath -ChildPath ([Guid]::NewGuid())
    } until (-not (& $SafeCommands['Test-Path'] -Path $Path ))

    try {
        & $SafeCommands['New-Item'] -Path $Path
    }
    catch [System.IO.IOException] {
        # when running in parallel this occasionally triggers
        # IOException: No more data is available
        # let's just retry the operation
        & $SafeCommands['New-Item'] -Path $Path
    }
}

function Remove-TestRegistry {
    $DriveName = "TestRegistry"
    $Drive = & $SafeCommands['Get-PSDrive'] -Name $DriveName -ErrorAction Ignore
    if ($null -eq $Drive) {
        # the drive does not exist, someone must have removed it instead of us,
        # most likely a test that tests pester itself, so we just hope that the
        # one who removed this removed also the contents of it correctly
        return
    }

    $path = Get-TestRegistryPath

    if ($pwd -like "$DriveName*" ) {
        #will staying in the test drive cause issues?
        #TODO: review this
        & $SafeCommands['Write-Warning'] -Message "Your current path is set to ${pwd}:. You should leave ${DriveName}:\ before leaving Describe."
    }

    if ( $Drive ) {
        $Drive | & $SafeCommands['Remove-PSDrive'] -Force #This should fail explicitly as it impacts future pester runs
    }

    if (& $SafeCommands['Test-Path'] -Path $path) {
        & $SafeCommands['Remove-Item'] -Path $path -Force -Recurse
    }

    if (& $SafeCommands['Get-Variable'] -Name $DriveName -Scope Global -ErrorAction Ignore) {
        & $SafeCommands['Remove-Variable'] -Scope Global -Name $DriveName -Force
    }
}


function Get-TestRegistryPlugin {

    # TODO: add OnStart block and put this in it

    if (Test-Path TestRegistry:\) {
        Remove-Item (Get-PSDrive TestRegistry -ErrorAction Stop).Root -Force -Recurse -Confirm:$false -ErrorAction Ignore
        Remove-PSDrive TestRegistry
    }
    New-PluginObject -Name "TestRegistry" -EachBlockSetupStart {
        param($Context)
        if (-not ($Context.Block.PluginData.ContainsKey('TestRegistry'))) {
            $Context.Block.PluginData.Add('TestRegistry', @{
                    TestRegistryAdded   = $false
                    TestRegistryContent = $null
                })
        }

        # TODO: Add option, but probably in a more generic way
        # if (-not $NoTestRegistry)
        # {
        if (-not (Test-Path TestRegistry:\)) {
            New-TestRegistry
            $Context.Block.PluginData.TestRegistry.TestRegistryAdded = $true
        }
        else {
            $Context.Block.PluginData.TestRegistry.TestRegistryContent = Get-TestRegistryChildItem
        }
        # }

    } -EachBlockTearDownEnd {
        # if (-not $NoTestRegistry)
        # {
        if ($Context.Block.PluginData.TestRegistry.TestRegistryAdded) {
            Remove-TestRegistry
        }
        else {
            Clear-TestRegistry -Exclude ( $Context.Block.PluginData.TestRegistry.TestRegistryContent | & $SafeCommands['Select-Object'] -ExpandProperty PSPath)
        }
        # }
    }
}
# file src\functions\TestResults.ps1
function Get-HumanTime {
    param( [TimeSpan] $TimeSpan)
    if ($TimeSpan.Ticks -lt [timespan]::TicksPerSecond) {
        $time = [int]($TimeSpan.TotalMilliseconds)
        $unit = "ms"
    }
    else {
        $time = [math]::Round($TimeSpan.TotalSeconds, 2)
        $unit = 's'
    }

    return "$time$unit"
}

function GetFullPath ([string]$Path) {
    $Folder = & $SafeCommands['Split-Path'] -Path $Path -Parent
    $File = & $SafeCommands['Split-Path'] -Path $Path -Leaf

    if ( -not ([String]::IsNullOrEmpty($Folder))) {
        $FolderResolved = & $SafeCommands['Resolve-Path'] -Path $Folder
    }
    else {
        $FolderResolved = & $SafeCommands['Resolve-Path'] -Path $ExecutionContext.SessionState.Path.CurrentFileSystemLocation
    }

    $Path = & $SafeCommands['Join-Path'] -Path $FolderResolved.ProviderPath -ChildPath $File

    return $Path
}

function Export-PesterResults {
    param (
        $Result,
        [string] $Path,
        [string] $Format
    )

    switch -Wildcard ($Format) {
        '*Xml' {
            Export-XmlReport -Result $Result -Path $Path -Format $Format
        }

        default {
            throw "'$Format' is not a valid Pester export format."
        }
    }
}

function Export-NUnitReport {
    param (
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Result,

        [parameter(Mandatory = $true)]
        [String] $Path
    )

    Export-XmlReport -Result $Result -Path $Path -Format NUnitXml
}

function Export-XmlReport {
    param (
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Result,

        [parameter(Mandatory = $true)]
        [String] $Path,

        [parameter(Mandatory = $true)]
        [ValidateSet('NUnitXml', 'JUnitXml')]
        [string] $Format
    )

    #the xmlwriter create method can resolve relatives paths by itself. but its current directory might
    #be different from what PowerShell sees as the current directory so I have to resolve the path beforehand
    #working around the limitations of Resolve-Path

    $Path = GetFullPath -Path $Path

    $settings = [Xml.XmlWriterSettings] @{
        Indent              = $true
        NewLineOnAttributes = $false
    }

    $xmlFile = $null
    $xmlWriter = $null
    try {
        $xmlFile = [IO.File]::Create($Path)
        $xmlWriter = [Xml.XmlWriter]::Create($xmlFile, $settings)

        switch ($Format) {
            'NUnitXml' {
                Write-NUnitReport -XmlWriter $xmlWriter -Result $Result
            }

            'JUnitXml' {
                Write-JUnitReport -XmlWriter $xmlWriter -Result $Result
            }
        }

        $xmlWriter.Flush()
        $xmlFile.Flush()
    }
    finally {
        if ($null -ne $xmlWriter) {
            try {
                $xmlWriter.Close()
            }
            catch {
            }
        }
        if ($null -ne $xmlFile) {
            try {
                $xmlFile.Close()
            }
            catch {
            }
        }
    }
}

function ConvertTo-NUnitReport {
    param (
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Result,
        [Switch] $AsString
    )

    $settings = [Xml.XmlWriterSettings] @{
        Indent              = $true
        NewLineOnAttributes = $false
    }

    $stringWriter = $null
    $xmlWriter = $null
    try {
        $stringWriter = & $SafeCommands["New-Object"] IO.StringWriter
        $xmlWriter = [Xml.XmlWriter]::Create($stringWriter, $settings)

        Write-NUnitReport -XmlWriter $xmlWriter -Result $Result

        $xmlWriter.Flush()
        $stringWriter.Flush()
    }
    finally {
        $xmlWriter.Close()
        if (-not $AsString) {
            [xml] $stringWriter.ToString()
        }
        else {
            $stringWriter.ToString()
        }
    }
}

function Write-NUnitReport($Result, [System.Xml.XmlWriter] $XmlWriter) {
    # Write the XML Declaration
    $XmlWriter.WriteStartDocument($false)

    # Write Root Element
    $xmlWriter.WriteStartElement('test-results')

    Write-NUnitTestResultAttributes @PSBoundParameters
    Write-NUnitTestResultChildNodes @PSBoundParameters

    $XmlWriter.WriteEndElement()
}

function Write-NUnitTestResultAttributes($Result, [System.Xml.XmlWriter] $XmlWriter) {
    $XmlWriter.WriteAttributeString('xmlns', 'xsi', $null, 'http://www.w3.org/2001/XMLSchema-instance')
    $XmlWriter.WriteAttributeString('xsi', 'noNamespaceSchemaLocation', [Xml.Schema.XmlSchema]::InstanceNamespace , 'nunit_schema_2.5.xsd')
    $XmlWriter.WriteAttributeString('name', $Result.Configuration.TestResult.TestSuiteName.Value)
    $XmlWriter.WriteAttributeString('total', ($Result.TotalCount - $Result.NotRunCount))
    $XmlWriter.WriteAttributeString('errors', '0')
    $XmlWriter.WriteAttributeString('failures', $Result.FailedCount)
    $XmlWriter.WriteAttributeString('not-run', $Result.NotRunCount)
    $XmlWriter.WriteAttributeString('inconclusive', '0') # $Result.PendingCount + $Result.InconclusiveCount) #TODO: reflect inconclusive count once it is added
    $XmlWriter.WriteAttributeString('ignored', '0')
    $XmlWriter.WriteAttributeString('skipped', $Result.SkippedCount)
    $XmlWriter.WriteAttributeString('invalid', '0')
    $XmlWriter.WriteAttributeString('date', $Result.ExecutedAt.ToString('yyyy-MM-dd'))
    $XmlWriter.WriteAttributeString('time', $Result.ExecutedAt.ToString('HH:mm:ss'))
}

function Write-NUnitTestResultChildNodes($RunResult, [System.Xml.XmlWriter] $XmlWriter) {
    Write-NUnitEnvironmentInformation -Result $RunResult -XmlWriter $XmlWriter
    Write-NUnitCultureInformation -Result $RunResult -XmlWriter $XmlWriter

    $suiteInfo = Get-TestSuiteInfo -TestSuite $Result -Path "Pester"

    $XmlWriter.WriteStartElement('test-suite')

    Write-NUnitTestSuiteAttributes -TestSuiteInfo $suiteInfo -XmlWriter $XmlWriter

    $XmlWriter.WriteStartElement('results')

    foreach ($container in $Result.Containers) {
        if ("File" -eq $container.Type) {
            $path = $container.Item.FullName
        }
        elseif ("ScriptBlock" -eq $container.Type) {
            $path = "<ScriptBlock>$($container.Item.File):$($container.Item.StartPosition.StartLine)"
        }
        else {
            throw "Container type '$($container.Type)' is not supported."
        }
        Write-NUnitTestSuiteElements -XmlWriter $XmlWriter -Node $container -Path $path
    }

    $XmlWriter.WriteEndElement()
    $XmlWriter.WriteEndElement()
}

function Write-NUnitEnvironmentInformation($Result, [System.Xml.XmlWriter] $XmlWriter) {
    $XmlWriter.WriteStartElement('environment')

    $environment = Get-RunTimeEnvironment
    foreach ($keyValuePair in $environment.GetEnumerator()) {
        if ($keyValuePair.Name -eq 'junit-version') {
            continue
        }

        $XmlWriter.WriteAttributeString($keyValuePair.Name, $keyValuePair.Value)
    }

    $XmlWriter.WriteEndElement()
}

function Write-NUnitCultureInformation($Result, [System.Xml.XmlWriter] $XmlWriter) {
    $XmlWriter.WriteStartElement('culture-info')

    $XmlWriter.WriteAttributeString('current-culture', ([System.Threading.Thread]::CurrentThread.CurrentCulture).Name)
    $XmlWriter.WriteAttributeString('current-uiculture', ([System.Threading.Thread]::CurrentThread.CurrentUiCulture).Name)

    $XmlWriter.WriteEndElement()
}

function Write-NUnitTestSuiteElements($Node, [System.Xml.XmlWriter] $XmlWriter, [string] $Path) {
    $suiteInfo = Get-TestSuiteInfo -TestSuite $Node -Path $Path

    $XmlWriter.WriteStartElement('test-suite')

    Write-NUnitTestSuiteAttributes -TestSuiteInfo $suiteInfo -XmlWriter $XmlWriter

    $XmlWriter.WriteStartElement('results')

    foreach ($action in $Node.Blocks) {
        Write-NUnitTestSuiteElements -Node $action -XmlWriter $XmlWriter -Path ($action.Path -join '.')
    }

    $suites = @(
        # todo: what is this? is it ordering tests into groups based on which test cases they belong to so we data driven tests in one result?
        $Node.Tests | & $SafeCommands['Group-Object'] -Property Id
    )

    foreach ($suite in $suites) {
        # TODO: when suite has name it belongs into a test group (test cases that are generated from the same test, based on the provided data) so we want extra level of nesting for them, right now this is encoded as having an Id that is non empty, but this is not ideal, it would be nicer to make it more explicit
        $testGroupId = $suite.Name
        if ($testGroupId) {
            $parameterizedSuiteInfo = Get-ParameterizedTestSuiteInfo -TestSuiteGroup $suite

            $XmlWriter.WriteStartElement('test-suite')

            Write-NUnitTestSuiteAttributes -TestSuiteInfo $parameterizedSuiteInfo -TestSuiteType 'ParameterizedTest' -XmlWriter $XmlWriter -Path $newPath

            $XmlWriter.WriteStartElement('results')
        }

        foreach ($testCase in $suite.Group) {
            $suiteName = if ($testGroupId) { $parameterizedSuiteInfo.Name } else { "" }
            Write-NUnitTestCaseElement -TestResult $testCase -XmlWriter $XmlWriter -Path ($testCase.Path -join '.') -ParameterizedSuiteName $suiteName
        }

        if ($testGroupId) {
            # close the extra nesting element when we were writing testcases
            $XmlWriter.WriteEndElement()
            $XmlWriter.WriteEndElement()
        }
    }

    $XmlWriter.WriteEndElement()
    $XmlWriter.WriteEndElement()
}

function Write-JUnitReport($Result, [System.Xml.XmlWriter] $XmlWriter) {
    # Write the XML Declaration
    $XmlWriter.WriteStartDocument($false)

    # Write Root Element
    $xmlWriter.WriteStartElement('testsuites')

    Write-JUnitTestResultAttributes @PSBoundParameters

    $testSuiteNumber = 0
    foreach ($container in $Result.Containers) {
        Write-JUnitTestSuiteElements -XmlWriter $XmlWriter -Node $container -Id $testSuiteNumber
        $testSuiteNumber++
    }

    $XmlWriter.WriteEndElement()
}

function ConvertTo-JUnitReport {
    param (
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Result,
        [Switch] $AsString
    )

    $settings = [Xml.XmlWriterSettings] @{
        Indent              = $true
        NewLineOnAttributes = $false
    }

    $stringWriter = $null
    $xmlWriter = $null
    try {
        $stringWriter = & $SafeCommands["New-Object"] IO.StringWriter
        $xmlWriter = [Xml.XmlWriter]::Create($stringWriter, $settings)

        Write-JUnitReport -XmlWriter $xmlWriter -Result $Result

        $xmlWriter.Flush()
        $stringWriter.Flush()
    }
    finally {
        $xmlWriter.Close()
        if (-not $AsString) {
            [xml] $stringWriter.ToString()
        }
        else {
            $stringWriter.ToString()
        }
    }
}

function Write-JUnitTestResultAttributes($Result, [System.Xml.XmlWriter] $XmlWriter) {
    $XmlWriter.WriteAttributeString('xmlns', 'xsi', $null, 'http://www.w3.org/2001/XMLSchema-instance')
    $XmlWriter.WriteAttributeString('xsi', 'noNamespaceSchemaLocation', [Xml.Schema.XmlSchema]::InstanceNamespace , 'junit_schema_4.xsd')
    $XmlWriter.WriteAttributeString('name', $Result.Configuration.TestResult.TestSuiteName.Value)
    $XmlWriter.WriteAttributeString('tests', $Result.PassedCount)
    $XmlWriter.WriteAttributeString('errors', '0')
    $XmlWriter.WriteAttributeString('failures', $Result.FailedCount)
    $XmlWriter.WriteAttributeString('disabled', $Result.NotRunCount + $Result.SkippedCount)
    $XmlWriter.WriteAttributeString('time', ($Result.Duration.TotalSeconds.ToString('0.000', [System.Globalization.CultureInfo]::InvariantCulture)))
}

function Write-JUnitTestSuiteElements($Node, [System.Xml.XmlWriter] $XmlWriter, [uint16] $Id) {
    $XmlWriter.WriteStartElement('testsuite')

    Write-JUnitTestSuiteAttributes -Action $Node -XmlWriter $XmlWriter -Package $Node.Name -Id $Id

    $testCases = foreach ($al1 in $node.Actions) {
        if ($al1.Type -ne 'TestCase') {
            foreach ($al2 in $al1.Actions) {
                if ($al2.Type -ne 'TestCase') {
                    foreach ($alt3 in $al2.Actions) {
                        $path = "$($al1.Name).$($al2.Name).$($alt3.Name)"
                        $alt3 | Add-Member -PassThru -MemberType NoteProperty -Name Path -Value $path
                    }
                }
                else {
                    $path = "$($al1.Name).$($al2.Name)"
                    $al2 | Add-Member -PassThru -MemberType NoteProperty -Name Path -Value $path
                }
            }
        }
        else {
            $path = "$($al1.Name)"
            $al1 | Add-Member -PassThru -MemberType NoteProperty -Name Path -Value $path
        }
    }

    foreach ($t in $testCases) {
        Write-JUnitTestCaseElements -Action $t -XmlWriter $XmlWriter -Package $Node.Name
    }

    $XmlWriter.WriteEndElement()
}

function Write-JUnitTestSuiteAttributes($Action, [System.Xml.XmlWriter] $XmlWriter, [string] $Package, [uint16] $Id) {
    $environment = Get-RunTimeEnvironment

    $XmlWriter.WriteAttributeString('name', $Action.Name)
    $XmlWriter.WriteAttributeString('tests', $Action.TotalCount)
    $XmlWriter.WriteAttributeString('errors', '0')
    $XmlWriter.WriteAttributeString('failures', $Action.FailedCount)
    $XmlWriter.WriteAttributeString('hostname', $environment.'machine-name')
    $XmlWriter.WriteAttributeString('id', $Id)
    $XmlWriter.WriteAttributeString('skipped', $Action.SkippedCount)
    $XmlWriter.WriteAttributeString('disabled', $Action.InconclusiveCount + $Action.PendingCount)
    $XmlWriter.WriteAttributeString('package', $Package)
    $XmlWriter.WriteAttributeString('time', $Action.Duration.TotalSeconds.ToString('0.000', [System.Globalization.CultureInfo]::InvariantCulture))

    $XmlWriter.WriteStartElement('properties')

    foreach ($keyValuePair in $environment.GetEnumerator()) {
        if ($keyValuePair.Name -eq 'nunit-version') {
            continue
        }

        $XmlWriter.WriteStartElement('property')
        $XmlWriter.WriteAttributeString('name', $keyValuePair.Name)
        $XmlWriter.WriteAttributeString('value', $keyValuePair.Value)
        $XmlWriter.WriteEndElement()
    }

    $XmlWriter.WriteEndElement()
}

function Write-JUnitTestCaseElements($Action, [System.Xml.XmlWriter] $XmlWriter, [string] $Package) {
    $XmlWriter.WriteStartElement('testcase')

    Write-JUnitTestCaseAttributes -Action $Action -XmlWriter $XmlWriter -ClassName $Package

    $XmlWriter.WriteEndElement()
}

function Write-JUnitTestCaseAttributes($Action, [System.Xml.XmlWriter] $XmlWriter, [string] $ClassName) {
    $XmlWriter.WriteAttributeString('name', $Action.Path)

    $statusElementName = switch ($Action.Result) {
        Passed {
            $null
        }

        Failed {
            'failure'
        }

        default {
            'skipped'
        }
    }

    $XmlWriter.WriteAttributeString('status', $Action.Result)
    $XmlWriter.WriteAttributeString('classname', $ClassName)
    $XmlWriter.WriteAttributeString('assertions', '0')
    $XmlWriter.WriteAttributeString('time', $Action.Duration.TotalSeconds.ToString('0.000', [System.Globalization.CultureInfo]::InvariantCulture))

    if ($null -ne $statusElementName) {
        Write-JUnitTestCaseMessageElements -Action $Action -XmlWriter $XmlWriter -StatusElementName $statusElementName
    }
}

function Write-JUnitTestCaseMessageElements($Action, [System.Xml.XmlWriter] $XmlWriter, [string] $StatusElementName) {
    $XmlWriter.WriteStartElement($StatusElementName)

    $XmlWriter.WriteAttributeString('message', $Action.FailureMessage) #TODO: Add stacktrace

    $XmlWriter.WriteEndElement()
}

function Get-ParameterizedTestSuiteInfo ([Microsoft.PowerShell.Commands.GroupInfo] $TestSuiteGroup) {
    # this is generating info for a group of tests that were generated from the same test when TestCases are used
    # I am using the Name from the first test as the name of the test group, even though we are grouping at
    # the Id of the test (which is the line where the ScriptBlock of that test starts). This allows us to have
    # unique Id (the line number) and also a readable name
    # the possible edgecase here is putting $(Get-Date) into the test name, which would prevent us from
    # grouping the tests together if we used just the name, and not the linenumber (which remains static)
    $node = [PSCustomObject] @{
        Path = $TestSuiteGroup.Group[0].Path
        TotalCount        = 0
        Duration          = [timespan]0
        PassedCount       = 0
        FailedCount       = 0
        SkippedCount      = 0
        PendingCount      = 0
        InconclusiveCount = 0
    }

    foreach ($testCase in $TestSuiteGroup.Group) {
        $node.TotalCount++
        switch ($testCase.Result) {
            Passed {
                $node.PassedCount++; break;
            }
            Failed {
                $node.FailedCount++; break;
            }
            Skipped {
                $node.SkippedCount++; break;
            }
            Pending {
                $node.PendingCount++; break;
            }
            Inconclusive {
                $node.InconclusiveCount++; break;
            }
        }

        $node.Duration += $testCase.Duration
    }

    return Get-TestSuiteInfo -TestSuite $node -Path $node.Path
}

function Get-TestSuiteInfo ($TestSuite, $Path) {
    # if (-not $Path) {
    #     $Path = $TestSuite.Name
    # }

    # if (-not $Path) {
    #     $pathProperty = $TestSuite.PSObject.Properties.Item("path")
    #     if ($pathProperty) {
    #         $path = $pathProperty.Value
    #         if ($path -is [System.IO.FileInfo]) {
    #             $Path = $path.FullName
    #         }
    #         else {
    #             $Path = $pathProperty.Value -join "."
    #         }
    #     }
    # }

    $time = $TestSuite.Duration

    if (1 -lt @($Path).Count) {
        $name = $Path -join '.'
        $description = $Path[-1]
    }
    else {
        $name = $Path
        $description = $Path
    }

    $suite = @{
        resultMessage = 'Failure'
        success = if ($TestSuite.FailedCount -eq 0) {
            'True'
        }
        else {
            'False'
        }
        totalTime     = Convert-TimeSpan $time
        name          = $name
        description   = $description
    }

    $suite.resultMessage = Get-GroupResult $TestSuite
    $suite
}

function Get-TestTime($tests) {
    [TimeSpan]$totalTime = 0;
    if ($tests) {
        foreach ($test in $tests) {
            $totalTime += $test.time
        }
    }

    Convert-TimeSpan -TimeSpan $totalTime
}
function Convert-TimeSpan {
    param (
        [Parameter(ValueFromPipeline = $true)]
        $TimeSpan
    )
    process {
        if ($TimeSpan) {
            [string][math]::round(([TimeSpan]$TimeSpan).totalseconds, 4)
        }
        else {
            '0'
        }
    }
}

function Write-NUnitTestSuiteAttributes($TestSuiteInfo, [string] $TestSuiteType = 'TestFixture', [System.Xml.XmlWriter] $XmlWriter, [string] $Path) {
    $name = $TestSuiteInfo.Name

    if ($TestSuiteType -eq 'ParameterizedTest' -and $Path) {
        $name = "$Path.$name"
    }

    $XmlWriter.WriteAttributeString('type', $TestSuiteType)
    $XmlWriter.WriteAttributeString('name', $name)
    $XmlWriter.WriteAttributeString('executed', 'True')
    $XmlWriter.WriteAttributeString('result', $TestSuiteInfo.resultMessage)
    $XmlWriter.WriteAttributeString('success', $TestSuiteInfo.success)
    $XmlWriter.WriteAttributeString('time', $TestSuiteInfo.totalTime)
    $XmlWriter.WriteAttributeString('asserts', '0')
    $XmlWriter.WriteAttributeString('description', $TestSuiteInfo.Description)
}

function Write-NUnitTestCaseElement($TestResult, [System.Xml.XmlWriter] $XmlWriter, [string] $ParameterizedSuiteName, [string] $Path) {
    $XmlWriter.WriteStartElement('test-case')

    Write-NUnitTestCaseAttributes -TestResult $TestResult -XmlWriter $XmlWriter -ParameterizedSuiteName $ParameterizedSuiteName -Path $Path

    $XmlWriter.WriteEndElement()
}

function Write-NUnitTestCaseAttributes($TestResult, [System.Xml.XmlWriter] $XmlWriter, [string] $ParameterizedSuiteName, [string] $Path) {
    $testName = $TestResult.Path -join '.'

    # todo: this comparison would fail if the test name would contain $(Get-Date) or something similar that changes all the time
    if ($testName -eq $ParameterizedSuiteName) {
        $paramString = ''
        if ($null -ne $TestResult.Data) {
            $params = @(
                foreach ($value in $TestResult.Data.Values) {
                    if ($null -eq $value) {
                        'null'
                    }
                    elseif ($value -is [string]) {
                        '"{0}"' -f $value
                    }
                    else {
                        #do not use .ToString() it uses the current culture settings
                        #and we need to use en-US culture, which [string] or .ToString([Globalization.CultureInfo]'en-us') uses
                        [string]$value
                    }
                }
            )

            $paramString = "($($params -join ','))"
        }
    }

    $testName = "$testName$paramString"

    $XmlWriter.WriteAttributeString('description', $TestResult.Name)

    $XmlWriter.WriteAttributeString('name', $testName)
    $XmlWriter.WriteAttributeString('time', (Convert-TimeSpan $TestResult.Duration))
    $XmlWriter.WriteAttributeString('asserts', '0')
    $XmlWriter.WriteAttributeString('success', "Passed" -eq $TestResult.Result)

    switch ($TestResult.Result) {
        Passed {
            $XmlWriter.WriteAttributeString('result', 'Success')
            $XmlWriter.WriteAttributeString('executed', 'True')

            break
        }

        Skipped {
            $XmlWriter.WriteAttributeString('result', 'Ignored')
            $XmlWriter.WriteAttributeString('executed', 'False')

            if ($TestResult.FailureMessage) {
                $XmlWriter.WriteStartElement('reason')
                $xmlWriter.WriteElementString('message', $TestResult.FailureMessage)
                $XmlWriter.WriteEndElement() # Close reason tag
            }

            break
        }

        Pending {
            $XmlWriter.WriteAttributeString('result', 'Inconclusive')
            $XmlWriter.WriteAttributeString('executed', 'True')

            if ($TestResult.FailureMessage) {
                $XmlWriter.WriteStartElement('reason')
                $xmlWriter.WriteElementString('message', $TestResult.FailureMessage)
                $XmlWriter.WriteEndElement() # Close reason tag
            }

            break
        }

        Inconclusive {
            $XmlWriter.WriteAttributeString('result', 'Inconclusive')
            $XmlWriter.WriteAttributeString('executed', 'True')

            if ($TestResult.FailureMessage) {
                $XmlWriter.WriteStartElement('reason')
                $xmlWriter.WriteElementString('message', $TestResult.DisplayErrorMessage)
                $XmlWriter.WriteEndElement() # Close reason tag
            }

            break
        }
        Failed {
            $XmlWriter.WriteAttributeString('result', 'Failure')
            $XmlWriter.WriteAttributeString('executed', 'True')
            $XmlWriter.WriteStartElement('failure')

            # TODO: remove monkey patching the error message when parent setup failed so this test never run
            # TODO: do not format the errors here, instead format them in the core using some unified function so we get the same thing on the screen and in nunit

            $failureMessage = if (($TestResult.ShouldRun -and -not $TestResult.Executed)) {
                "This test should run but it did not. Most likely a setup in some parent block failed."
            }
            else {
                $multipleErrors = 1 -lt $TestResult.ErrorRecord.Count

                if ($multipleErrors) {
                    $c = 0
                    $(foreach ($err in $TestResult.ErrorRecord) {
                        "[$(($c++))] $($err.DisplayErrorMessage)"
                    }) -join [Environment]::NewLine
                }
                else {
                    $TestResult.ErrorRecord.DisplayErrorMessage
                }
            }

            $stackTrace = & {
                $multipleErrors = 1 -lt $TestResult.ErrorRecord.Count

                if ($multipleErrors) {
                    $c = 0
                    $(foreach ($err in $TestResult.ErrorRecord) {
                        "[$(($c++))] $($err.DisplayStackTrace)"
                    }) -join [Environment]::NewLine
                }
                else {
                    [string] $TestResult.ErrorRecord.DisplayStackTrace
                }
            }

            $xmlWriter.WriteElementString('message', $failureMessage)
            $XmlWriter.WriteElementString('stack-trace', $stackTrace)
            $XmlWriter.WriteEndElement() # Close failure tag
            break
        }
    }
}
function Get-RunTimeEnvironment() {
    # based on what we found during startup, use the appropriate cmdlet
    $computerName = $env:ComputerName
    $userName = $env:Username
    if ($null -ne $SafeCommands['Get-CimInstance']) {
        $osSystemInformation = (& $SafeCommands['Get-CimInstance'] Win32_OperatingSystem)
    }
    elseif ($null -ne $SafeCommands['Get-WmiObject']) {
        $osSystemInformation = (& $SafeCommands['Get-WmiObject'] Win32_OperatingSystem)
    }
    elseif ($IsMacOS -or $IsLinux) {
        $osSystemInformation = @{
            Name = "Unknown"
            Version = "0.0.0.0"
        }
        try {
            if ($null -ne $SafeCommands['uname']) {
                $osSystemInformation.Version = & $SafeCommands['uname'] -r
                $osSystemInformation.Name = & $SafeCommands['uname'] -s
                $computerName = & $SafeCommands['uname'] -n
            }
            if ($null -ne $SafeCommands['id']) {
                $userName = & $SafeCommands['id'] -un
            }
        }
        catch {
            # well, we tried
        }
    }
    else {
        $osSystemInformation = @{
            Name = "Unknown"
            Version = "0.0.0.0"
        }
    }

    if ( ($PSVersionTable.ContainsKey('PSEdition')) -and ($PSVersionTable.PSEdition -eq 'Core')) {
        $CLrVersion = "Unknown"

    }
    else {
        $CLrVersion = [string]$PSVersionTable.ClrVersion
    }

    @{
        'nunit-version' = '2.5.8.0'
        'junit-version' = '4'
        'os-version'    = $osSystemInformation.Version
        platform        = $osSystemInformation.Name
        cwd             = $pwd.Path
        'machine-name'  = $computerName
        user            = $username
        'user-domain'   = $env:userDomain
        'clr-version'   = $CLrVersion
    }
}

function Exit-WithCode ($FailedCount) {
    $host.SetShouldExit($FailedCount)
}

function Get-GroupResult ($InputObject) {
    #I am not sure about the result precedence, and can't find any good source
    #TODO: Confirm this is the correct order of precedence
    if ($inputObject.FailedCount -gt 0) {
        return 'Failure'
    }
    if ($InputObject.SkippedCount -gt 0) {
        return 'Ignored'
    }
    if ($InputObject.PendingCount -gt 0) {
        return 'Inconclusive'
    }
    return 'Success'
}
# file src\Pester.psm1
# Set-SessionStateHint -Hint Pester -SessionState $ExecutionContext.SessionState
# these functions will be shared with the mock bootstrap function, or used in mocked calls so let's capture them just once instead of everytime we use a mock
$script:SafeCommands['ExecutionContext'] = $ExecutionContext
$script:SafeCommands['Get-MockDynamicParameter'] = $ExecutionContext.SessionState.InvokeCommand.GetCommand('Get-MockDynamicParameter', 'function')
$script:SafeCommands['Write-PesterDebugMessage'] = $ExecutionContext.SessionState.InvokeCommand.GetCommand('Write-PesterDebugMessage', 'function')
$script:SafeCommands['Set-DynamicParameterVariable'] = $ExecutionContext.SessionState.InvokeCommand.GetCommand('Set-DynamicParameterVariable', 'function')


Set-Alias 'Add-AssertionOperator' 'Add-ShouldOperator'
Set-Alias 'Get-AssertionOperator' 'Get-ShouldOperator'


& $script:SafeCommands['Export-ModuleMember'] @(
    'Invoke-Pester'

    # blocks
    'Describe'
    'Context'
    'It'

    # mocking
    'Mock'
    'InModuleScope'

    # setups
    'BeforeAll'
    'BeforeEach'
    'AfterEach'
    'AfterAll'

    # should
    'Should'
    'Add-ShouldOperator'
    'Get-ShouldOperator'

    # export
    'Export-NunitReport'
    'ConvertTo-NUnitReport'
    # 'Export-JUnitReport' does not work yet, it needs similar rework as NUnit to work with the new structure
    # 'ConvertTo-JUnitReport'
    'ConvertTo-Pester4Result'

    # legacy
    'Assert-VerifiableMock'
    'Assert-MockCalled'
    'Set-ItResult'
    'New-MockObject'

) -Alias @(
    'Add-AssertionOperator'
    'Get-AssertionOperator'
)


# SIG # Begin signature block
# MIIcVgYJKoZIhvcNAQcCoIIcRzCCHEMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUkFTOMmC63h0nQl4g22i2qS1b
# kP2ggheFMIIFDjCCA/agAwIBAgIQCIQ1OU/QbU6rESO7M78utDANBgkqhkiG9w0B
# AQsFADByMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
# VQQLExB3d3cuZGlnaWNlcnQuY29tMTEwLwYDVQQDEyhEaWdpQ2VydCBTSEEyIEFz
# c3VyZWQgSUQgQ29kZSBTaWduaW5nIENBMB4XDTIwMDEzMTAwMDAwMFoXDTIxMDEw
# NTEyMDAwMFowSzELMAkGA1UEBhMCQ1oxDjAMBgNVBAcTBVByYWhhMRUwEwYDVQQK
# DAxKYWt1YiBKYXJlxaExFTATBgNVBAMMDEpha3ViIEphcmXFoTCCASIwDQYJKoZI
# hvcNAQEBBQADggEPADCCAQoCggEBALYF0cDtFUyYgraHpHdObGJM9dxjfRr0WaPN
# kVZcEHdPXk4bVCPZLSca3Byybx745CpB3oejDHEbohLSTrbunoSA9utpwxVQSutt
# /H1onVexiJgwGJ6xoQgR17FGLBGiIHgyPhFJhba9yENh0dqargLWllsg070WE2yb
# gz3m659gmfuCuSZOhQ2nCHvOjEocTiI67mZlHvN7axg+pCgdEJrtIyvhHPqXeE2j
# cdMrfmYY1lq2FBpELEW1imYlu5BnaJd/5IT7WjHL3LWx5Su9FkY5RwrA6+X78+j+
# vKv00JtDjM0dT+4A/m65jXSywxa4YoGDqQ5n+BwDMQlWCzfu37sCAwEAAaOCAcUw
# ggHBMB8GA1UdIwQYMBaAFFrEuXsqCqOl6nEDwGD5LfZldQ5YMB0GA1UdDgQWBBRE
# 05R/U5mVzc4vKq4rvKyyPm12EzAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYI
# KwYBBQUHAwMwdwYDVR0fBHAwbjA1oDOgMYYvaHR0cDovL2NybDMuZGlnaWNlcnQu
# Y29tL3NoYTItYXNzdXJlZC1jcy1nMS5jcmwwNaAzoDGGL2h0dHA6Ly9jcmw0LmRp
# Z2ljZXJ0LmNvbS9zaGEyLWFzc3VyZWQtY3MtZzEuY3JsMEwGA1UdIARFMEMwNwYJ
# YIZIAYb9bAMBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNv
# bS9DUFMwCAYGZ4EMAQQBMIGEBggrBgEFBQcBAQR4MHYwJAYIKwYBBQUHMAGGGGh0
# dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBOBggrBgEFBQcwAoZCaHR0cDovL2NhY2Vy
# dHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0U0hBMkFzc3VyZWRJRENvZGVTaWduaW5n
# Q0EuY3J0MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggEBADAk7PRuDcdl
# lPZQSfZ1Y0jeItmEWPMNcAL0LQaa6M5Slrznjxv1ZiseT9SMWTxOQylfPvpOSo1x
# xV3kD7qf7tf2EuicKkV6dBgGiHb0riWZ3+wMA6C8IK3cGesJ4jgpTtYEzbh88pxT
# g2MSzpRnwyXHhrgcKSps1z34JmmmHP1lncxNC6DTM6yEUwE7XiDD2xNoeLITgdTQ
# jjMMT6nDJe8+xL0Zyh32OPIyrG7qPjG6MmEjzlCaWsE/trVo7I9CSOjwpp8721Hj
# q/tIHzPFg1C3dYmDh8Kbmr21dHWBLYQF4P8lq8u8AYDa6H7xvkx7G0i2jglAA4YK
# i1V8AlyTwRkwggUwMIIEGKADAgECAhAECRgbX9W7ZnVTQ7VvlVAIMA0GCSqGSIb3
# DQEBCwUAMGUxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAX
# BgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3Vy
# ZWQgSUQgUm9vdCBDQTAeFw0xMzEwMjIxMjAwMDBaFw0yODEwMjIxMjAwMDBaMHIx
# CzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3
# dy5kaWdpY2VydC5jb20xMTAvBgNVBAMTKERpZ2lDZXJ0IFNIQTIgQXNzdXJlZCBJ
# RCBDb2RlIFNpZ25pbmcgQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQD407Mcfw4Rr2d3B9MLMUkZz9D7RZmxOttE9X/lqJ3bMtdx6nadBS63j/qSQ8Cl
# +YnUNxnXtqrwnIal2CWsDnkoOn7p0WfTxvspJ8fTeyOU5JEjlpB3gvmhhCNmElQz
# UHSxKCa7JGnCwlLyFGeKiUXULaGj6YgsIJWuHEqHCN8M9eJNYBi+qsSyrnAxZjNx
# PqxwoqvOf+l8y5Kh5TsxHM/q8grkV7tKtel05iv+bMt+dDk2DZDv5LVOpKnqagqr
# hPOsZ061xPeM0SAlI+sIZD5SlsHyDxL0xY4PwaLoLFH3c7y9hbFig3NBggfkOItq
# cyDQD2RzPJ6fpjOp/RnfJZPRAgMBAAGjggHNMIIByTASBgNVHRMBAf8ECDAGAQH/
# AgEAMA4GA1UdDwEB/wQEAwIBhjATBgNVHSUEDDAKBggrBgEFBQcDAzB5BggrBgEF
# BQcBAQRtMGswJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBD
# BggrBgEFBQcwAoY3aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
# QXNzdXJlZElEUm9vdENBLmNydDCBgQYDVR0fBHoweDA6oDigNoY0aHR0cDovL2Ny
# bDQuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEUm9vdENBLmNybDA6oDig
# NoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEUm9v
# dENBLmNybDBPBgNVHSAESDBGMDgGCmCGSAGG/WwAAgQwKjAoBggrBgEFBQcCARYc
# aHR0cHM6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzAKBghghkgBhv1sAzAdBgNVHQ4E
# FgQUWsS5eyoKo6XqcQPAYPkt9mV1DlgwHwYDVR0jBBgwFoAUReuir/SSy4IxLVGL
# p6chnfNtyA8wDQYJKoZIhvcNAQELBQADggEBAD7sDVoks/Mi0RXILHwlKXaoHV0c
# LToaxO8wYdd+C2D9wz0PxK+L/e8q3yBVN7Dh9tGSdQ9RtG6ljlriXiSBThCk7j9x
# jmMOE0ut119EefM2FAaK95xGTlz/kLEbBw6RFfu6r7VRwo0kriTGxycqoSkoGjpx
# KAI8LpGjwCUR4pwUR6F6aGivm6dcIFzZcbEMj7uo+MUSaJ/PQMtARKUT8OZkDCUI
# QjKyNookAv4vcn4c10lFluhZHen6dGRrsutmQ9qzsIzV6Q3d9gEgzpkxYz0IGhiz
# gZtPxpMQBvwHgfqL2vmCSfdibqFT+hKUGIUukpHqaGxEMrJmoecYpJpkUe8wggZq
# MIIFUqADAgECAhADAZoCOv9YsWvW1ermF/BmMA0GCSqGSIb3DQEBBQUAMGIxCzAJ
# BgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5k
# aWdpY2VydC5jb20xITAfBgNVBAMTGERpZ2lDZXJ0IEFzc3VyZWQgSUQgQ0EtMTAe
# Fw0xNDEwMjIwMDAwMDBaFw0yNDEwMjIwMDAwMDBaMEcxCzAJBgNVBAYTAlVTMREw
# DwYDVQQKEwhEaWdpQ2VydDElMCMGA1UEAxMcRGlnaUNlcnQgVGltZXN0YW1wIFJl
# c3BvbmRlcjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKNkXfx8s+CC
# NeDg9sYq5kl1O8xu4FOpnx9kWeZ8a39rjJ1V+JLjntVaY1sCSVDZg85vZu7dy4Xp
# X6X51Id0iEQ7Gcnl9ZGfxhQ5rCTqqEsskYnMXij0ZLZQt/USs3OWCmejvmGfrvP9
# Enh1DqZbFP1FI46GRFV9GIYFjFWHeUhG98oOjafeTl/iqLYtWQJhiGFyGGi5uHzu
# 5uc0LzF3gTAfuzYBje8n4/ea8EwxZI3j6/oZh6h+z+yMDDZbesF6uHjHyQYuRhDI
# jegEYNu8c3T6Ttj+qkDxss5wRoPp2kChWTrZFQlXmVYwk/PJYczQCMxr7GJCkawC
# wO+k8IkRj3cCAwEAAaOCAzUwggMxMA4GA1UdDwEB/wQEAwIHgDAMBgNVHRMBAf8E
# AjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMIIBvwYDVR0gBIIBtjCCAbIwggGh
# BglghkgBhv1sBwEwggGSMCgGCCsGAQUFBwIBFhxodHRwczovL3d3dy5kaWdpY2Vy
# dC5jb20vQ1BTMIIBZAYIKwYBBQUHAgIwggFWHoIBUgBBAG4AeQAgAHUAcwBlACAA
# bwBmACAAdABoAGkAcwAgAEMAZQByAHQAaQBmAGkAYwBhAHQAZQAgAGMAbwBuAHMA
# dABpAHQAdQB0AGUAcwAgAGEAYwBjAGUAcAB0AGEAbgBjAGUAIABvAGYAIAB0AGgA
# ZQAgAEQAaQBnAGkAQwBlAHIAdAAgAEMAUAAvAEMAUABTACAAYQBuAGQAIAB0AGgA
# ZQAgAFIAZQBsAHkAaQBuAGcAIABQAGEAcgB0AHkAIABBAGcAcgBlAGUAbQBlAG4A
# dAAgAHcAaABpAGMAaAAgAGwAaQBtAGkAdAAgAGwAaQBhAGIAaQBsAGkAdAB5ACAA
# YQBuAGQAIABhAHIAZQAgAGkAbgBjAG8AcgBwAG8AcgBhAHQAZQBkACAAaABlAHIA
# ZQBpAG4AIABiAHkAIAByAGUAZgBlAHIAZQBuAGMAZQAuMAsGCWCGSAGG/WwDFTAf
# BgNVHSMEGDAWgBQVABIrE5iymQftHt+ivlcNK2cCzTAdBgNVHQ4EFgQUYVpNJLZJ
# Mp1KKnkag0v0HonByn0wfQYDVR0fBHYwdDA4oDagNIYyaHR0cDovL2NybDMuZGln
# aWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEQ0EtMS5jcmwwOKA2oDSGMmh0dHA6
# Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRENBLTEuY3JsMHcG
# CCsGAQUFBwEBBGswaTAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQu
# Y29tMEEGCCsGAQUFBzAChjVodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGln
# aUNlcnRBc3N1cmVkSURDQS0xLmNydDANBgkqhkiG9w0BAQUFAAOCAQEAnSV+GzNN
# siaBXJuGziMgD4CH5Yj//7HUaiwx7ToXGXEXzakbvFoWOQCd42yE5FpA+94GAYw3
# +puxnSR+/iCkV61bt5qwYCbqaVchXTQvH3Gwg5QZBWs1kBCge5fH9j/n4hFBpr1i
# 2fAnPTgdKG86Ugnw7HBi02JLsOBzppLA044x2C/jbRcTBu7kA7YUq/OPQ6dxnSHd
# FMoVXZJB2vkPgdGZdA0mxA5/G7X1oPHGdwYoFenYk+VVFvC7Cqsc21xIJ2bIo4sK
# HOWV2q7ELlmgYd3a822iYemKC23sEhi991VUQAOSK2vCUcIKSK+w1G7g9BQKOhvj
# jz3Kr2qNe9zYRDCCBs0wggW1oAMCAQICEAb9+QOWA63qAArrPye7uhswDQYJKoZI
# hvcNAQEFBQAwZTELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZ
# MBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEkMCIGA1UEAxMbRGlnaUNlcnQgQXNz
# dXJlZCBJRCBSb290IENBMB4XDTA2MTExMDAwMDAwMFoXDTIxMTExMDAwMDAwMFow
# YjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQ
# d3d3LmRpZ2ljZXJ0LmNvbTEhMB8GA1UEAxMYRGlnaUNlcnQgQXNzdXJlZCBJRCBD
# QS0xMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6IItmfnKwkKVpYBz
# QHDSnlZUXKnE0kEGj8kz/E1FkVyBn+0snPgWWd+etSQVwpi5tHdJ3InECtqvy15r
# 7a2wcTHrzzpADEZNk+yLejYIA6sMNP4YSYL+x8cxSIB8HqIPkg5QycaH6zY/2DDD
# /6b3+6LNb3Mj/qxWBZDwMiEWicZwiPkFl32jx0PdAug7Pe2xQaPtP77blUjE7h6z
# 8rwMK5nQxl0SQoHhg26Ccz8mSxSQrllmCsSNvtLOBq6thG9IhJtPQLnxTPKvmPv2
# zkBdXPao8S+v7Iki8msYZbHBc63X8djPHgp0XEK4aH631XcKJ1Z8D2KkPzIUYJX9
# BwSiCQIDAQABo4IDejCCA3YwDgYDVR0PAQH/BAQDAgGGMDsGA1UdJQQ0MDIGCCsG
# AQUFBwMBBggrBgEFBQcDAgYIKwYBBQUHAwMGCCsGAQUFBwMEBggrBgEFBQcDCDCC
# AdIGA1UdIASCAckwggHFMIIBtAYKYIZIAYb9bAABBDCCAaQwOgYIKwYBBQUHAgEW
# Lmh0dHA6Ly93d3cuZGlnaWNlcnQuY29tL3NzbC1jcHMtcmVwb3NpdG9yeS5odG0w
# ggFkBggrBgEFBQcCAjCCAVYeggFSAEEAbgB5ACAAdQBzAGUAIABvAGYAIAB0AGgA
# aQBzACAAQwBlAHIAdABpAGYAaQBjAGEAdABlACAAYwBvAG4AcwB0AGkAdAB1AHQA
# ZQBzACAAYQBjAGMAZQBwAHQAYQBuAGMAZQAgAG8AZgAgAHQAaABlACAARABpAGcA
# aQBDAGUAcgB0ACAAQwBQAC8AQwBQAFMAIABhAG4AZAAgAHQAaABlACAAUgBlAGwA
# eQBpAG4AZwAgAFAAYQByAHQAeQAgAEEAZwByAGUAZQBtAGUAbgB0ACAAdwBoAGkA
# YwBoACAAbABpAG0AaQB0ACAAbABpAGEAYgBpAGwAaQB0AHkAIABhAG4AZAAgAGEA
# cgBlACAAaQBuAGMAbwByAHAAbwByAGEAdABlAGQAIABoAGUAcgBlAGkAbgAgAGIA
# eQAgAHIAZQBmAGUAcgBlAG4AYwBlAC4wCwYJYIZIAYb9bAMVMBIGA1UdEwEB/wQI
# MAYBAf8CAQAweQYIKwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
# cC5kaWdpY2VydC5jb20wQwYIKwYBBQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2lj
# ZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RDQS5jcnQwgYEGA1UdHwR6MHgw
# OqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJ
# RFJvb3RDQS5jcmwwOqA4oDaGNGh0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9EaWdp
# Q2VydEFzc3VyZWRJRFJvb3RDQS5jcmwwHQYDVR0OBBYEFBUAEisTmLKZB+0e36K+
# Vw0rZwLNMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1Ri6enIZ3zbcgPMA0GCSqGSIb3
# DQEBBQUAA4IBAQBGUD7Jtygkpzgdtlspr1LPUukxR6tWXHvVDQtBs+/sdR90OPKy
# XGGinJXDUOSCuSPRujqGcq04eKx1XRcXNHJHhZRW0eu7NoR3zCSl8wQZVann4+er
# Ys37iy2QwsDStZS9Xk+xBdIOPRqpFFumhjFiqKgz5Js5p8T1zh14dpQlc+Qqq8+c
# dkvtX8JLFuRLcEwAiR78xXm8TBJX/l/hHrwCXaj++wc4Tw3GXZG5D2dFzdaD7eeS
# DY2xaYxP+1ngIw/Sqq4AfO6cQg7PkdcntxbuD8O9fAqg7iwIVYUiuOsYGk38KiGt
# STGDR5V3cdyxG0tLHBCcdxTBnU8vWpUIKRAmMYIEOzCCBDcCAQEwgYYwcjELMAkG
# A1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRp
# Z2ljZXJ0LmNvbTExMC8GA1UEAxMoRGlnaUNlcnQgU0hBMiBBc3N1cmVkIElEIENv
# ZGUgU2lnbmluZyBDQQIQCIQ1OU/QbU6rESO7M78utDAJBgUrDgMCGgUAoHgwGAYK
# KwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIB
# BDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQU
# N46H8rjra4jBKNrtVyf4X1vHi8QwDQYJKoZIhvcNAQEBBQAEggEAEEHM/2R6ZST/
# BaYgMxxOtezmd+He9RuK+msBIjVcBVhRvKDxezjKsv5sZSdTEz6fVxzHgQ0o1P25
# nHEwy5cayMVEb3m4mJkfx0H3aXCh30k1EQBr5YsUaM6j11igF5fTw5/iydcI+fUL
# KsuV1xE+K4IkUlGPPNtoQFhLYPosbRZABG7ZHWDeoLOiXQ4D6/EYVSdynls4yqOj
# H9mpzXZDYhZMKVqYubBkNCpYLvkcBYIWGbQEq5BhfV5Dsj+dt/vLED+tiMz2bCQa
# GyfszbjOXfcbnij9zSR3kMeYd7zKeDckD3zVaiSbvZyiPNW77LqNhzuSZubJH1Eg
# LeD8XwRzXqGCAg8wggILBgkqhkiG9w0BCQYxggH8MIIB+AIBATB2MGIxCzAJBgNV
# BAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdp
# Y2VydC5jb20xITAfBgNVBAMTGERpZ2lDZXJ0IEFzc3VyZWQgSUQgQ0EtMQIQAwGa
# Ajr/WLFr1tXq5hfwZjAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3
# DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAwNTI4MTAzODA3WjAjBgkqhkiG9w0BCQQx
# FgQU1r/Mlug9gcw7y7FpouaS/rt4SL4wDQYJKoZIhvcNAQEBBQAEggEAN3xJ2HJ9
# RGDRc6+iNvPCwaMs3XHo3zXgV5rFDmaLyA6mypq4uN4Q++lTIcSyfgBCVKvOndc2
# /ynleGbiQn6TVEGDp4jId/0oDgrZOY+fQSaC2at9foIZqJOWBMKIwkhI7yjTvYIs
# jl+vabxk2JgrWndIyI+C+pZrKFp9PjSuNi4Ty0KnAflJi5WaQ+2c1Z9XcEUH27hZ
# /DqPVgE40hzSpZz1K98COvuGk+1LBMwABjFOo3cZj+1JVcafsQnbB6pKbFAi7HfH
# Ifw0ssbp6u147oMByWeARfJuR0zQRZguEudy8ZyHoidIDYjBW1xXZybsFMBf5q+l
# 1DLzbaxnourj/Q==
# SIG # End signature block
