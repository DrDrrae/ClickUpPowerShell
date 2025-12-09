<#
.SYNOPSIS
    Get all ClickUp Folders.
.DESCRIPTION
    Get all ClickUp Folders. Supports pipeline input from space objects for SpaceID parameter.
.EXAMPLE
    PS C:\> Get-ClickUpFolders -SpaceID 11111111
    Get all ClickUp folders under ClickUp Space with ID "11111111".
.EXAMPLE
    PS C:\> Get-ClickUpFolders -SpaceID 11111111 -Archived $true
    Get all ClickUp folders under ClickUp Space with ID "11111111" including archived.
.EXAMPLE
    PS C:\> Get-ClickUpSpace -SpaceID 11111111 | Get-ClickUpFolders
    Get all folders by piping a space object.
.INPUTS
    System.UInt64. You can pipe a space ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getfolders
#>
function Get-ClickUpFolders {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('space_id','id')]
        [uint64]$SpaceID,
        [Parameter()]
        [bool]$Archived = $false
    )

    Write-Verbose "Retrieving folders for SpaceID: $SpaceID"
    
    $QueryString = @{
        archived = $Archived
    }

    try {
        $Folders = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "space/$SpaceID/folder"
        Write-Verbose 'Folders retrieved successfully.'
        return $Folders.folders
    } catch {
        Write-Error "Failed to retrieve folders. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Get properties on a particular ClickUp folder.
.DESCRIPTION
    Get properties on a particular ClickUp folder. Supports pipeline input from folder objects for FolderID parameter.
.EXAMPLE
    PS C:\> Get-ClickUpFolder -FolderID 11111111
    Get ClickUp folder with ID "11111111".
.EXAMPLE
    PS C:\> Get-ClickUpFolders -SpaceID 11111111 | Get-ClickUpFolder
    Get detailed properties by piping folder objects.
.INPUTS
    System.UInt64. You can pipe a folder ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getfolder
#>
function Get-ClickUpFolder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('folder_id','id')]
        [uint64]$FolderID
    )

    Write-Verbose "Retrieving folder with FolderID: $FolderID"
    
    try {
        $Folder = Invoke-ClickUpAPIGet -Endpoint "folder/$FolderID"
        Write-Verbose 'Folder retrieved successfully.'
        return $Folder
    } catch {
        Write-Error "Failed to retrieve folder. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Create a ClickUp folder in a particular space.
.DESCRIPTION
    Create a ClickUp folder in a particular space. Supports pipeline input from space objects for SpaceID parameter.
.EXAMPLE
    PS C:\> New-ClickUpFolder -SpaceID 11111111 -Name 'New Folder Name'
    Create a ClickUp folder with name "New Folder Name" under the ClickUp Space with ID "11111111".
.EXAMPLE
    PS C:\> Get-ClickUpSpace -SpaceID 11111111 | New-ClickUpFolder -Name 'New Folder Name'
    Create a new folder by piping a space object.
.INPUTS
    System.UInt64. You can pipe a space ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createfolder
#>
function New-ClickUpFolder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('space_id','id')]
        [uint64]$SpaceID,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    Write-Verbose "Creating folder '$Name' in SpaceID: $SpaceID"
    
    $Body = @{
        name = $Name
    }

    try {
        $NewFolder = Invoke-ClickUpAPIPost -Endpoint "space/$SpaceID/folder" -Body $Body
        Write-Verbose 'Folder created successfully.'
        return $NewFolder
    } catch {
        Write-Error "Failed to create folder. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Update the name of a ClickUp Folder.
.DESCRIPTION
    Update the name of a ClickUp Folder. Supports pipeline input from folder objects for FolderID parameter.
.EXAMPLE
    PS C:\> Set-ClickUpFolder -FolderID 11111111 -Name 'Change Folder Name'
    Change the name of the ClickUp folder with ID "11111111" to "Change Folder Name".
.EXAMPLE
    PS C:\> Get-ClickUpFolder -FolderID 11111111 | Set-ClickUpFolder -Name 'Change Folder Name'
    Update a folder by piping a folder object.
.INPUTS
    System.UInt64. You can pipe a folder ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/updatefolder
#>
function Set-ClickUpFolder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('folder_id','id')]
        [uint64]$FolderID,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name
    )

    Write-Verbose "Updating folder '$FolderID' with name: $Name"
    
    $Body = @{
        name = $Name
    }

    try {
        $Folder = Invoke-ClickUpAPIPut -Endpoint "folder/$FolderID" -Body $Body
        Write-Verbose 'Folder updated successfully.'
        return $Folder
    } catch {
        Write-Error "Failed to update folder. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Delete a ClickUp Folder.
.DESCRIPTION
    Delete a ClickUp Folder. Supports pipeline input from folder objects for FolderID parameter.
.EXAMPLE
    PS C:\> Remove-ClickUpFolder -FolderID 11111111
    Delete the ClickUp folder with ID "11111111".
.EXAMPLE
    PS C:\> Get-ClickUpFolder -FolderID 11111111 | Remove-ClickUpFolder
    Delete a folder by piping a folder object.
.INPUTS
    System.UInt64. You can pipe a folder ID to this cmdlet.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/deletefolder
#>
function Remove-ClickUpFolder {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('folder_id','id')]
        [uint64]$FolderID
    )

    if ($PSCmdlet.ShouldProcess($FolderID, 'Delete Folder')) {
        Write-Verbose "Deleting folder '$FolderID'..."
        try {
            $Null = Invoke-ClickUpAPIDelete -Endpoint "folder/$FolderID"
            Write-Verbose 'Folder deleted successfully.'
        } catch {
            Write-Error "Failed to delete folder. Error: $_"
            throw
        }
    }
}

<#
.SYNOPSIS
    Create a new Folder using a Folder template within a Space.
.DESCRIPTION
    Create a new Folder using a Folder template within a Space. Supports pipeline input from space objects for SpaceID parameter.
.EXAMPLE
    PS C:\> New-ClickUpFolderFromTemplate -SpaceID 11111111 -TemplateID 22222222 -Name 'New Folder Name'
    Create a ClickUp folder with name "New Folder Name" under the ClickUp Space with ID "11111111".
.EXAMPLE
    PS C:\> Get-ClickUpSpace -SpaceID 11111111 | New-ClickUpFolderFromTemplate -TemplateID 22222222 -Name 'New Folder Name'
    Create a folder from template by piping a space object.
.INPUTS
    System.UInt64. You can pipe a space ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    Create a new Folder using a Folder template within a Space. This endpoint allows you to create a folder with all its nested assets (lists, tasks, etc.) from a predefined template available in your Workspace. Publicly shared templates must be added to your Workspace before you can use them with the public API. This request can be run asynchronously or synchronously via the return_immediately parameter.
.LINK
    https://developer.clickup.com/reference/createfolder
#>
function New-ClickUpFolderFromTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('space_id','id')]
        [uint64]$SpaceID,
        [Parameter(Mandatory = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$TemplateID,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter()]
        [bool]$ReturnImmediately,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
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

    Write-Verbose "Creating folder from template in SpaceID: $SpaceID with TemplateID: $TemplateID"
    
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
        $NewFolder = Invoke-ClickUpAPIPost -Endpoint "space/$SpaceID/folder_template/$TemplateID" -Body $Body
        Write-Verbose 'Folder created from template successfully.'
        return $NewFolder
    } catch {
        Write-Error "Failed to create folder from template. Error: $_"
        throw
    }
}
