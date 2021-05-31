<#
.SYNOPSIS
    Get ClickUp time entries.
.DESCRIPTION
    Get ClickUp time entries. Optional within a date range.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER StartDate
    Start date and time of the time entries range.
.PARAMETER EndDate
    End date and time of the time entries range.
.PARAMETER Assignees
    ClickUp member IDs to return the time entries of.
.EXAMPLE
    PS C:\> Get-ClickUpTimeEntries -TeamID 512
    Get ClickUp Time Entries for ClickUp team with ID "512".
.EXAMPLE
    PS C:\> Get-ClickUpTimeEntries -TeamID 512 -StartDate "12/01/2021 00:00" -EndDate "12/31/2021 23:59"
    Get ClickUp Time Entries for ClickUp team with ID "512" between December 1st, 2021 12:00 AM and December 31, 2021 11:59 PM.
.INPUTS
    None
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
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(HelpMessage = 'Start date and time of the time entries range.')]
        [ValidateNotNullOrEmpty()]
        [DateTime]$StartDate,
        [Parameter(HelpMessage = 'End date and time of the time entries range.')]
        [ValidateNotNullOrEmpty()]
        [DateTime]$EndDate,
        [Parameter(HelpMessage = 'ClickUp member IDs to return the time entries of.')]
        [ValidateNotNullOrEmpty()]
        [UInt32[]]$Assignees
    )

    $QueryString = @{}

    if ($PSBoundParameters.ContainsKey('StartDate')) {
        $QueryString.Add('start_date', $(Get-DatePosixMilliseconds -DateTime $StartDate))
    }
    if ($PSBoundParameters.ContainsKey('StartDate')) {
        $QueryString.Add('start_date', $(Get-DatePosixMilliseconds -DateTime $StartDate))
    }
    if ($PSBoundParameters.ContainsKey('Assignees')) {
        $QueryString.Add('assignee', $($Assignees -join ','))
    }

    $TimeTracking = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "team/$TeamID/time_entries"
    Return $TimeTracking.data
}

<#
.SYNOPSIS
    Get a single ClickUp time entry.
.DESCRIPTION
    Get a single ClickUp time entry.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER TimerID
    ClickUp time entry ID.
.EXAMPLE
    PS C:\> Get-ClickUpTimeEntry -TeamID 512 -TimerID 1963465985517105840
    Get a ClickUp Time Entry with ID "1963465985517105840" for ClickUp team with ID "512".
.INPUTS
    None
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
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp time entry ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TimerID
    )

    $TimeTracking = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/time_entries/$TimerID"
    Return $TimeTracking.data
}

<#
.SYNOPSIS
    Get the history of a single ClickUp time entry.
.DESCRIPTION
    Get the history of a single ClickUp time entry.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER TimerID
    ClickUp time entry ID.
.EXAMPLE
    PS C:\> Get-ClickUpTimeEntryHistory -TeamID 512 -TimerID 1963465985517105840
    Get the history of a ClickUp Time Entry with ID "1963465985517105840" for ClickUp team with ID "512".
.INPUTS
    None
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
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp time entry ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TimerID
    )

    $TimeTracking = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/time_entries/$TimerID/history"
    $TimeTracking.data
}

<#
.SYNOPSIS
    Get running ClickUp time entries.
.DESCRIPTION
    Get running ClickUp time entries.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER Assignee
    ClickUp member ID.
.EXAMPLE
    PS C:\> Get-ClickUpRunningTimeEntry -TeamID 512
    Get running time entries for ClickUp team with ID "512".
.EXAMPLE
    PS C:\> Get-ClickUpRunningTimeEntry -TeamID 512 -Assignee 1234
    Get running time entries for ClickUp team with ID "512" assigned to assingee with ID "1234"
.INPUTS
    None
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
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(HelpMessage = 'ClickUp member ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$Assignee
    )

    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $QueryString = @{
            assignee = $Assignee
        }
    } else {
        $QueryString = @{}
    }

    $TimeTracking = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "team/$TeamID/time_entries/current"
    Return $TimeTracking.data
}

<#
.SYNOPSIS
    Get all tags from ClickUp time entries.
.DESCRIPTION
    Get all tags from ClickUp time entries.
.PARAMETER TeamID
    ClickUp team ID.
.EXAMPLE
    PS C:\> Get-ClickUpTimeEntryTags -TeamID 512
    Get time entry tags for ClickUp team with ID "512".
.INPUTS
    None
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
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID
    )

    $TimeTracking = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/time_entries/tags"
    Return $TimeTracking.data
}

<#
.SYNOPSIS
    Create a new ClickUp time entry.
.DESCRIPTION
    Create a new ClickUp time entry.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER CustomTaskIDs
    If you want to reference a task by its custom task ID, this value must be true.
.PARAMETER Description
    Description of the new ClickUp time entry.
.PARAMETER Tags
    Tags to add to the new ClickUp time entry.
.PARAMETER StartDate
    Start date and time of the new ClickUp time entry.
.PARAMETER Billable
    Set to true to make the new time entry billable.
.PARAMETER Duration
    Duration of the new ClickUp time entry in seconds.
.PARAMETER Assignee
    ClickUp member assigned to the new ClickUp time entry.
.PARAMETER TaskID
    ClickUp task ID to assign the time entry to.
.EXAMPLE
    PS C:\> New-ClickUpTimeEntry -TeamID 1111111 -Description 'this is a test time entry' -StartDate '12/31/2021 08:25' -Duration '600'
    Create a new ClickUp time entry starting December 31, 2021 8:25 AM with a duration of 10 minutes.
.INPUTS
    None
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
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(HelpMessage = 'If you want to reference a task by its custom task ID, this value must be true.')]
        [ValidateNotNullOrEmpty()]
        [bool]$CustomTaskIDs = $false,
        [Parameter(HelpMessage = 'Description of the new ClickUp time entry.')]
        [ValidateNotNullOrEmpty()]
        [string]$Description,
        [Parameter(HelpMessage = 'Tags to add to the new ClickUp time entry.')]
        [ValidateNotNullOrEmpty()]
        [hashtable[]]$Tags,
        [Parameter(Mandatory = $true, HelpMessage = 'Start date and time of the new ClickUp time entry.')]
        [ValidateNotNullOrEmpty()]
        [DateTime]$StartDate,
        [Parameter(HelpMessage = 'Set to true to make the new time entry billable.')]
        [ValidateNotNullOrEmpty()]
        [bool]$Billable,
        [Parameter(Mandatory = $true, HelpMessage = 'Duration of the new ClickUp time entry in seconds.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$Duration,
        [Parameter(HelpMessage = 'ClickUp member assigned to the new ClickUp time entry.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$Assignee,
        [Parameter(HelpMessage = 'ClickUp task ID to assign the time entry to.')]
        [ValidateNotNullOrEmpty()]
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
        $T = New-TimeSpan -Seconds $Duration
        $Body.Add('duration', $T.TotalMilliseconds)
    }
    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $Body.Add('assignee', $Assignee)
    }
    if ($PSBoundParameters.ContainsKey('TaskID')) {
        $Body.Add('tid', $TaskID)
    }

    $TimeEntry = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "team/$TeamID/time_entries" -Body $Body
    Return $TimeEntry.data
}

<#
.SYNOPSIS
    Add tags to a ClickUp time entry.
.DESCRIPTION
    Add tags to a ClickUp time entry.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER TimeEntryIDs
    Array of ClickUp time entry IDs to assign tags to.
.PARAMETER Tags
    Name of ClickUp tag to add to the time entries.
.EXAMPLE
    PS C:\> Add-ClickUpTimeEntryTags -TeamID 1111111 -TimeEntryIDs 2222222222222222222 -Tags "name of tag"
    Add the tag with name "name of tag" to ClickUp time entry with ID "2222222222222222222".
.EXAMPLE
    PS C:\> Add-ClickUpTimeEntryTags -TeamID 1111111 -TimeEntryIDs 2222222222222222222,3333333333333333333 -Tags "name of tag","second tag name"
    Add the tag with name "name of tag" and "second tag name" to ClickUp time entries with IDs "2222222222222222222" and "3333333333333333333".
.INPUTS
    None
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
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'Array of ClickUp time entry IDs to assign tags to.')]
        [ValidateNotNullOrEmpty()]
        [UInt64[]]$TimeEntryIDs,
        [Parameter(Mandatory = $true, HelpMessage = 'Name of ClickUp tag to add to the time entries.')]
        [ValidateNotNullOrEmpty()]
        [string[]]$Tags
    )

    $Body = @{
        time_entry_ids = $TimeEntryIDs
        tags           = $Tags
    }

    Invoke-ClickUpAPIPost -EndPoint "team/$TeamID/time_entries/tags" -Body $Body
}

<#
.SYNOPSIS
    Update tag names from ClickUp time entries.
.DESCRIPTION
    Update tag names from ClickUp time entries.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER OldTagName
    Old name of the ClickUp tag to change.
.PARAMETER NewTagName
    New name of the ClickUp tag.
.PARAMETER TagBackgroundColor
    Background color of the ClickUp tag in hex format.
.PARAMETER TagForegroundColor
    Foreground color of the ClickUp tag in nex format.
.EXAMPLE
    PS C:\> Set-ClickUpTimeEntryTags -TeamID 1111111 -OldTagName "old tag name" -NewTagName "new tag name"
    Change the ClickUp tag with name "old tag name" to "new tag name".
.EXAMPLE
    PS C:\> Set-ClickUpTimeEntryTags -TeamID 1111111 -OldTagName "old tag name" TagBackgroundColor "#000000" -TagForegroundColor "#ffffff"
    Change the ClickUp tag with name "old tag name" foreground color to white and background color to black.
.INPUTS
    None
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
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'Old name of the ClickUp tag to change.')]
        [ValidateNotNullOrEmpty()]
        [string]$OldTagName,
        [Parameter(Mandatory = $true, HelpMessage = 'New name of the ClickUp tag.')]
        [ValidateNotNullOrEmpty()]
        [string]$NewTagName,
        [Parameter(HelpMessage = 'Background color of the ClickUp tag in hex format.')]
        [ValidateNotNullOrEmpty()]
        [string]$TagBackgroundColor,
        [Parameter(HelpMessage = 'Foreground color of the ClickUp tag in nex format.')]
        [ValidateNotNullOrEmpty()]
        [string]$TagForegroundColor
    )

    $Body = @{
        name     = $NewTagName
        new_name = $OldTagName
        tag_bg   = $TagBackgroundColor
        tag_fg   = $TagForegroundColor
    }

    Invoke-ClickUpAPIPut -EndPoint "team/$TeamID/time_entries/tags" -Body $Body
}

<#
.SYNOPSIS
    Start a ClickUp time entry.
.DESCRIPTION
    Start a ClickUp time entry.
.PARAMETER TeamID
    ClickUp team Id.
.PARAMETER TimerID
    ClickUp time entry ID.
.PARAMETER TaskID
    ClickUp task ID.
.PARAMETER Description
    Description to change the time entry to.
.PARAMETER Tags
    ClickUp tags to add to the ClickUp time entry.
.PARAMETER Billable
    Set to true to make the time entry billable.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.EXAMPLE
    PS C:\> Start-ClickUpTimeEntry -TeamID 512 -TimerID 2004673344540003570 -Description 'Time entry description'
    Start time entry with ID "2004673344540003570" and set description to "Time entry description" for team with ID "512".
.EXAMPLE
    PS C:\> Start-ClickUpTimeEntry -TeamID 512 -TaskID 9hx -Description 'Time entry description' -Billable $true
    Start time entry for task with ID "9hx" and set description to "Time entry description" and billable set to true for team with ID "512".
.INPUTS
    None
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
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'ClickUp team Id.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TimerID', HelpMessage = 'ClickUp team Id.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TimerID', HelpMessage = 'ClickUp time entry ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TimerID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'ClickUp task ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$TaskID,
        [Parameter(ParameterSetName = 'TaskID', HelpMessage = 'Description to change the time entry to.')]
        [Parameter(ParameterSetName = 'TimerID', HelpMessage = 'Description to change the time entry to.')]
        [ValidateNotNullOrEmpty()]
        [string]$Description = '',
        [Parameter(ParameterSetName = 'TaskID', HelpMessage = 'ClickUp tags to add to the ClickUp time entry.')]
        [Parameter(ParameterSetName = 'TimerID', HelpMessage = 'ClickUp tags to add to the ClickUp time entry.')]
        [ValidateNotNullOrEmpty()]
        [hashtable[]]$Tags,
        [Parameter(ParameterSetName = 'TaskID', HelpMessage = 'Set to true to make the time entry billable.')]
        [Parameter(ParameterSetName = 'TimerID')]
        [ValidateNotNullOrEmpty()]
        [bool]$Billable = $false,
        [Parameter(ParameterSetName = 'TaskID', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [Parameter(ParameterSetName = 'TimerID', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [ValidateNotNullOrEmpty()]
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

    $TimeEntry = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "/team/$TeamID/time_entries/start/$TimerID" -Body $Body
    Return $TimeEntry.data
}

<#
.SYNOPSIS
    Stop ClickUp time entries.
.DESCRIPTION
    Stop ClickUp time entries.
.PARAMETER TeamID
    ClickUp team ID.
.EXAMPLE
    PS C:\> Stop-ClickUpTimeEntry -TeamID 512
    Stop ClickUp time entries for Team with ID "512".
.INPUTS
    None
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
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID
    )

    $TimeEntry = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/time_entries/stop"
    $TimeEntry.data
}

<#
.SYNOPSIS
    Update a ClickUp time entry.
.DESCRIPTION
    Update a ClickUp time entry.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER TimerID
    ClickUp time entry ID.
.PARAMETER Description
    Description to change the time entry to.
.PARAMETER Tags
    ClickUp tags to add to the ClickUp time entry.
.PARAMETER TagAction
    Action to perform on the tags referenced in the -Tags parameter. Can be replace, add, or remove.
.PARAMETER StartDate
    Start date and time of the ClickUp time entry.
.PARAMETER EndDate
    End date and time of the ClickUp time entry.
.PARAMETER TaskID
    ClickUp task ID.
.PARAMETER Billable
    Set to true to make the time entry billable.
.PARAMETER Duration
    Duration of the new ClickUp time entry in seconds.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.EXAMPLE
    PS C:\> Set-ClickUpTimeEntry -TeamID 512 -TimerID 2004673344540003570 -Description 'Time entry description.' -Tags 'Time Entry Tag' -TagAction 'replace'
    Sets ClickUp Time Entry with timer ID "2004673344540003570" description to "Time entry description." and removes the tag "Time Entry Tag".
.EXAMPLE
    PS C:\> Set-ClickUpTimeEntry -TeamID 512 -TimerID 2004673344540003570 -Description 'Time entry description.' -Tags 'Time Entry Tag' -TagAction 'add'
    Sets ClickUp Time Entry with timer ID "2004673344540003570" description to "Time entry description." and adds the tag "Time Entry Tag".
.INPUTS
    None
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
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp time entry ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TimerID,
        [Parameter(HelpMessage = 'Description to change the time entry to.')]
        [ValidateNotNullOrEmpty()]
        [string]$Description = '',
        [Parameter(HelpMessage = 'ClickUp tags to add to the ClickUp time entry.')]
        [ValidateNotNullOrEmpty()]
        [hashtable[]]$Tags,
        [Parameter(HelpMessage = 'Action to perform on the tags referenced in the -Tags parameter. Can be replace, add, or remove.')]
        [ValidateSet('replace', 'add', 'remove')]
        [string]$TagAction,
        [Parameter(HelpMessage = 'Start date and time of the ClickUp time entry.')]
        [ValidateNotNullOrEmpty()]
        [string]$StartDate,
        [Parameter(HelpMessage = 'End date and time of the ClickUp time entry.')]
        [ValidateNotNullOrEmpty()]
        [string]$EndDate,
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp task ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$TaskID,
        [Parameter(HelpMessage = 'Set to true to make the time entry billable.')]
        [ValidateNotNullOrEmpty()]
        [bool]$Billable,
        [Parameter(HelpMessage = 'Duration of the new ClickUp time entry in seconds.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$Duration,
        [Parameter(HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [ValidateNotNullOrEmpty()]
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
        $T = New-TimeSpan -Seconds $Duration
        $Body.Add('duration', $T.TotalMilliseconds)
    }

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    $TimeEntry = Invoke-ClickUpAPIPut -Arguments $QueryString -Endpoint "team/$TeamID/time_entries/stop" -Body $Body
    $TimeEntry.data
}


<#
.SYNOPSIS
    Remove a ClickUp time entry.
.DESCRIPTION
    Remove a ClickUp time entry.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER TimerId
    ClickUp time entry ID.
.EXAMPLE
    PS C:\> Remove-ClickUpTimeEntry -TeamID 1111111 -TimerID 2222222222222222222
    Remove a ClickUp time entry with ID "2222222222222222222".
.INPUTS
    None
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
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp time entry ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TimerID
    )

    if ($PSCmdlet.ShouldProcess($TimerID)) {
        $TimeEntry = Invoke-ClickUpAPIDelete -Endpoint "team/$TeamID/time_entries/$TimerID"
        Return $TimeEntry.data
    }
}