<#
.SYNOPSIS
    Get all ClickUp tasks under a particular list.
.DESCRIPTION
    Get all ClickUp tasks under a particular list.
.EXAMPLE
    PS C:\> Get-ClickUpTasks -ListID 11111111
    Get all ClickUp task under List with ID "11111111".
.EXAMPLE
    PS C:\> Get-ClickUpTasks -ListID 22222222 -Archived $true -Page 1 -OrderBy 'updated' -Statuses 'New','In Progress'
    Get all ClickUp task under List with ID "22222222" and various other options.
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-tasks.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-legacy/get-filtered-team-tasks.html
#>
function Get-ClickUpTasks {
    [CmdletBinding(DefaultParameterSetName = 'ListID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'ListID')]
        [string]$ListID,

        [Parameter(Mandatory = $true, ParameterSetName = 'TeamID')]
        [string]$TeamID,

        [Parameter(ParameterSetName = 'ListID')]
        [bool]$Archived = $false,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [int]$Page = 0,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [ValidateSet('id', 'created', 'updated', 'due_date')]
        [string]$OrderBy = 'created',

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [bool]$Reverse = $false,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [bool]$Subtasks = $false,

        [Parameter(ParameterSetName = 'TeamID')]
        [int[]]$SpaceIDs,

        [Parameter(ParameterSetName = 'TeamID')]
        [int[]]$ProjectIDs,

        [Parameter(ParameterSetName = 'TeamID')]
        [int[]]$ListIDs,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [string[]]$Statuses,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [bool]$IncludeClosed = $false,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [string[]]$Assignees,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [datetime]$DueDateGreaterThan,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [datetime]$DueDateLessThan,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [datetime]$DateCreatedGreaterThan,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [datetime]$DateCreatedLessThan,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [datetime]$DateUpdatedGreaterThan,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [datetime]$DateUpdatedLessThan,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [array]$CustomFields,

        [Parameter(ParameterSetName = 'TeamID')]
        [bool]$CustomTaskIDs
    )

    $QueryString = @{
        page           = $Page
        order_by       = $OrderBy
        reverse        = $Reverse
        subtasks       = $Subtasks
        include_closed = $IncludeClosed
    }
    if ($PSBoundParameters.ContainsKey('Archived')) {
        $QueryString.Add('archived', $Archived)
    }
    if ($PSBoundParameters.ContainsKey('SpaceIDs')) {
        $QueryString.Add('space_ids[]', $SpaceIDs)
    }
    if ($PSBoundParameters.ContainsKey('ProjectIDs')) {
        $QueryString.Add('project_ids[]', $ProjectIDs)
    }
    if ($PSBoundParameters.ContainsKey('ListIDs')) {
        $QueryString.Add('list_ids[]', $ListIDs)
    }
    if ($PSBoundParameters.ContainsKey('Statuses')) {
        $QueryString.Add('statuses[]', $Statuses)
    }
    if ($PSBoundParameters.ContainsKey('Assignees')) {
        $QueryString.Add('assignees[]', $Assignees)
    }
    if ($PSBoundParameters.ContainsKey('DueDateGreaterThan')) {
        $QueryString.Add('due_date_gt', (Get-DatePosixMilliseconds -DateTime $DueDateGreaterThan))
    }
    if ($PSBoundParameters.ContainsKey('DueDateLessThan')) {
        $QueryString.Add('due_date_lt', (Get-DatePosixMilliseconds -DateTime $DueDateLessThan))
    }
    if ($PSBoundParameters.ContainsKey('DateCreatedGreaterThan')) {
        $QueryString.Add('date_created_gt', (Get-DatePosixMilliseconds -DateTime $DateCreatedGreaterThan))
    }
    if ($PSBoundParameters.ContainsKey('DateCreatedLessThan')) {
        $QueryString.Add('date_created_lt', (Get-DatePosixMilliseconds -DateTime $DateCreatedLessThan))
    }
    if ($PSBoundParameters.ContainsKey('DateUpdatedGreaterThan')) {
        $QueryString.Add('date_updated_gt', (Get-DatePosixMilliseconds -DateTime $DateUpdatedGreaterThan))
    }
    if ($PSBoundParameters.ContainsKey('DateUpdatedLessThan')) {
        $QueryString.Add('date_updated_lt', (Get-DatePosixMilliseconds -DateTime $DateUpdatedLessThan))
    }
    if ($PSBoundParameters.ContainsKey('CustomFields')) {
        $QueryString.Add('custom_fields', $CustomFields)
    }

    if ($PSBoundParameters.ContainsKey('ListID')) {
        $Tasks = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "list/$ListID/task"
    } elseif ($PSBoundParameters.ContainsKey('TeamID')) {
        $Tasks = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "team/$TeamID/task"
    }
    Return $Tasks.tasks
}

<#
.SYNOPSIS
    Get a ClickUp task.
.DESCRIPTION
    Get a ClickUp task.
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID 9hz
    Get a ClickUp task under List with ID "11111111".
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID 9hz -CustomTaskIDs $true -TeamID 123
    Get a ClickUp task under List with ID "22222222" and various other options.
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-task.html
#>
function Get-ClickUpTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [int]$TeamID,
        [Parameter(ParameterSetName = 'TaskID')]
        [Parameter(ParameterSetName = 'CustomTaskIDs')]
        $IncludeSubtasks = $false
    )

    $QueryString = @{
        include_subtasks = $IncludeSubtasks
    }

    $QueryString += @{
        custom_task_ids = $CustomTaskIDs
        team_id         = $TeamID
    }

    $Task = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "task/$TaskID"
    Return $Task
}

<#
.SYNOPSIS
    Get a ClickUp task's time in status.
.DESCRIPTION
    Get a ClickUp task's time in status.
.EXAMPLE
    PS C:\> Get-ClickUpTaskTimeInStatus -TaskID 9hz
    Get a ClickUp task's time in status with ID "9hz".
.EXAMPLE
    PS C:\> Get-ClickUpTaskTimeInStatus -TaskID "CustomTaskID" -CustomTaskIDs $true -TeamID 123
    Get a ClickUp task's time in status with custom ID "CustomTaskID".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-task's-time-in-status.html
#>
function Get-ClickUpTaskTimeInStatus {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [int]$TeamID,
        [Parameter(ParameterSetName = 'TaskID')]
        [Parameter(ParameterSetName = 'CustomTaskIDs')]
        $IncludeSubtasks = $false
    )

    $QueryString = @{
        include_subtasks = $IncludeSubtasks
    }

    $QueryString += @{
        custom_task_ids = $CustomTaskIDs
        team_id         = $TeamID
    }

    $Task = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "task/$TaskID/time_in_status"
    Return $Task
}

<#
.SYNOPSIS
    Get a ClickUp bulk task's time in status.
.DESCRIPTION
    Get a ClickUp bulk task's time in status.
.EXAMPLE
    PS C:\> Get-ClickUpTaskTimeInStatusBulk -TaskID 9hz,3cuh,g4fs
    Get a ClickUp task's time in status with ID "9hz".
.EXAMPLE
    PS C:\> Get-ClickUpTaskTimeInStatusBulk -TaskID "CustomTaskID 1","CustomTaskID 2","CustomTaskID 3" -CustomTaskIDs $true -TeamID 123
    Get multiple ClickUp task's time in status with custom IDs "CustomTaskID 1", "CustomTaskID 2", and "CustomTaskID 3".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-bulk-tasks'-time-in-status.html
#>
function Get-ClickUpTaskTimeInStatusBulk {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string[]]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [int]$TeamID
    )

    $QueryString = @{
        task_ids         = $TaskID
    }

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString += @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    }

    $Task = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint 'task/bulk_time_in_status/task_ids'
    Return $Task
}

<#
.SYNOPSIS
    Create a new ClickUp task.
.DESCRIPTION
    Create a new ClickUp task.
.EXAMPLE
    PS C:\> New-ClickUpTask -ListID 11111111 -Name 'This is a new task'
    Creates a new ClickUp Task called "This is a new task" under the list with ID "11111111".
.EXAMPLE
    PS C:\> New-ClickUpTask -ListID 22222222 -Name 'This is another new task' -Description "Description of the other new task" -Assignees 33333333 -Status 'Review' -Priority 1
    Creates a new ClickUp Task called "This is another new task" under the list with ID "22222222" with various other parameters.
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/create-task.html
#>
function New-ClickUpTask {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$ListID,
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [string]$Description,
        [int[]]$Assignees,
        [string[]]$Tags,
        [string]$Status,
        [int]$Priority,
        [datetime]$DueDate,
        [bool]$DueDateTime = $false,
        [int]$TimeEstimate,
        [datetime]$StartDate,
        [bool]$StartDateTime = $false,
        [bool]$NotifyAll,
        [string]$Parent,
        [string]$LinksTo,
        [bool]$CheckRequiredCustomFields,
        [hashtable[]]$CustomFields
    )

    $Body = @{
        name        = $Name
        description = $Description
    }
    if ($PSBoundParameters.ContainsKey('Assignees')) {
        $Body.Add('assignees', $Assignees)
    }
    if ($PSBoundParameters.ContainsKey('Tags')) {
        $Body.Add('tags', $Tags)
    }
    if ($PSBoundParameters.ContainsKey('Status')) {
        $Body.Add('status', $Status)
    }
    if ($PSBoundParameters.ContainsKey('Priority')) {
        $Body.Add('priority', $Priority)
    }
    if ($PSBoundParameters.ContainsKey('DueDate')) {
        $Body.Add('due_date', $DueDate)
        $Body.Add('due_date_time', $DueDateTime)
    }
    if ($PSBoundParameters.ContainsKey('TimeEstimate')) {
        $Body.Add('time_estimate', $TimeEstimate)
    }
    if ($PSBoundParameters.ContainsKey('StartDate')) {
        $Body.Add('start_date', $StartDate)
        $Body.Add('start_date_time', $StartDateTime)
    }
    if ($PSBoundParameters.ContainsKey('NotifyAll')) {
        $Body.Add('notify_all', $NotifyAll)
    }
    if ($PSBoundParameters.ContainsKey('Parent')) {
        $Body.Add('parent', $Parent)
    }
    if ($PSBoundParameters.ContainsKey('LinksTo')) {
        $Body.Add('links_to', $LinksTo)
    }
    if ($PSBoundParameters.ContainsKey('CheckRequiredCustomFields')) {
        $Body.Add('check_required_custom_fields', $CheckRequiredCustomFields)
    }
    if ($PSBoundParameters.ContainsKey('CustomFields')) {
        $Body.Add('custom_fields', $CustomFields)
    }

    Invoke-ClickUpAPIPost -Endpoint "list/$ListID/task" -Body $Body
}

<#
.SYNOPSIS
    Update a ClickUp task.
.DESCRIPTION
    Update a ClickUp task.
.EXAMPLE
    PS C:\> $Body = @{
    >> name = "Updated Task Name"
    >> description = "Updated Task Content"
    >> status = "in progress"
    >> }
    PS C:\> Set-ClickUpTask -TaskID 9hx -Body $Body
    Updated the task with ID "9hx".
.EXAMPLE
    PS C:\> $Body = @{
    >> name = "Updated Task Name"
    >> description = "Updated Task Content"
    >> status = "in progress"
    >> priority = 1
    >> time_estimate = 8640000
    >> assignees = @{
    >>     "add = @(
    >>         182
    >>     )
    >>     "rem = @(
    >>        183
    >>     )
    >> }
    >> "archived = false
    >> }
    PS C:\> Set-ClickUpTask -TaskID 9hx -Body $Body
    Updated the task with ID "9hx".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information on how to format the body.

Body format:
    @{
        name = "Updated Task Name"
        description = "Updated Task Content"
        status = "in progress"
        priority = 1
        time_estimate = 8640000
        assignees = @{
            "add = @(
                182
            )
            "rem = @(
                183
            )
        }
        "archived = false
    }
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/update-task.html
#>
function Set-ClickUpTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [hashtable]$Body,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [int]$TeamID
    )


    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $true
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    $Task = Invoke-ClickUpAPIPut -Arguments $QueryString -Endpoint "task/$TaskID/" -Body $Body
    Return $Task
}

<#
.SYNOPSIS
    Remove a ClickUp task.
.DESCRIPTION
    Remove a ClickUp task.
.EXAMPLE
    PS C:\> Remove-ClickUpTask -TaskID 9hx
    Remove the task with ID "9hx".
.EXAMPLE
    PS C:\> Remove-ClickUpTask -TaskID 'CustomTaskID' -CustomTaskIDs $True -TeamID 1111111
    Remove the task with custom ID "CustomTaskID".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for more information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/update-task.html
#>
function Remove-ClickUpTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID', SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [int]$TeamID
    )

    if ($PSCmdlet.ShouldProcess($TaskID)) {
        if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
            $QueryString = @{
                custom_task_ids = $true
                team_id         = $TeamID
            }
        } else {
            $QueryString = @{}
        }

        $Task = Invoke-ClickUpAPIDelete -Arguments $QueryString -Endpoint "task/$TaskID"
        Return $Task
    }
}