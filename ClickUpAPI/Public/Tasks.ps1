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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/gettasks
.LINK
    https://developer.clickup.com/reference/getfilteredteamtasks
#>
function Get-ClickUpTasks {
    [CmdletBinding(DefaultParameterSetName = 'ListID')]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'ListID')]
        [string]$ListID,

        [Parameter(Mandatory = $true, ParameterSetName = 'TeamID')]
        [string]$TeamID,

        [Parameter(ParameterSetName = 'ListID')]
        [bool]$Archived = $false,

        [Parameter(ParameterSetName = 'ListID')]
        [Parameter(ParameterSetName = 'TeamID')]
        [uint64]$Page = 0,

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
        [uint64[]]$SpaceIDs,

        [Parameter(ParameterSetName = 'TeamID')]
        [uint64[]]$ProjectIDs,

        [Parameter(ParameterSetName = 'TeamID')]
        [uint64[]]$ListIDs,

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

    Write-Verbose 'Entering Get-ClickUpTasks'
    try {
        if ($PSBoundParameters.ContainsKey('ListID')) {
            Write-Verbose "Getting tasks for list ID: $ListID"
            $Tasks = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "list/$ListID/task"
        } elseif ($PSBoundParameters.ContainsKey('TeamID')) {
            Write-Verbose "Getting tasks for team ID: $TeamID"
            $Tasks = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "team/$TeamID/task"
        }
        Write-Verbose 'Successfully retrieved tasks'
        return $Tasks.tasks
    } catch {
        Write-Error "Error in Get-ClickUpTasks: $($_.Exception.Message)"
        throw $_
    }
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/gettask
#>
function Get-ClickUpTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [uint64]$TeamID,
        [Parameter(ParameterSetName = 'TaskID')]
        [Parameter(ParameterSetName = 'CustomTaskIDs')]
        $IncludeSubtasks = $false
    )

    $QueryString = @{
        include_subtasks = $IncludeSubtasks
    }

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString += @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    }

    Write-Verbose 'Entering Get-ClickUpTask'
    try {
        Write-Verbose "Getting task with ID: $TaskID"
        $Task = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "task/$TaskID"
        Write-Verbose 'Successfully retrieved task'
        return $Task
    } catch {
        Write-Error "Error in Get-ClickUpTask: $($_.Exception.Message)"
        throw $_
    }
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/gettaskstimeinstatus
#>
function Get-ClickUpTaskTimeInStatus {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [uint64]$TeamID,
        [Parameter(ParameterSetName = 'TaskID')]
        [Parameter(ParameterSetName = 'CustomTaskIDs')]
        $IncludeSubtasks = $false
    )

    $QueryString = @{
        include_subtasks = $IncludeSubtasks
    }

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString += @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    }

    Write-Verbose 'Entering Get-ClickUpTaskTimeInStatus'
    try {
        Write-Verbose "Getting time in status for task ID: $TaskID"
        $Task = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "task/$TaskID/time_in_status"
        Write-Verbose 'Successfully retrieved task time in status'
        return $Task
    } catch {
        Write-Error "Error in Get-ClickUpTaskTimeInStatus: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Get a ClickUp bulk task's time in status.
.DESCRIPTION
    View how long two or more tasks have been in each status. The Total time in Status ClickApp must first be enabled by the Workspace owner or an admin.
.EXAMPLE
    PS C:\> Get-ClickUpTaskTimeInStatusBulk -TaskID 9hz,3cuh,g4fs
    Get a ClickUp task's time in status with ID "9hz".
.EXAMPLE
    PS C:\> Get-ClickUpTaskTimeInStatusBulk -TaskID "CustomTaskID 1","CustomTaskID 2","CustomTaskID 3" -CustomTaskIDs $true -TeamID 123
    Get multiple ClickUp task's time in status with custom IDs "CustomTaskID 1", "CustomTaskID 2", and "CustomTaskID 3".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getbulktaskstimeinstatus
#>
function Get-ClickUpTaskTimeInStatusBulk {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string[]]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [uint64]$TeamID
    )

    $QueryString = @{
        task_ids = $TaskID
    }

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString += @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    }

    Write-Verbose 'Entering Get-ClickUpTaskTimeInStatusBulk'
    try {
        Write-Verbose "Getting bulk time in status for task IDs: $($TaskID -join ', ')"
        $Task = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint 'task/bulk_time_in_status/task_ids'
        Write-Verbose 'Successfully retrieved bulk task time in status'
        return $Task
    } catch {
        Write-Error "Error in Get-ClickUpTaskTimeInStatusBulk: $($_.Exception.Message)"
        throw $_
    }
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createtask
#>
function New-ClickUpTask {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [uint64]$ListID,
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [string]$Description,
        [uint64[]]$Assignees,
        [string[]]$Tags,
        [string]$Status,
        [uint64]$Priority,
        [datetime]$DueDate,
        [bool]$DueDateTime = $false,
        [uint64]$TimeEstimate,
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

    Write-Verbose 'Entering New-ClickUpTask'
    try {
        Write-Verbose "Creating new task '$Name' in list ID: $ListID"
        $Task = Invoke-ClickUpAPIPost -Endpoint "list/$ListID/task" -Body $Body
        Write-Verbose 'Successfully created task'
        return $Task
    } catch {
        Write-Error "Error in New-ClickUpTask: $($_.Exception.Message)"
        throw $_
    }
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
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
    https://developer.clickup.com/reference/updatetask
#>
function Set-ClickUpTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Object])]
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
        [uint64]$TeamID
    )


    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $true
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    Write-Verbose 'Entering Set-ClickUpTask'
    try {
        Write-Verbose "Updating task with ID: $TaskID"
        $Task = Invoke-ClickUpAPIPut -Arguments $QueryString -Endpoint "task/$TaskID/" -Body $Body
        Write-Verbose 'Successfully updated task'
        return $Task
    } catch {
        Write-Error "Error in Set-ClickUpTask: $($_.Exception.Message)"
        throw $_
    }
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for more information.
.LINK
    https://developer.clickup.com/reference/deletetask
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
        [uint64]$TeamID
    )

    Write-Verbose 'Entering Remove-ClickUpTask'
    if ($PSCmdlet.ShouldProcess($TaskID)) {
        if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
            $QueryString = @{
                custom_task_ids = $true
                team_id         = $TeamID
            }
        } else {
            $QueryString = @{}
        }

        try {
            Write-Verbose "Removing task with ID: $TaskID"
            $Null = Invoke-ClickUpAPIDelete -Arguments $QueryString -Endpoint "task/$TaskID"
            Write-Verbose 'Successfully removed task'
        } catch {
            Write-Error "Error in Remove-ClickUpTask: $($_.Exception.Message)"
            throw $_
        }
    }
}

<#
.SYNOPSIS
    Merge ClickUp tasks.
.DESCRIPTION
    Merge multiple ClickUp tasks into a single task. The source tasks will be merged into the target task.
.EXAMPLE
    PS C:\> Merge-ClickUpTasks -TaskID '9hz' -SourceTaskIDs '3cuh','g4fs'
    Merges tasks with IDs "3cuh" and "g4fs" into the task with ID "9hz".
.EXAMPLE
    PS C:\> Merge-ClickUpTasks -TaskID 'abc123' -SourceTaskIDs 'def456','ghi789','jkl012'
    Merges three source tasks into the target task with ID "abc123".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/mergetasks
#>
function Merge-ClickUpTasks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$TaskID,
        [Parameter(Mandatory = $true)]
        [string[]]$SourceTaskIDs
    )

    $Body = @{
        source_task_ids = $SourceTaskIDs
    }

    Write-Verbose 'Entering Merge-ClickUpTasks'
    try {
        Write-Verbose "Merging tasks $($SourceTaskIDs -join ', ') into task ID: $TaskID"
        $Null = Invoke-ClickUpAPIPost -Endpoint "task/$TaskID/merge" -Body $Body
        Write-Verbose 'Successfully merged tasks'
    } catch {
        Write-Error "Error in Merge-ClickUpTasks: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Create Task From Template
.DESCRIPTION
    Create a new task using a task template defined in your workspace. Publicly shared templates must be added to your Workspace before you can use them with the public API.
.EXAMPLE
    PS C:\> New-ClickUpTaskFromTemplate -ListID 11111111 -TemplateID 'abc123' -Name 'Task from template'
    Creates a new ClickUp Task called "Task from template" using the template with ID "abc123" under the list with ID "11111111".
.EXAMPLE
    PS C:\> New-ClickUpTaskFromTemplate -ListID 22222222 -TemplateID 'def456' -Name 'Another task from template'
    Creates a new ClickUp Task called "Another task from template" using the template with ID "def456" under the list with ID "22222222".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createtaskfromtemplate
#>
function New-ClickUpTaskFromTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ulong]$ListID,
        [Parameter(Mandatory = $true)]
        [string]$TemplateID,
        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    $Body = @{
        name = $Name
    }

    Write-Verbose 'Entering New-ClickUpTaskFromTemplate'
    try {
        Write-Verbose "Creating task '$Name' from template ID: $TemplateID in list ID: $ListID"
        $Null = Invoke-ClickUpAPIPost -Endpoint "list/$ListID/taskTemplate/$TemplateID" -Body $Body
        Write-Verbose 'Successfully created task from template'
    } catch {
        Write-Error "Error in New-ClickUpTaskFromTemplate: $($_.Exception.Message)"
        throw $_
    }
}
