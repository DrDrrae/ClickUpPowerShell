<#
.SYNOPSIS
    Get all ClickUp tasks under a particular list.
.DESCRIPTION
    Get all ClickUp tasks under a particular list.
.PARAMETER ListID
    ClickUp list ID.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER Archived
    If set to true, will return archived ClickUp tasks in addition to non-archived tasks.
.PARAMETER Page
    The page number to return.
.PARAMETER OrderBy
    The property of the task to order the returned results by.
.PARAMETER Reverse
    Set to true to order the list in reverse order.
.PARAMETER Subtasks
    Set to true to return subtasks.
.PARAMETER SpaceIDs
    Array of ClickUp space IDs to return the tasks of.
.PARAMETER ProjectIDs
    Array of ClickUp project IDs to return the tasks of.
.PARAMETER ListIDs
    Array of ClickUp list IDs to return the tasks of.
.PARAMETER Statuses
    Array of the statuses to return the tasks of.
.PARAMETER IncludeClosed
    Set to true to return closed tasks in addition to open tasks.
.PARAMETER Assignees
    Return tasks which are assigned to an array of ClickUp team member IDs.
.PARAMETER DueDateGreaterThan
    Return tasks with due date greater than this date and time.
.PARAMETER DueDateLessThan
    Return tasks with due date less than this date and time.
.PARAMETER DateCreatedGreaterThan
    Return tasks with date created greater than this date and time.
.PARAMETER DateCreatedLessThan
    Return tasks with date created less than this date and time.
.PARAMETER DateUpdatedGreaterThan
    Return tasks with date updated greater than this date and time.
.PARAMETER DateUpdatedLessThan
    Return tasks with date updated less than this date and time.
.PARAMETER CustomFields
    Return tasks with these custom fields.
.PARAMETER CustomTaskIDs
    If you want to reference a task by its custom task ID, this value must be true
.EXAMPLE
    PS C:\> Get-ClickUpTasks -ListID 11111111
    Get all ClickUp task under List with ID "11111111".
.EXAMPLE
    PS C:\> Get-ClickUpTasks -ListID 22222222 -Archived $true -Page 1 -OrderBy 'updated' -Statuses 'New','In Progress'
    Get all ClickUp task under List with ID "22222222" and various other options.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-tasks.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-legacy/get-filtered-team-tasks.html
#>
function Get-ClickUpTasks {
    [CmdletBinding(DefaultParameterSetName = 'ListID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'ListID', HelpMessage = 'ClickUp list ID.')]
        [string]$ListID,

        [Parameter(Mandatory = $true, ParameterSetName = 'TeamID', HelpMessage = 'ClickUp team ID.')]
        [string]$TeamID,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'If set to true, will return archived ClickUp tasks in addition to non-archived tasks.')]
        [bool]$Archived = $false,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'The page number to return.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'The page number to return.')]
        [UInt32]$Page = 0,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'The property of the task to order the returned results by.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'The property of the task to order the returned results by.')]
        [ValidateSet('id', 'created', 'updated', 'due_date')]
        [string]$OrderBy = 'created',

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'Set to true to order the list in reverse order.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Set to true to order the list in reverse order.')]
        [bool]$Reverse = $false,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'Set to true to return subtasks.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Set to true to return subtasks.')]
        [bool]$Subtasks = $false,

        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Array of ClickUp space IDs to return the tasks of.')]
        [int[]]$SpaceIDs,

        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Array of ClickUp space IDs to return the tasks of.')]
        [int[]]$ProjectIDs,

        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Array of ClickUp list IDs to return the tasks of.')]
        [int[]]$ListIDs,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'Array of the statuses to return the tasks of.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Array of the statuses to return the tasks of.')]
        [string[]]$Statuses,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'Set to true to return closed tasks in addition to open tasks.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Set to true to return closed tasks in addition to open tasks.')]
        [bool]$IncludeClosed = $false,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'Return tasks which are assigned to an array of ClickUp team member IDs.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Return tasks which are assigned to an array of ClickUp team member IDs.')]
        [string[]]$Assignees,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'Return tasks with due date greater than this date and time.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Return tasks with due date greater than this date and time.')]
        [datetime]$DueDateGreaterThan,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'Return tasks with due date less than this date and time.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Return tasks with due date less than this date and time.')]
        [datetime]$DueDateLessThan,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'Return tasks with date created greater than this date and time.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Return tasks with date created greater than this date and time.')]
        [datetime]$DateCreatedGreaterThan,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'Return tasks with date created less than this date and time.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Return tasks with date created less than this date and time.')]
        [datetime]$DateCreatedLessThan,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'Return tasks with date updated greater than this date and time.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Return tasks with date updated greater than this date and time.')]
        [datetime]$DateUpdatedGreaterThan,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'Return tasks with date updated less than this date and time.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Return tasks with date updated less than this date and time.')]
        [datetime]$DateUpdatedLessThan,

        [Parameter(ParameterSetName = 'ListID', HelpMessage = 'Return tasks with these custom fields.')]
        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'Return tasks with these custom fields.')]
        [array]$CustomFields,

        [Parameter(ParameterSetName = 'TeamID', HelpMessage = 'If you want to reference a task by its custom task ID, this value must be true')]
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
.PARAMETER TaskID
    ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to true.
.PARAMETER IncludeSubtasks
    Set to true to include sub-tasks.
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID 9hz
    Get a ClickUp task under List with ID "11111111".
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID 9hz -CustomTaskIDs $true -TeamID 123
    Get a ClickUp task under List with ID "22222222" and various other options.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-task.html
#>
function Get-ClickUpTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Custom ClickUp task ID.')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to $true.')]
        [UInt32]$TeamID,
        [Parameter(ParameterSetName = 'TaskID', HelpMessage = 'Set to true to include sub-tasks.')]
        [Parameter(ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Set to true to include sub-tasks.')]
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

    $Task = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "task/$TaskID"
    Return $Task
}

<#
.SYNOPSIS
    Get a ClickUp task's time in status.
.DESCRIPTION
    Get a ClickUp task's time in status.
.PARAMETER TaskID
    ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to true.
.PARAMETER IncludeSubtasks
    Set to true to include sub-tasks.
.EXAMPLE
    PS C:\> Get-ClickUpTaskTimeInStatus -TaskID 9hz
    Get a ClickUp task's time in status with ID "9hz".
.EXAMPLE
    PS C:\> Get-ClickUpTaskTimeInStatus -TaskID "CustomTaskID" -CustomTaskIDs $true -TeamID 123
    Get a ClickUp task's time in status with custom ID "CustomTaskID".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-task's-time-in-status.html
#>
function Get-ClickUpTaskTimeInStatus {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Custom ClickUp task ID.')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to $true.')]
        [UInt32]$TeamID,
        [Parameter(ParameterSetName = 'TaskID', HelpMessage = 'Set to true to include sub-tasks.')]
        [Parameter(ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Set to true to include sub-tasks.')]
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
.PARAMETER TaskID
    ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to true.
.EXAMPLE
    PS C:\> Get-ClickUpTaskTimeInStatusBulk -TaskID 9hz,3cuh,g4fs
    Get a ClickUp task's time in status with ID "9hz".
.EXAMPLE
    PS C:\> Get-ClickUpTaskTimeInStatusBulk -TaskID "CustomTaskID 1","CustomTaskID 2","CustomTaskID 3" -CustomTaskIDs $true -TeamID 123
    Get multiple ClickUp task's time in status with custom IDs "CustomTaskID 1", "CustomTaskID 2", and "CustomTaskID 3".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-bulk-tasks'-time-in-status.html
#>
function Get-ClickUpTaskTimeInStatusBulk {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Custom ClickUp task ID.')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to $true.')]
        [UInt32]$TeamID
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

    $Task = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint 'task/bulk_time_in_status/task_ids'
    Return $Task
}

<#
.SYNOPSIS
    Create a new ClickUp task.
.DESCRIPTION
    Create a new ClickUp task.
.PARAMETER ListID
    ClickUp list ID.
.PARAMETER Name
    Name of the new ClickUp task.
.PARAMETER Description
    Description of the new ClickUp task.
.PARAMETER Assignees
    ClickUp member IDs of the users to be assigned to the new ClickUp task.
.PARAMETER Tags
    Tags to add to the new ClickUp task.
.PARAMETER Status
    Status to set to the new ClickUp task.
.PARAMETER Priority
    Priority to set to the new ClickUp task.
.PARAMETER DueDate
    Due date to set to the new ClickUp task.
.PARAMETER DueDateTime
    Set to true to include a time for the due date instead of just a date.
.PARAMETER TimeEstimate
    The time estimate in minutes.
.PARAMETER StartDate
    Start date to set to the new ClickUp task.
.PARAMETER StartDateTime
    Set to true to include a time for the start date instead of just a date.
.PARAMETER NotifyAll
    If set to true, creation notifications will be sent to everyone including the creator of the task.
.PARAMETER Parent
    ClickUp task ID to set as the parent of the new ClickUp task.
.PARAMETER LinksTo
    A ClickUp task ID to create a linked dependency on the new task.
.PARAMETER CheckRequiredCustomFields
    If required custom fields are checked when creating the new ClickUp task.
.PARAMETER CustomFields
    A hashtable array containing the custom fields and their properties to set.
.EXAMPLE
    PS C:\> New-ClickUpTask -ListID 11111111 -Name 'This is a new task'
    Creates a new ClickUp Task called "This is a new task" under the list with ID "11111111".
.EXAMPLE
    PS C:\> New-ClickUpTask -ListID 22222222 -Name 'This is another new task' -Description "Description of the other new task" -Assignees 33333333 -Status 'Review' -Priority 1
    Creates a new ClickUp Task called "This is another new task" under the list with ID "22222222" with various other parameters.
.EXAMPLE
    PS C:\> $CustomFields = @(
    >> @{
    >> id = "0a52c486-5f05-403b-b4fd-c512ff05131c"
    >> value = 23
    >> },
    >> @{
    >> id = "03efda77-c7a0-42d3-8afd-fd546353c2f5"
    >> value = "Text field input"
    >> }
    >> )
    PS C:\> New-ClickUpTask -ListID 11111111 -Name 'This is a new task' -CheckRequiredCustomFields $true -CustomFields $CustomFields
    Creates a new ClickUp Task called "This is a new task" under the list with ID "11111111" with two custom fields set.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/create-task.html
#>
function New-ClickUpTask {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp list ID.')]
        [UInt32]$ListID,
        [Parameter(Mandatory = $true, HelpMessage = 'Name of the new ClickUp task.')]
        [string]$Name,
        [Parameter(HelpMessage = 'Description of the new ClickUp task.')]
        [string]$Description,
        [Parameter(HelpMessage = 'ClickUp member IDs of the users to be assigned to the new ClickUp task.')]
        [int[]]$Assignees,
        [Parameter(HelpMessage = 'Tags to add to the new ClickUp task.')]
        [string[]]$Tags,
        [Parameter(HelpMessage = 'Status to set to the new ClickUp task.')]
        [string]$Status,
        [Parameter(HelpMessage = 'Priority to set to the new ClickUp task.')]
        [UInt32]$Priority,
        [Parameter(HelpMessage = 'Due date to set to the new ClickUp task.')]
        [datetime]$DueDate,
        [Parameter(HelpMessage = 'Set to true to include a time for the due date instead of just a date.')]
        [bool]$DueDateTime = $false,
        [Parameter(HelpMessage = 'The time estimate in minutes.')]
        [UInt32]$TimeEstimate,
        [Parameter(HelpMessage = 'Start date to set to the new ClickUp task.')]
        [datetime]$StartDate,
        [Parameter(HelpMessage = 'Set to true to include a time for the start date instead of just a date.')]
        [bool]$StartDateTime = $false,
        [Parameter(HelpMessage = 'If set to true, creation notifications will be sent to everyone including the creator of the task.')]
        [bool]$NotifyAll,
        [Parameter(HelpMessage = 'ClickUp task ID to set as the parent of the new ClickUp task.')]
        [string]$Parent,
        [Parameter(HelpMessage = 'A ClickUp task ID to create a linked dependency on the new task.')]
        [string]$LinksTo,
        [Parameter(HelpMessage = 'If required custom fields are checked when creating the new ClickUp task.')]
        [bool]$CheckRequiredCustomFields,
        [Parameter(HelpMessage = 'A hashtable array containing the custom fields and their properties to set.')]
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
        $T = New-TimeSpan -Minutes $TimeEstimate
        $Body.Add('time_estimate', $T.TotalMilliseconds)
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
.PARAMETER TaskID
    The ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER Body
    A hashtable containing the properties of the task ID to update.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to true.
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
    System.Management.Automation.PSCustomObject
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
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'The ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'The custom ClickUp task ID.')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'A hashtable containing the properties of the task ID to update.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'A hashtable containing the properties of the task ID to update.')]
        [hashtable]$Body,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to true.')]
        [UInt32]$TeamID
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
.PARAMETER TaskID
    The ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to true.
.EXAMPLE
    PS C:\> Remove-ClickUpTask -TaskID 9hx
    Remove the task with ID "9hx".
.EXAMPLE
    PS C:\> Remove-ClickUpTask -TaskID 'CustomTaskID' -CustomTaskIDs $True -TeamID 1111111
    Remove the task with custom ID "CustomTaskID".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for more information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/update-task.html
#>
function Remove-ClickUpTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID', SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'The ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'The custom ClickUp task ID.')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to true.')]
        [UInt32]$TeamID
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