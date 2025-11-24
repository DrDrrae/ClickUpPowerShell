<#
.SYNOPSIS
    Get all ClickUp lists.
.DESCRIPTION
    Get all ClickUp lists.
.EXAMPLE
    PS C:\> Get-ClickUpLists -FolderID 456
    Get ClickUp lists under folder with ID "456".
.EXAMPLE
    PS C:\> Get-ClickUpLists -FolderID 456 -Archived $true
    Get ClickUp lists under folder with ID "456" including archived lists.
.EXAMPLE
    PS C:\> Get-ClickUpLists -SpaceID 789
    Get ClickUp lists under space with ID "789".
.EXAMPLE
    PS C:\> Get-ClickUpLists -SpaceID 789 -Archived $true
    Get ClickUp lists under space with ID "789" including archived lists.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getlists
    https://developer.clickup.com/reference/getfolderlesslists
#>
function Get-ClickUpLists {
    [CmdletBinding(DefaultParameterSetName = 'FolderID')]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [UInt64]$FolderID,
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [UInt64]$SpaceID,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$Archived = $false
    )

    $QueryString = @{
        $Archived = $Archived
    }

    if ($PSBoundParameters.ContainsKey('FolderID')) {
        $Lists = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "folder/$FolderID/list"
    } elseif ($PSBoundParameters.ContainsKey('SpaceID')) {
        $Lists = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "space/$SpaceID/list"
    }
    return $Lists.lists
}

<#
.SYNOPSIS
    Get a single ClickUp list.
.DESCRIPTION
    Get a single ClickUp list.
.EXAMPLE
    PS C:\> Get-ClickUpList -ListID 456
    Get a ClickUp list with ID "456".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getlist
#>
function Get-ClickUpList {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$ListID
    )

    $List = Invoke-ClickUpAPIGet -Endpoint "list/$ListID"
    return $List
}

<#
.SYNOPSIS
    Create a ClickUp list.
.DESCRIPTION
    Create a ClickUp list.
.EXAMPLE
    PS C:\> New-ClickUpList -FolderID 456 -Name "New ClickUp List"
    Create a ClickUp list called "New ClickUp List" under folder with ID "456".
.EXAMPLE
    PS C:\> New-ClickUpList -FolderID 456 -Name "New ClickUp List" -DueDate "12/31/2021" -Prority 2
    Create a ClickUp list called "New ClickUp List" under folder with ID "456" with a due date and priority.
.EXAMPLE
    PS C:\> New-ClickUpList -SpaceID 789 -Name "New ClickUp List"
    Create a ClickUp list called "New ClickUp List" under space with ID "789".
.EXAMPLE
    PS C:\> New-ClickUpList -SpaceID 789 -Name "New ClickUp List" -DueDate "12/31/2021" -Prority 2
    Create a ClickUp list called "New ClickUp List" under space with ID "789" with a due date and priority.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createlist
    https://developer.clickup.com/reference/createfolderlesslist
#>
function New-ClickUpList {
    [CmdletBinding(DefaultParameterSetName = 'FolderID')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [UInt64]$FolderID,
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [UInt64]$SpaceID,
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [string]$Name,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [string]$Content,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [DateTime]$DueDate,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$DueDateTime = $false,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [UInt16]$Priorty,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [UInt64]$Assignee,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [string]$Status
    )

    $Body = @{
        name = $Name
    }

    if ($PSBoundParameters.ContainsKey('Content')) {
        $Body.Add('content', $Content)
    }
    if ($PSBoundParameters.ContainsKey('DueDate')) {
        $Body.Add('due_date', $(Get-DatePosixMilliseconds -DateTime $DueDate))
    }
    if ($PSBoundParameters.ContainsKey('DueDateTime')) {
        $Body.Add('due_date_time', $DueDateTime)
    }
    if ($PSBoundParameters.ContainsKey('Priorty')) {
        $Body.Add('priority', $Priorty)
    }
    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $Body.Add('assignee', $Assignee)
    }
    if ($PSBoundParameters.ContainsKey('Status')) {
        $Body.Add('status', $Status)
    }

    if ($PSBoundParameters.ContainsKey('FolderID')) {
        $List = Invoke-ClickUpAPIPost -Endpoint "folder/$FolderID/list" -Body $Body
    } elseif ($PSBoundParameters.ContainsKey('SpaceID')) {
        $List = Invoke-ClickUpAPIPost -Endpoint "space/$SpaceID/list" -Body $Body
    }
    return $List
}

<#
.SYNOPSIS
    Update a ClickUp list.
.DESCRIPTION
    Update a ClickUp list.
.EXAMPLE
    PS C:\> Set-ClickUpList -ListID 124 -Name "New ClickUp List Name"
    Update a ClickUp list with ID "124" with new name "New ClickUp List Name".
.EXAMPLE
    PS C:\> Set-ClickUpList -ListID 124 -Name "New ClickUp List Name" -DueDate "12/31/2021" -Prority 2
    Update a ClickUp list with ID "124" with new name "New ClickUp List Name" with a due date and priority.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/updatelist
#>
function Set-ClickUpList {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ListID,
        [Parameter()]
        [string]$Name,
        [Parameter()]
        [string]$Content,
        [Parameter()]
        [DateTime]$DueDate,
        [Parameter()]
        [bool]$DueDateTime = $false,
        [Parameter()]
        [UInt16]$Priorty,
        [Parameter()]
        [UInt64]$Assignee,
        [Parameter()]
        [bool]$UnsetStatus
    )

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('Name')) {
        $Body.Add('name', $Name)
    }
    if ($PSBoundParameters.ContainsKey('Content')) {
        $Body.Add('content', $Content)
    }
    if ($PSBoundParameters.ContainsKey('DueDate')) {
        $Body.Add('due_date', $(Get-DatePosixMilliseconds -DateTime $DueDate))
    }
    if ($PSBoundParameters.ContainsKey('DueDateTime')) {
        $Body.Add('due_date_time', $DueDateTime)
    }
    if ($PSBoundParameters.ContainsKey('Priorty')) {
        $Body.Add('priority', $Priorty)
    }
    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $Body.Add('assignee', $Assignee)
    }
    if ($PSBoundParameters.ContainsKey('UnsetStatus')) {
        $Body.Add('unset_status', $UnsetStatus)
    }


}

<#
.SYNOPSIS
    Remove a ClickUp list.
.DESCRIPTION
    Remove a ClickUp list.
.EXAMPLE
    PS C:\> Remove-ClickUpList -ListID 124
    Delete a ClickUp list with ID "124".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/deletelist
#>
function Remove-ClickUpList {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$ListID
    )
    if ($PSCmdlet.ShouldProcess($ListID)) {
        $Null = Invoke-ClickUpAPIDelete -Endpoint "list/$ListID"
    }
}

<#
.SYNOPSIS
    Add a ClickUp task to a list.
.DESCRIPTION
    Add a ClickUp task to a list.
.EXAMPLE
    PS C:\> Add-ClickUpTaskToList -ListID 123 -TaskID 9hz
    Add ClickUp task with ID "9hz" to list with ID "123".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
    Note: This endpoint requires the Tasks in Multiple List ClickApp to be enabled.
.LINK
    https://developer.clickup.com/reference/addtasktolist
.LINK
    https://help.clickup.com/hc/en-us/articles/6309958824727-Tasks-in-Multiple-Lists
#>
function Add-ClickUpTaskToList {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$ListID,
        [Parameter(Mandatory = $true)]
        [string]$TaskID
    )

    $Null = Invoke-ClickUpAPIPost -Endpoint "list/$ListID/task/$TaskID"
}

<#
.SYNOPSIS
    Remove a ClickUp task from a list.
.DESCRIPTION
    Remove a ClickUp task from a list.
.EXAMPLE
    PS C:\> Remove-ClickUpTaskFromList -ListID 123 -TaskID 9hz
    Add ClickUp task with ID "9hz" to list with ID "123".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/removetaskfromlist
#>
function Remove-ClickUpTaskFromList {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$ListID,
        [Parameter(Mandatory = $true)]
        [string]$TaskID
    )

    if ($PSCmdlet.ShouldProcess($TaskID)) {
        $Null = Invoke-ClickUpAPIDelete -Endpoint "list/$ListID/task/$TaskID"
    }
}

<#
.SYNOPSIS
    Create a new list using a list template in a Folder.
.DESCRIPTION
    Create a new list using a list template in a Folder.
.EXAMPLE
    PS C:\> New-ClickUpListFromTemplate -FolderID 123 -TemplateID 9hz -Name "New List"
    Create a new list using a list template in a Folder. Publicly shared templates must be added to your Workspace before you can use them with the public API. This request runs synchronously by default with return_immediately=true. The request returns the future List ID immediatly, but the List may not be created when the response is sent. Small templates can be applied synchronously, which guarantees that all sub objects are created. In case of a timeout on synchronous requests, the objects from the template will continue to be created past the timeout.
.EXAMPLE
    PS C:\> New-ClickUpListFromTemplate -SpaceID 123 -TemplateID 9hz -Name "New List"
    Create a new list using a list template in a Space. Publicly shared templates must be added to your Workspace before you can use them with the public API. This request runs synchronously by default with return_immediately=true. The request returns the future List ID immediatly, but the List may not be created when the response is sent. Small templates can be applied synchronously, which guarantees that all sub objects are created. In case of a timeout on synchronous requests, the objects from the template will continue to be created past the timeout.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.

    Create a new list using a list template in a Folder. Publicly shared templates must be added to your Workspace before you can use them with the public API. This request runs synchronously by default with return_immediately=true. The request returns the future List ID immediatly, but the List may not be created when the response is sent. Small templates can be applied synchronously, which guarantees that all sub objects are created. In case of a timeout on synchronous requests, the objects from the template will continue to be created past the timeout.

    Create a new List using a List template within a Space. Publicly shared templates must be added to your Workspace before you can use them with the public API. This request can be run asynchronously or synchronously via the return_immediately parameter.
.LINK
    https://developer.clickup.com/reference/createfolderlistfromtemplate
.LINK
    https://developer.clickup.com/reference/createspacelistfromtemplate
.LINK
    https://help.clickup.com/hc/en-us/articles/6326023965591-Add-a-template-to-your-library
#>
function New-ClickUpListFromTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [uint64]$FolderID,
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [uint64]$SpaceID,
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [uint64]$TemplateID,
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [uint64]$Name,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$ReturnImmediately,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [string]$Content,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$TimeEstimate,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$Automation,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$IncludeViews,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$OldDueDate,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$OldStartDate,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$OldFollowers,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$CommentAttachments,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$RecurSettings,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$OldTags,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$OldStatuses,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$Subtasks,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$CustomType,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$OldAssignees,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$Attachments,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$Comment,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$OldStatus,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$ExternalDependencies,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$InternalDependencies,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$Priority,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$CustomFields,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$OldChecklists,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$Relationships,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$OldSubtaskAssignees,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [datetime]$StartDate,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [datetime]$DueDate,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$RemapStartDate,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$SkipWeekends,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [ValidateSet(1, 2, $null)]
        [int]$Archived
    )

    $Body = @{
        name               = $Name
        return_immediately = $ReturnImmediately
    }

    if ($PSBoundParameters.ContainsKey('Content')) {
        $Body.Add('content', $Content)
    }
    if ($PSBoundParameters.ContainsKey('TimeEstimate')) {
        $Body.Add('time_estimate', $TimeEstimate)
    }
    if ($PSBoundParameters.ContainsKey('Automation')) {
        $Body.Add('automation', $Automation)
    }
    if ($PSBoundParameters.ContainsKey('IncludeViews')) {
        $Body.Add('include_views', $IncludeViews)
    }
    if ($PSBoundParameters.ContainsKey('OldDueDate')) {
        $Body.Add('old_due_date', $OldDueDate)
    }
    if ($PSBoundParameters.ContainsKey('OldStartDate')) {
        $Body.Add('old_start_date', $OldStartDate)
    }
    if ($PSBoundParameters.ContainsKey('OldFollowers')) {
        $Body.Add('old_followers', $OldFollowers)
    }
    if ($PSBoundParameters.ContainsKey('CommentAttachments')) {
        $Body.Add('comment_attachments', $CommentAttachments)
    }
    if ($PSBoundParameters.ContainsKey('RecurSettings')) {
        $Body.Add('recur_settings', $RecurSettings)
    }
    if ($PSBoundParameters.ContainsKey('OldTags')) {
        $Body.Add('old_tags', $OldTags)
    }
    if ($PSBoundParameters.ContainsKey('OldStatuses')) {
        $Body.Add('old_statuses', $OldStatuses)
    }
    if ($PSBoundParameters.ContainsKey('Subtasks')) {
        $Body.Add('subtasks', $Subtasks)
    }
    if ($PSBoundParameters.ContainsKey('CustomType')) {
        $Body.Add('custom_type', $CustomType)
    }
    if ($PSBoundParameters.ContainsKey('OldAssignees')) {
        $Body.Add('old_assignees', $OldAssignees)
    }
    if ($PSBoundParameters.ContainsKey('Attachments')) {
        $Body.Add('attachments', $Attachments)
    }
    if ($PSBoundParameters.ContainsKey('Comment')) {
        $Body.Add('comment', $Comment)
    }
    if ($PSBoundParameters.ContainsKey('OldStatus')) {
        $Body.Add('old_status', $OldStatus)
    }
    if ($PSBoundParameters.ContainsKey('ExternalDependencies')) {
        $Body.Add('external_dependencies', $ExternalDependencies)
    }
    if ($PSBoundParameters.ContainsKey('InternalDependencies')) {
        $Body.Add('internal_dependencies', $InternalDependencies)
    }
    if ($PSBoundParameters.ContainsKey('Priority')) {
        $Body.Add('priority', $Priority)
    }
    if ($PSBoundParameters.ContainsKey('CustomFields')) {
        $Body.Add('custom_fields', $CustomFields)
    }
    if ($PSBoundParameters.ContainsKey('OldChecklists')) {
        $Body.Add('old_checklists', $OldChecklists)
    }
    if ($PSBoundParameters.ContainsKey('Relationships')) {
        $Body.Add('relationships', $Relationships)
    }
    if ($PSBoundParameters.ContainsKey('OldSubtaskAssignees')) {
        $Body.Add('old_subtask_assignees', $OldSubtaskAssignees)
    }
    if ($PSBoundParameters.ContainsKey('StartDate')) {
        $Body.Add('start_date', (Get-DatePosixMilliseconds -DateTime $StartDate))
    }
    if ($PSBoundParameters.ContainsKey('DueDate')) {
        $Body.Add('due_date', (Get-DatePosixMilliseconds -DateTime $DueDate))
    }
    if ($PSBoundParameters.ContainsKey('RemapStartDate')) {
        $Body.Add('remap_start_date', $RemapStartDate)
    }
    if ($PSBoundParameters.ContainsKey('SkipWeekends')) {
        $Body.Add('skip_weekends', $SkipWeekends)
    }
    if ($PSBoundParameters.ContainsKey('Archived')) {
        $Body.Add('archived', $Archived)
    }

    if ($PSBoundParameters.ContainsKey('FolderID')) {
        $NewList = Invoke-ClickUpAPIPost -Endpoint "folder/$FolderID/list_template/$TemplateID" -Body $Body
    }
    if ($PSBoundParameters.ContainsKey('SpaceID')) {
        $NewList = Invoke-ClickUpAPIPost -Endpoint "space/$SpaceID/list_template/$TemplateID" -Body $Body
    }
    return $NewList
}