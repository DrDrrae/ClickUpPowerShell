<#
.SYNOPSIS
    Get all ClickUp Folders.
.DESCRIPTION
    Get all ClickUp Folders.
.EXAMPLE
    PS C:\> Get-ClickUpFolders -SpaceID 11111111
    Get all ClickUp folders under ClickUp Space with ID "11111111".
.EXAMPLE
    PS C:\> Get-ClickUpFolders -SpaceID 11111111 -Archived $true
    Get all ClickUp folders under ClickUp Space with ID "11111111" including archived.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getfolders
#>
function Get-ClickUpFolders {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ulong]$SpaceID,
        [Parameter()]
        [bool]$Archived = $false
    )

    $QueryString = @{
        $Archived = $Archived
    }

    $Folders = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "space/$SpaceID/folder"
    return $Folders.folders
}

<#
.SYNOPSIS
    Get properties on a particular ClickUp folder.
.DESCRIPTION
    Get properties on a particular ClickUp folder.
.EXAMPLE
    PS C:\> Get-ClickUpFolder -FolderID 11111111
    Get ClickUp folder with ID "11111111".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getfolder
#>
function Get-ClickUpFolder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ulong]$FolderID
    )

    $Folder = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "folder/$FolderID"
    return $Folder
}

<#
.SYNOPSIS
    Create a ClickUp folder in a particular space.
.DESCRIPTION
    Create a ClickUp folder in a particular space.
.EXAMPLE
    PS C:\> New-ClickUpFolder -SpaceID 11111111 -Name 'New Folder Name'
    Create a ClickUp folder with name "New Folder Name" under the ClickUp Space with ID "11111111".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createfolder
#>
function New-ClickUpFolder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ulong]$SpaceID,
        [Parameter(Mandatory = $true)]
        [ulong]$Name
    )

    $Body = @{
        name = $Name
    }

    $NewFolder = Invoke-ClickUpAPIPost -Endpoint "space/$SpaceID/folder" -Body $Body
    return $NewFolder
}

<#
.SYNOPSIS
    Update the name of a ClickUp Folder.
.DESCRIPTION
    Update the name of a ClickUp Folder.
.EXAMPLE
    PS C:\> Set-ClickUpFolder -FolderID 11111111 -Name 'Change Folder Name'
    Change the name of the ClickUp folder with ID "11111111" to "Change Folder Name".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/updatefolder
#>
function Set-ClickUpFolder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ulong]$FolderID,
        [Parameter(Mandatory = $true)]
        [ulong]$Name
    )

    $Body = @{
        name = $Name
    }

    $Folder = Invoke-ClickUpAPIPut -Endpoint "folder/$FolderID" -Body $Body
    return $Folder
}

<#
.SYNOPSIS
    Delete a ClickUp Folder.
.DESCRIPTION
    Delete a ClickUp Folder.
.EXAMPLE
    PS C:\> Remove-ClickUpFolder -FolderID 11111111
    Delete the ClickUp folder with ID "11111111".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/deletefolder
#>
function Remove-ClickUpFolder {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [ulong]$FolderID
    )

    if ($PSCmdlet.ShouldProcess($FolderID)) {
        Invoke-ClickUpAPIDelete -Endpoint "folder/$FolderID"
    }
}

<#
.SYNOPSIS
    Create a new Folder using a Folder template within a Space.
.DESCRIPTION
    Create a new Folder using a Folder template within a Space.
.EXAMPLE
    PS C:\> New-ClickUpFolderFromTemplate -SpaceID 11111111 -TemplateID 22222222 -Name 'New Folder Name'
    Create a ClickUp folder with name "New Folder Name" under the ClickUp Space with ID "11111111".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object Hashtable.
.NOTES
    Create a new Folder using a Folder template within a Space. This endpoint allows you to create a folder with all its nested assets (lists, tasks, etc.) from a predefined template available in your Workspace. Publicly shared templates must be added to your Workspace before you can use them with the public API. This request can be run asynchronously or synchronously via the return_immediately parameter.
.LINK
    https://developer.clickup.com/reference/createfolder
#>
function New-ClickUpFolderFromTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ulong]$SpaceID,
        [Parameter(Mandatory = $true)]
        [ulong]$TemplateID,
        [Parameter(Mandatory = $true)]
        [ulong]$Name,
        [Parameter()]
        [bool]$ReturnImmediately,
        [Parameter()]
        [string]$Content,
        [Parameter()]
        [bool]$TimeEstimate,
        [Parameter()]
        [bool]$Automation,
        [Parameter()]
        [bool]$IncludeViews,
        [Parameter()]
        [bool]$OldDueDate,
        [Parameter()]
        [bool]$OldStartDate,
        [Parameter()]
        [bool]$OldFollowers,
        [Parameter()]
        [bool]$CommentAttachments,
        [Parameter()]
        [bool]$RecurSettings,
        [Parameter()]
        [bool]$OldTags,
        [Parameter()]
        [bool]$OldStatuses,
        [Parameter()]
        [bool]$Subtasks,
        [Parameter()]
        [bool]$CustomType,
        [Parameter()]
        [bool]$OldAssignees,
        [Parameter()]
        [bool]$Attachments,
        [Parameter()]
        [bool]$Comment,
        [Parameter()]
        [bool]$OldStatus,
        [Parameter()]
        [bool]$ExternalDependencies,
        [Parameter()]
        [bool]$InternalDependencies,
        [Parameter()]
        [bool]$Priority,
        [Parameter()]
        [bool]$CustomFields,
        [Parameter()]
        [bool]$OldChecklists,
        [Parameter()]
        [bool]$Relationships,
        [Parameter()]
        [bool]$OldSubtaskAssignees,
        [Parameter()]
        [datetime]$StartDate,
        [Parameter()]
        [datetime]$DueDate,
        [Parameter()]
        [bool]$RemapStartDate,
        [Parameter()]
        [bool]$SkipWeekends,
        [Parameter()]
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

    $NewFolder = Invoke-ClickUpAPIPost -Endpoint "space/$SpaceID/folder_template/$TemplateID" -Body $Body
    return $NewFolder
}
