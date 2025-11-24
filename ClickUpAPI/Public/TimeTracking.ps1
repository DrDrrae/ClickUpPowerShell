<#
.SYNOPSIS
    Get ClickUp time entries.
.DESCRIPTION
    Get ClickUp time entries. Optional within a date range.
.EXAMPLE
    PS C:\> Get-ClickUpTimeEntries -TeamID 512
    Get ClickUp Time Entries for ClickUp team with ID "512".
.EXAMPLE
    PS C:\> Get-ClickUpTimeEntries -TeamID 512 -StartDate "12/01/2021 00:00" -EndDate "12/31/2021 23:59"
    Get ClickUp Time Entries for ClickUp team with ID "512" between December 1st, 2021 12:00 AM and December 31, 2021 11:59 PM.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-time-entries-within-a-date-range.html
#>
function Get-ClickUpTimeEntries {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [ulong]$TeamID,
        [Parameter()]
        [DateTime]$StartDate,
        [Parameter()]
        [DateTime]$EndDate,
        [Parameter()]
        [ulong[]]$Assignees,
        [Parameter()]
        [Bool]$IncludeTaskTags = $false,
        [Parameter()]
        [Bool]$IncludeLocationNames = $false,
        [Parameter()]
        [ulong]$SpaceID,
        [Parameter()]
        [ulong]$FolderID,
        [Parameter()]
        [ulong]$ListID,
        [Parameter()]
        [ulong]$TaskID,
        [Parameter()]
        [bool]$CustomTaskIDs = $false
    )

    $QueryString = @{
        'include_task_tags' = $IncludeTaskTags
        'include_location_names' = $IncludeLocationNames

    }

    if ($PSBoundParameters.ContainsKey('StartDate')) {
        $QueryString.Add('start_date', $(Get-DatePosixMilliseconds -DateTime $StartDate))
    }
    if ($PSBoundParameters.ContainsKey('EndDate')) {
        $QueryString.Add('end_date', $(Get-DatePosixMilliseconds -DateTime $EndDate))
    }
    if ($PSBoundParameters.ContainsKey('Assignees')) {
        $QueryString.Add('assignee', $($Assignees -join ','))
    }
    if ($PSBoundParameters.ContainsKey('SpaceID')) {
        $QueryString.Add('space_id', $SpaceID)
    }
    if ($PSBoundParameters.ContainsKey('FolderID')) {
        $QueryString.Add('folder_id', $FolderID)
    }
    if ($PSBoundParameters.ContainsKey('ListID')) {
        $QueryString.Add('list_id', $ListID)
    }
    if ($PSBoundParameters.ContainsKey('TaskID')) {
        $QueryString.Add('task_id', $TaskID)
    }
    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString.Add('custom_task_ids', $CustomTaskIDs)
        $QueryString.Add('team_id', $TeamID)
    }

    Write-Verbose 'Entering Get-ClickUpTimeEntries'
    try {
        Write-Verbose "Getting time entries for team ID: $TeamID"
        $TimeTracking = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "team/$TeamID/time_entries"
        Write-Verbose 'Successfully retrieved time entries'
        Return $TimeTracking.data
    } catch {
        Write-Error "Error in Get-ClickUpTimeEntries: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Get a single ClickUp time entry.
.DESCRIPTION
    Get a single ClickUp time entry.
.EXAMPLE
    PS C:\> Get-ClickUpTimeEntry -TeamID 512 -TimerID 1963465985517105840
    Get a ClickUp Time Entry with ID "1963465985517105840" for ClickUp team with ID "512".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-singular-time-entry.html
#>
function Get-ClickUpTimeEntry {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [ulong]$TeamID,
        [Parameter(Mandatory = $true)]
        [ulong]$TimerID
    )

    Write-Verbose 'Entering Get-ClickUpTimeEntry'
    try {
        Write-Verbose "Getting time entry with ID: $TimerID for team ID: $TeamID"
        $TimeTracking = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/time_entries/$TimerID"
        Write-Verbose 'Successfully retrieved time entry'
        Return $TimeTracking.data
    } catch {
        Write-Error "Error in Get-ClickUpTimeEntry: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Get the history of a single ClickUp time entry.
.DESCRIPTION
    Get the history of a single ClickUp time entry.
.EXAMPLE
    PS C:\> Get-ClickUpTimeEntryHistory -TeamID 512 -TimerID 1963465985517105840
    Get the history of a ClickUp Time Entry with ID "1963465985517105840" for ClickUp team with ID "512".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-time-entry-history.html
#>
function Get-ClickUpTimeEntryHistory {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [ulong]$TeamID,
        [Parameter(Mandatory = $true)]
        [ulong]$TimerID
    )

    Write-Verbose 'Entering Get-ClickUpTimeEntryHistory'
    try {
        Write-Verbose "Getting time entry history for timer ID: $TimerID in team ID: $TeamID"
        $TimeTracking = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/time_entries/$TimerID/history"
        Write-Verbose 'Successfully retrieved time entry history'
        Return $TimeTracking.data
    } catch {
        Write-Error "Error in Get-ClickUpTimeEntryHistory: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Get running ClickUp time entries.
.DESCRIPTION
    Get running ClickUp time entries.
.EXAMPLE
    PS C:\> Get-ClickUpRunningTimeEntry -TeamID 512
    Get running time entries for ClickUp team with ID "512".
.EXAMPLE
    PS C:\> Get-ClickUpRunningTimeEntry -TeamID 512 -Assignee 1234
    Get running time entries for ClickUp team with ID "512" assigned to assingee with ID "1234"
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-running-time-entry.html
#>
function Get-ClickUpRunningTimeEntry {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [ulong]$TeamID,
        [Parameter()]
        [ulong]$Assignee
    )

    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $QueryString = @{
            assignee = $Assignee
        }
    } else {
        $QueryString = @{}
    }

    Write-Verbose 'Entering Get-ClickUpRunningTimeEntry'
    try {
        Write-Verbose "Getting running time entry for team ID: $TeamID"
        $TimeTracking = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "team/$TeamID/time_entries/current"
        Write-Verbose 'Successfully retrieved running time entry'
        Return $TimeTracking.data
    } catch {
        Write-Error "Error in Get-ClickUpRunningTimeEntry: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Get all tags from ClickUp time entries.
.DESCRIPTION
    Get all tags from ClickUp time entries.
.EXAMPLE
    PS C:\> Get-ClickUpTimeEntryTags -TeamID 512
    Get time entry tags for ClickUp team with ID "512".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-all-tags-from-time-entries.html
#>
function Get-ClickUpTimeEntryTags {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [ulong]$TeamID
    )

    Write-Verbose 'Entering Get-ClickUpTimeEntryTags'
    try {
        Write-Verbose "Getting time entry tags for team ID: $TeamID"
        $TimeTracking = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/time_entries/tags"
        Write-Verbose 'Successfully retrieved time entry tags'
        Return $TimeTracking.data
    } catch {
        Write-Error "Error in Get-ClickUpTimeEntryTags: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Create a new ClickUp time entry.
.DESCRIPTION
    Create a new ClickUp time entry.
.EXAMPLE
    PS C:\> New-ClickUpTimeEntry -TeamID 1111111 -Description 'this is a test time entry' -StartDate '12/31/2021 08:25' -Duration '600'
    Create a new ClickUp time entry starting December 31, 2021 8:25 AM with a duration of 10 minutes.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/create-a-time-entry.html
#>
function New-ClickUpTimeEntry {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [ulong]$TeamID,
        [Parameter()]
        [bool]$CustomTaskIDs = $false,
        [Parameter()]
        [string]$Description,
        [Parameter()]
        [hashtable[]]$Tags,
        [Parameter(Mandatory = $true)]
        [DateTime]$StartDate,
        [Parameter()]
        [bool]$Billable,
        [Parameter(Mandatory = $true)]
        [ulong]$Duration,
        [Parameter()]
        [ulong]$Assignee,
        [Parameter()]
        [string]$TaskID
    )

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('Description')) {
        $Body.Add('Description', $Description)
    }
    if ($PSBoundParameters.ContainsKey('Tags')) {
        $Body.Add('tags', $Tags)
    }
    if ($PSBoundParameters.ContainsKey('StartDate')) {
        $Body.Add('start', $(Get-DatePosixMilliseconds -DateTime $StartDate))
    }
    if ($PSBoundParameters.ContainsKey('Billable')) {
        $Body.Add('billable', $Billable)
    }
    if ($PSBoundParameters.ContainsKey('Duration')) {
        $Body.Add('duration', $Duration)
    }
    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $Body.Add('assignee', $Assignee)
    }
    if ($PSBoundParameters.ContainsKey('TaskID')) {
        $Body.Add('tid', $TaskID)
    }

    Write-Verbose 'Entering New-ClickUpTimeEntry'
    try {
        Write-Verbose "Creating new time entry for team ID: $TeamID"
        $TimeEntry = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "team/$TeamID/time_entries" -Body $Body
        Write-Verbose 'Successfully created time entry'
        Return $TimeEntry.data
    } catch {
        Write-Error "Error in New-ClickUpTimeEntry: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Add tags to a ClickUp time entry.
.DESCRIPTION
    Add tags to a ClickUp time entry.
.EXAMPLE
    PS C:\> Add-ClickUpTimeEntryTags -TeamID 1111111 -TimeEntryIDs 2222222222222222222 -Tags "name of tag"
    Add the tag with name "name of tag" to ClickUp time entry with ID "2222222222222222222".
.EXAMPLE
    PS C:\> Add-ClickUpTimeEntryTags -TeamID 1111111 -TimeEntryIDs 2222222222222222222,3333333333333333333 -Tags "name of tag","second tag name"
    Add the tag with name "name of tag" and "second tag name" to ClickUp time entries with IDs "2222222222222222222" and "3333333333333333333".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/add-tags-from-time-entries.html
#>
function Add-ClickUpTimeEntryTags {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [string]$TeamID,
        [Parameter(Mandatory = $true)]
        [ulong[]]$TimeEntryIDs,
        [Parameter(Mandatory = $true)]
        [string[]]$Tags
    )

    $Body = @{
        time_entry_ids = $TimeEntryIDs
        tags           = $Tags
    }

    Write-Verbose 'Entering Add-ClickUpTimeEntryTags'
    try {
        Write-Verbose "Adding tags to time entries: $($TimeEntryIDs -join ', ') for team ID: $TeamID"
        Invoke-ClickUpAPIPost -EndPoint "team/$TeamID/time_entries/tags" -Body $Body
        Write-Verbose 'Successfully added tags to time entries'
    } catch {
        Write-Error "Error in Add-ClickUpTimeEntryTags: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Update tag names from ClickUp time entries.
.DESCRIPTION
    Update tag names from ClickUp time entries.
.EXAMPLE
    PS C:\> Set-ClickUpTimeEntryTags -TeamID 1111111 -OldTagName "old tag" -NewTagName "new tag"
    Rename the tag "old tag" to "new tag" for team with ID "1111111".
.EXAMPLE
    PS C:\> Set-ClickUpTimeEntryTags -TeamID 1111111 -OldTagName "old tag" -NewTagName "new tag" -TagBackgroundColor "#FF0000" -TagForegroundColor "#FFFFFF"
    Rename the tag "old tag" to "new tag" with custom colors for team with ID "1111111".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/change-tag-names-from-time-entries.html
#>
function Set-ClickUpTimeEntryTags {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [string]$TeamID,
        [Parameter(Mandatory = $true)]
        [string]$OldTagName,
        [Parameter(Mandatory = $true)]
        [string]$NewTagName,
        [Parameter()]
        [string]$TagBackgroundColor,
        [Parameter()]
        [string]$TagForegroundColor
    )

    $Body = @{
        name     = $NewTagName
        new_name = $OldTagName
        tag_bg   = $TagBackgroundColor
        tag_fg   = $TagForegroundColor
    }

    Write-Verbose 'Entering Set-ClickUpTimeEntryTags'
    try {
        Write-Verbose "Updating tag name from '$OldTagName' to '$NewTagName' for team ID: $TeamID"
        Invoke-ClickUpAPIPut -EndPoint "team/$TeamID/time_entries/tags" -Body $Body
        Write-Verbose 'Successfully updated time entry tag'
    } catch {
        Write-Error "Error in Set-ClickUpTimeEntryTags: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Start a ClickUp time entry.
.DESCRIPTION
    Start a ClickUp time entry.
.EXAMPLE
    PS C:\> Start-ClickUpTimeEntry -TeamID 512 -TimerID 2004673344540003570 -Description 'Time entry description'
    Start time entry with ID "2004673344540003570" and set description to "Time entry description" for team with ID "512".
.EXAMPLE
    PS C:\> Start-ClickUpTimeEntry -TeamID 512 -TaskID 9hx -Description 'Time entry description' -Billable $true
    Start time entry for task with ID "9hx" and set description to "Time entry description" and billable set to true for team with ID "512".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/start-a-time-entry.html
#>
function Start-ClickUpTimeEntry() {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TimerID')]
        [ulong]$TeamID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TimerID')]
        [ulong]$TimerID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [string]$TaskID,
        [Parameter(ParameterSetName = 'TaskID')]
        [Parameter(ParameterSetName = 'TimerID')]
        [string]$Description = '',
        [Parameter(ParameterSetName = 'TaskID')]
        [Parameter(ParameterSetName = 'TimerID')]
        [hashtable[]]$Tags,
        [Parameter(ParameterSetName = 'TaskID')]
        [Parameter(ParameterSetName = 'TimerID')]
        [bool]$Billable = $false,
        [Parameter(ParameterSetName = 'TaskID')]
        [Parameter(ParameterSetName = 'TimerID')]
        [bool]$CustomTaskIDs
    )

    $Body = @{
        description = $Description
        tid         = $TaskID
        billable    = $Billable
    }

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    if ($PSBoundParameters.ContainsKey('Tags')) {
        $Body.Add('tags', $Tags)
    }

    Write-Verbose 'Entering Start-ClickUpTimeEntry'
    try {
        Write-Verbose "Starting time entry for team ID: $TeamID"
        $TimeEntry = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "/team/$TeamID/time_entries/start/$TimerID" -Body $Body
        Write-Verbose 'Successfully started time entry'
        Return $TimeEntry.data
    } catch {
        Write-Error "Error in Start-ClickUpTimeEntry: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Stop ClickUp time entries.
.DESCRIPTION
    Stop ClickUp time entries.
.EXAMPLE
    PS C:\> Stop-ClickUpTimeEntry -TeamID 512
    Stop ClickUp time entries for Team with ID "512".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/stop-a-time-entry.html
#>
function Stop-ClickUpTimeEntry() {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true)]
        [ulong]$TeamID
    )

    Write-Verbose 'Entering Stop-ClickUpTimeEntry'
    try {
        Write-Verbose "Stopping time entry for team ID: $TeamID"
        $TimeEntry = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/time_entries/stop" -Body @{}
        Write-Verbose 'Successfully stopped time entry'
        Return $TimeEntry.data
    } catch {
        Write-Error "Error in Stop-ClickUpTimeEntry: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Update a ClickUp time entry.
.DESCRIPTION
    Update a ClickUp time entry.
.EXAMPLE
    PS C:\> Set-ClickUpTimeEntry -TeamID 512 -TimerID 2004673344540003570 -Description 'Time entry description.' -Tags 'Time Entry Tag' -TagAction 'replace'
    Sets ClickUp Time Entry with timer ID "2004673344540003570" description to "Time entry description." and removes the tag "Time Entry Tag".
.EXAMPLE
    PS C:\> Set-ClickUpTimeEntry -TeamID 512 -TimerID 2004673344540003570 -Description 'Time entry description.' -Tags 'Time Entry Tag' -TagAction 'add'
    Sets ClickUp Time Entry with timer ID "2004673344540003570" description to "Time entry description." and adds the tag "Time Entry Tag".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/update-a-time-entry.html
#>
function Set-ClickUpTimeEntry() {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true)]
        [ulong]$TeamID,
        [Parameter(Mandatory = $true)]
        [ulong]$TimerID,
        [Parameter()]
        [string]$Description = '',
        [Parameter()]
        [hashtable[]]$Tags,
        [Parameter()]
        [ValidateSet('replace', 'add', 'remove')]
        [string]$TagAction,
        [Parameter()]
        [string]$StartDate,
        [Parameter()]
        [string]$EndDate,
        [Parameter(Mandatory = $true)]
        [string]$TaskID,
        [Parameter()]
        [bool]$Billable,
        [Parameter()]
        [ulong]$Duration,
        [Parameter()]
        [bool]$CustomTaskIDs
    )

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('Description')) {
        $Body.Add('description', $Description)
    }
    if ($PSBoundParameters.ContainsKey('Tags')) {
        $Body.Add('tags', $Tags)
    }
    if ($PSBoundParameters.ContainsKey('TagAction')) {
        $Body.Add('tag_action', $TagAction)
    }
    if ($PSBoundParameters.ContainsKey('StartDate')) {
        $Body.Add('start', $(Get-DatePosixMilliseconds -DateTime $StartDate))
    }
    if ($PSBoundParameters.ContainsKey('EndDate')) {
        $Body.Add('end', $(Get-DatePosixMilliseconds -DateTime $EndDate))
    }
    if ($PSBoundParameters.ContainsKey('TaskID')) {
        $Body.Add('tid', $TaskID)
    }
    if ($PSBoundParameters.ContainsKey('Billable')) {
        $Body.Add('billable', $Billable)
    }
    if ($PSBoundParameters.ContainsKey('Duration')) {
        $Body.Add('duration', $Duration)
    }

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    Write-Verbose 'Entering Set-ClickUpTimeEntry'
    try {
        Write-Verbose "Updating time entry with timer ID: $TimerID for team ID: $TeamID"
        $TimeEntry = Invoke-ClickUpAPIPut -Arguments $QueryString -Endpoint "team/$TeamID/time_entries/$TimerID" -Body $Body
        Write-Verbose 'Successfully updated time entry'
        Return $TimeEntry.data
    } catch {
        Write-Error "Error in Set-ClickUpTimeEntry: $($_.Exception.Message)"
        throw $_
    }
}


<#
.SYNOPSIS
    Remove a ClickUp time entry.
.DESCRIPTION
    Remove a ClickUp time entry.
.EXAMPLE
    PS C:\> Remove-ClickUpTimeEntry -TeamID 1111111 -TimerID 2222222222222222222
    Remove a ClickUp time entry with ID "2222222222222222222".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/delete-a-time-entry.html
#>
function Remove-ClickUpTimeEntry {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [ulong]$TeamID,
        [Parameter(Mandatory = $true)]
        [ulong]$TimerID
    )

    Write-Verbose 'Entering Remove-ClickUpTimeEntry'
    if ($PSCmdlet.ShouldProcess($TimerID)) {
        try {
            Write-Verbose "Removing time entry with timer ID: $TimerID for team ID: $TeamID"
            $TimeEntry = Invoke-ClickUpAPIDelete -Endpoint "team/$TeamID/time_entries/$TimerID"
            Write-Verbose 'Successfully removed time entry'
            Return $TimeEntry.data
        } catch {
            Write-Error "Error in Remove-ClickUpTimeEntry: $($_.Exception.Message)"
            throw $_
        }
    }
}