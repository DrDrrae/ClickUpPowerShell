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
        [Parameter(Mandatory = $true)]
        [UInt32]$TeamID,
        [Parameter()]
        [DateTime]$StartDate,
        [Parameter()]
        [DateTime]$EndDate,
        [Parameter()]
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
        [Parameter(Mandatory = $true)]
        [UInt32]$TeamID,
        [Parameter(Mandatory = $true)]
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
        [Parameter(Mandatory = $true)]
        [UInt32]$TeamID,
        [Parameter(Mandatory = $true)]
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
        [Parameter(Mandatory = $true)]
        [UInt32]$TeamID,
        [Parameter()]
        [UInt32]$Assignee
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
        [Parameter(Mandatory = $true)]
        [UInt32]$TeamID
    )

    $TimeTracking = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/time_entries/tags"
    Return $TimeTracking.data
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
        [Parameter(Mandatory = $true)]
        [UInt32]$TeamID,
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
        [UInt32]$Duration,
        [Parameter()]
        [UInt32]$Assignee,
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

    $TimeEntry = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "team/$TeamID/time_entries" -Body $Body
    Return $TimeEntry.data
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
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/create-a-time-entry.html
#>
function Remove-ClickUpTimeEntry {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [UInt32]$TeamID,
        [Parameter(Mandatory = $true)]
        [UInt64]$TimerID
    )

    if ($PSCmdlet.ShouldProcess($TimerID)) {
        $TimeEntry = Invoke-ClickUpAPIDelete -Endpoint "team/$TeamID/time_entries/$TimerID"
        Return $TimeEntry.data
    }
}