<#
.SYNOPSIS
    Get all ClickUp lists.
.DESCRIPTION
    Get all ClickUp lists. Can accept FolderID or SpaceID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Get-ClickUpLists -FolderID 456
    Gets ClickUp lists under folder with ID "456".
.EXAMPLE
    PS C:\> Get-ClickUpLists -FolderID 456 -Archived $true
    Gets ClickUp lists under folder with ID "456" including archived lists.
.EXAMPLE
    PS C:\> Get-ClickUpLists -SpaceID 789
    Gets ClickUp lists under space with ID "789".
.EXAMPLE
    PS C:\> Get-ClickUpLists -SpaceID 789 -Archived $true
    Gets ClickUp lists under space with ID "789" including archived lists.
.EXAMPLE
    PS C:\> Get-ClickUpFolder -FolderID 456 | Get-ClickUpLists
    Gets lists by piping folder ID from Get-ClickUpFolder.
.INPUTS
    System.UInt64. FolderID or SpaceID via pipeline by property name.
.OUTPUTS
    System.Object
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getlists
.LINK
    https://developer.clickup.com/reference/getfolderlesslists
#>
function Get-ClickUpLists {
    [CmdletBinding(DefaultParameterSetName = 'FolderID')]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID', ValueFromPipelineByPropertyName = $true)]
        [Alias('folder_id', 'id')]
        [uint64]$FolderID,
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID', ValueFromPipelineByPropertyName = $true)]
        [Alias('space_id', 'id')]
        [uint64]$SpaceID,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$Archived = $false
    )

    Write-Verbose 'Entering Get-ClickUpLists'
    $QueryString = @{
        $Archived = $Archived
    }

    try {
        if ($PSBoundParameters.ContainsKey('FolderID')) {
            Write-Verbose "Getting lists for folder ID: $FolderID"
            $Lists = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "folder/$FolderID/list"
        } elseif ($PSBoundParameters.ContainsKey('SpaceID')) {
            Write-Verbose "Getting lists for space ID: $SpaceID"
            $Lists = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "space/$SpaceID/list"
        }
        Write-Verbose 'Successfully retrieved lists'
        return $Lists.lists
    } catch {
        Write-Error "Error in Get-ClickUpLists: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Get a single ClickUp list.
.DESCRIPTION
    Get a single ClickUp list. Can accept ListID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Get-ClickUpList -ListID 456
    Gets a ClickUp list with ID "456".
.EXAMPLE
    PS C:\> Get-ClickUpLists -FolderID 456 | Get-ClickUpList
    Gets list details by piping list ID from Get-ClickUpLists.
.INPUTS
    System.UInt64. ListID via pipeline by property name.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('list_id', 'id')]
        [uint64]$ListID
    )

    Write-Verbose 'Entering Get-ClickUpList'
    try {
        Write-Verbose "Getting list with ID: $ListID"
        $List = Invoke-ClickUpAPIGet -Endpoint "list/$ListID"
        Write-Verbose 'Successfully retrieved list'
        return $List
    } catch {
        Write-Error "Error in Get-ClickUpList: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Create a ClickUp list.
.DESCRIPTION
    Create a ClickUp list. Can accept FolderID or SpaceID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> New-ClickUpList -FolderID 456 -Name "New ClickUp List"
    Creates a ClickUp list called "New ClickUp List" under folder with ID "456".
.EXAMPLE
    PS C:\> New-ClickUpList -FolderID 456 -Name "New ClickUp List" -DueDate "12/31/2021" -Priority 2
    Creates a ClickUp list called "New ClickUp List" under folder with ID "456" with a due date and priority.
.EXAMPLE
    PS C:\> New-ClickUpList -SpaceID 789 -Name "New ClickUp List"
    Creates a ClickUp list called "New ClickUp List" under space with ID "789".
.EXAMPLE
    PS C:\> New-ClickUpList -SpaceID 789 -Name "New ClickUp List" -DueDate "12/31/2021" -Priority 2
    Creates a ClickUp list called "New ClickUp List" under space with ID "789" with a due date and priority.
.EXAMPLE
    PS C:\> Get-ClickUpFolder -FolderID 456 | New-ClickUpList -Name "New List from Pipeline"
    Creates list by piping folder ID from Get-ClickUpFolder.
.INPUTS
    System.UInt64. FolderID or SpaceID via pipeline by property name.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createlist
.LINK
    https://developer.clickup.com/reference/createfolderlesslist
#>
function New-ClickUpList {
    [CmdletBinding(DefaultParameterSetName = 'FolderID')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID', ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('folder_id', 'id')]
        [uint64]$FolderID,
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID', ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('space_id', 'id')]
        [uint64]$SpaceID,
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [ValidateNotNullOrEmpty()]
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
        [UInt16]$Priority,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [uint64]$Assignee,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [string]$Status
    )

    Write-Verbose 'Entering New-ClickUpList'
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
    if ($PSBoundParameters.ContainsKey('Priority')) {
        $Body.Add('priority', $Priority)
    }
    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $Body.Add('assignee', $Assignee)
    }
    if ($PSBoundParameters.ContainsKey('Status')) {
        $Body.Add('status', $Status)
    }

    try {
        if ($PSBoundParameters.ContainsKey('FolderID')) {
            Write-Verbose "Creating list '$Name' in folder ID: $FolderID"
            $List = Invoke-ClickUpAPIPost -Endpoint "folder/$FolderID/list" -Body $Body
        } elseif ($PSBoundParameters.ContainsKey('SpaceID')) {
            Write-Verbose "Creating list '$Name' in space ID: $SpaceID"
            $List = Invoke-ClickUpAPIPost -Endpoint "space/$SpaceID/list" -Body $Body
        }
        Write-Verbose 'Successfully created list'
        return $List
    } catch {
        Write-Error "Error in New-ClickUpList: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Update a ClickUp list.
.DESCRIPTION
    Update a ClickUp list. Can accept ListID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Set-ClickUpList -ListID 124 -Name "New ClickUp List Name"
    Updates a ClickUp list with ID "124" with new name "New ClickUp List Name".
.EXAMPLE
    PS C:\> Set-ClickUpList -ListID 124 -Name "New ClickUp List Name" -DueDate "12/31/2021" -Priority 2
    Updates a ClickUp list with ID "124" with new name "New ClickUp List Name" with a due date and priority.
.EXAMPLE
    PS C:\> Get-ClickUpList -ListID 124 | Set-ClickUpList -Name "Updated Name"
    Updates list by piping list ID from Get-ClickUpList.
.INPUTS
    System.String. ListID via pipeline by property name.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('list_id', 'id')]
        [string]$ListID,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Content,
        [Parameter()]
        [DateTime]$DueDate,
        [Parameter()]
        [bool]$DueDateTime = $false,
        [Parameter()]
        [ValidateRange(1, 4)]
        [UInt16]$Priority,
        [Parameter()]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$Assignee,
        [Parameter()]
        [bool]$UnsetStatus
    )

    Write-Verbose 'Entering Set-ClickUpList'
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
    if ($PSBoundParameters.ContainsKey('Priority')) {
        $Body.Add('priority', $Priority)
    }
    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $Body.Add('assignee', $Assignee)
    }
    if ($PSBoundParameters.ContainsKey('UnsetStatus')) {
        $Body.Add('unset_status', $UnsetStatus)
    }

    try {
        Write-Verbose "Updating list with ID: $ListID"
        $List = Invoke-ClickUpAPIPut -Endpoint "list/$ListID" -Body $Body
        Write-Verbose 'Successfully updated list'
        return $List
    } catch {
        Write-Error "Error in Set-ClickUpList: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Remove a ClickUp list.
.DESCRIPTION
    Remove a ClickUp list. Can accept ListID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Remove-ClickUpList -ListID 124
    Removes a ClickUp list with ID "124".
.EXAMPLE
    PS C:\> Get-ClickUpList -ListID 124 | Remove-ClickUpList
    Removes list by piping list ID from Get-ClickUpList.
.INPUTS
    System.UInt64. ListID via pipeline by property name.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('list_id', 'id')]
        [uint64]$ListID
    )
    Write-Verbose 'Entering Remove-ClickUpList'
    try {
        if ($PSCmdlet.ShouldProcess($ListID, 'Remove ClickUp List')) {
            Write-Verbose "Removing list with ID: $ListID"
            $Null = Invoke-ClickUpAPIDelete -Endpoint "list/$ListID"
            Write-Verbose 'Successfully removed list'
        }
    } catch {
        Write-Error "Error in Remove-ClickUpList: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Add a ClickUp task to a list.
.DESCRIPTION
    Add a ClickUp task to a list. Can accept ListID and TaskID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Add-ClickUpTaskToList -ListID 123 -TaskID 9hz
    Adds ClickUp task with ID "9hz" to list with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpList -ListID 123 | Add-ClickUpTaskToList -TaskID 9hz
    Adds task to list by piping list ID from Get-ClickUpList.
.INPUTS
    System.UInt64. ListID via pipeline by property name. System.String. TaskID via pipeline by property name.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('list_id', 'id')]
        [uint64]$ListID,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('task_id')]
        [string]$TaskID
    )

    Write-Verbose 'Entering Add-ClickUpTaskToList'
    try {
        Write-Verbose "Adding task $TaskID to list $ListID"
        $Null = Invoke-ClickUpAPIPost -Endpoint "list/$ListID/task/$TaskID"
        Write-Verbose 'Successfully added task to list'
    } catch {
        Write-Error "Error in Add-ClickUpTaskToList: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Remove a ClickUp task from a list.
.DESCRIPTION
    Remove a ClickUp task from a list. Can accept ListID and TaskID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Remove-ClickUpTaskFromList -ListID 123 -TaskID 9hz
    Removes ClickUp task with ID "9hz" from list with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpList -ListID 123 | Remove-ClickUpTaskFromList -TaskID 9hz
    Removes task from list by piping list ID from Get-ClickUpList.
.INPUTS
    System.UInt64. ListID via pipeline by property name. System.String. TaskID via pipeline by property name.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('list_id', 'id')]
        [uint64]$ListID,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('task_id')]
        [string]$TaskID
    )

    Write-Verbose 'Entering Remove-ClickUpTaskFromList'
    try {
        if ($PSCmdlet.ShouldProcess("Task: $TaskID, List: $ListID", 'Remove Task from List')) {
            Write-Verbose "Removing task $TaskID from list $ListID"
            $Null = Invoke-ClickUpAPIDelete -Endpoint "list/$ListID/task/$TaskID"
            Write-Verbose 'Successfully removed task from list'
        }
    } catch {
        Write-Error "Error in Remove-ClickUpTaskFromList: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Create a new list using a list template in a Folder.
.DESCRIPTION
    Create a new list using a list template in a Folder or Space. Can accept FolderID or SpaceID via pipeline input for integration with other cmdlets. Publicly shared templates must be added to your Workspace before you can use them with the public API.
.EXAMPLE
    PS C:\> New-ClickUpListFromTemplate -FolderID 123 -TemplateID 9hz -Name "New List"
    Creates a new list using a list template in a Folder. The request runs synchronously by default. Small templates can be applied synchronously, guaranteeing all sub objects are created.
.EXAMPLE
    PS C:\> New-ClickUpListFromTemplate -SpaceID 123 -TemplateID 9hz -Name "New List"
    Creates a new list using a list template in a Space. The request can be run asynchronously or synchronously via the return_immediately parameter.
.EXAMPLE
    PS C:\> Get-ClickUpFolder -FolderID 123 | New-ClickUpListFromTemplate -TemplateID 9hz -Name "New List from Template"
    Creates list from template by piping folder ID from Get-ClickUpFolder.
.INPUTS
    System.UInt64. FolderID or SpaceID via pipeline by property name.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
    Publicly shared templates must be added to your Workspace before you can use them with the public API.
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
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID', ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('folder_id', 'id')]
        [uint64]$FolderID,
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID', ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('space_id', 'id')]
        [uint64]$SpaceID,
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$TemplateID,
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$ReturnImmediately,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [ValidateNotNullOrEmpty()]
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

    Write-Verbose 'Entering New-ClickUpListFromTemplate'
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

    try {
        if ($PSBoundParameters.ContainsKey('FolderID')) {
            Write-Verbose "Creating list from template $TemplateID in folder $FolderID"
            $NewList = Invoke-ClickUpAPIPost -Endpoint "folder/$FolderID/list_template/$TemplateID" -Body $Body
        }
        if ($PSBoundParameters.ContainsKey('SpaceID')) {
            Write-Verbose "Creating list from template $TemplateID in space $SpaceID"
            $NewList = Invoke-ClickUpAPIPost -Endpoint "space/$SpaceID/list_template/$TemplateID" -Body $Body
        }
        Write-Verbose 'Successfully created list from template'
        return $NewList
    } catch {
        Write-Error "Error in New-ClickUpListFromTemplate: $($_.Exception.Message)"
        throw $_
    }
}