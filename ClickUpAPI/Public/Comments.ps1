<#
.SYNOPSIS
    Get all comments on a ClickUp task.
.DESCRIPTION
    Get all comments on a ClickUp task. Supports pipeline input from task objects for TaskID parameter.
.EXAMPLE
    PS C:\> Get-ClickUpTaskComments -TaskID 9hz
    Get all ClickUp task comments under task with ID "9hz"
.EXAMPLE
    PS C:\> Get-ClickUpTaskComments -TaskID CustomID -CustomTaskIDs $true -TeamID 123
    Get all ClickUp task comments under task with custom ID "CustomID".
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID 9hz | Get-ClickUpTaskComments
    Get all comments by piping a task object.
.INPUTS
    System.String. You can pipe a task ID to this cmdlet.
.OUTPUTS
    System.Object
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/gettaskcomments
#>
function Get-ClickUpTaskComments {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('task_id','id')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [ValidateRange(1, [uint64]::MaxValue)]
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

    Write-Verbose "Retrieving comments for task '$TaskID'..."
    try {
        $Comments = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "task/$TaskID/comment"
        Write-Verbose 'Comments retrieved successfully.'
        return $Comments.comments
    } catch {
        Write-Error "Failed to retrieve task comments. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Get ClickUp chat view comments.
.DESCRIPTION
    Get ClickUp chat view comments. Supports pipeline input from view objects for ViewID parameter.
.EXAMPLE
    PS C:\> Get-ClickUpChatViewComments -ViewID 3c
    Get ClickUp chat view comments for view with ID "3c".
.EXAMPLE
    PS C:\> Get-ClickUpView -ViewID 3c | Get-ClickUpChatViewComments
    Get chat view comments by piping a view object.
.INPUTS
    System.String. You can pipe a view ID to this cmdlet.
.OUTPUTS
    System.Object
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getchatviewcomments
#>
function Get-ClickUpChatViewComments {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('view_id','id')]
        [string]$ViewID
    )

    Write-Verbose "Retrieving comments for chat view '$ViewID'..."
    try {
        $Comments = Invoke-ClickUpAPIGet -Endpoint "view/$ViewID/comment"
        Write-Verbose 'Chat view comments retrieved successfully.'
        return $Comments.comments
    } catch {
        Write-Error "Failed to retrieve chat view comments. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Get all comments on a ClickUp list.
.DESCRIPTION
    Get all comments on a ClickUp list. Supports pipeline input from list objects for ListID parameter.
.EXAMPLE
    PS C:\> Get-ClickUpListComments -ListID 123
    Get ClickUp list comments for list with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpList -ListID 123 | Get-ClickUpListComments
    Get list comments by piping a list object.
.INPUTS
    System.UInt64. You can pipe a list ID to this cmdlet.
.OUTPUTS
    System.Object
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getlistcomments
#>
function Get-ClickUpListComments {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('list_id','id')]
        [uint64]$ListID
    )

    Write-Verbose "Retrieving comments for list '$ListID'..."
    try {
        $Comments = Invoke-ClickUpAPIGet -Endpoint "list/$ListID/comment"
        Write-Verbose 'List comments retrieved successfully.'
        return $Comments.comments
    } catch {
        Write-Error "Failed to retrieve list comments. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Get all threaded comments.
.DESCRIPTION
    Get all threaded comments. Supports pipeline input from comment objects for CommentID parameter.
.EXAMPLE
    PS C:\> Get-ClickUpThreadedComments -CommentID 123
    Get ClickUp threaded comments for comment with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpTaskComments -TaskID 9hz | Get-ClickUpThreadedComments
    Get threaded comments by piping a comment object.
.INPUTS
    System.UInt64. You can pipe a comment ID to this cmdlet.
.OUTPUTS
    System.Object
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getthreadedcomments
#>
function Get-ClickUpThreadedComments {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('comment_id','id')]
        [uint64]$CommentID
    )

    Write-Verbose "Retrieving comments for comment '$CommentID'..."
    try {
        $Comments = Invoke-ClickUpAPIGet -Endpoint "comment/$CommentID/reply"
        Write-Verbose 'Comments retrieved successfully.'
        return $Comments.comments
    } catch {
        Write-Error "Failed to retrieve threaded comments. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Update ClickUp comment.
.DESCRIPTION
    Update ClickUp comment. Supports pipeline input from comment objects for CommentID parameter.
.EXAMPLE
    PS C:\> $Body = @{
    >>     comment_text = "Updated comment text"
    >>     assignee = 183
    >>     resolved = $true
    >> }
    PS C:\> Set-ClickUpComment -CommentID 456 -Body $Body
    Update comment with ID "456".
.EXAMPLE
    PS C:\> $Body = @{comment_text = "Updated comment"}
    PS C:\> Get-ClickUpTaskComments -TaskID 9hz | Set-ClickUpComment -Body $Body
    Update comments by piping from task comments.
.INPUTS
    System.UInt64. You can pipe a comment ID to this cmdlet.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/updatecomment
#>
function Set-ClickUpComment {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('comment_id','id')]
        [uint64]$CommentID,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [hashtable]$Body
    )

    Write-Verbose "Updating comment '$CommentID'..."
    try {
        $Null = Invoke-ClickUpAPIPut -Endpoint "comment/$CommentID" -Body $Body
        Write-Verbose 'Comment updated successfully.'
    } catch {
        Write-Error "Failed to update comment. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Delete ClickUp comment.
.DESCRIPTION
    Delete ClickUp comment. Supports pipeline input from comment objects for CommentID parameter.
.EXAMPLE
    PS C:\> Remove-ClickUpComment -CommentID 456
    Delete comment with ID "456".
.EXAMPLE
    PS C:\> Get-ClickUpTaskComments -TaskID 9hz | Remove-ClickUpComment
    Delete comments by piping from task comments.
.INPUTS
    System.UInt64. You can pipe a comment ID to this cmdlet.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/deletecomment
#>
function Remove-ClickUpListComment {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('comment_id','id')]
        [uint64]$CommentID
    )

    if ($PSCmdlet.ShouldProcess($CommentID, 'Delete Comment')) {
        Write-Verbose "Deleting comment '$CommentID'..."
        try {
            $Null = Invoke-ClickUpAPIDelete -Endpoint "comment/$CommentID"
            Write-Verbose 'Comment deleted successfully.'
        } catch {
            Write-Error "Failed to delete comment. Error: $_"
            throw
        }
    }
}

<#
.SYNOPSIS
    Create ClickUp task comment.
.DESCRIPTION
    Create ClickUp task comment.
.EXAMPLE
    PS C:\> $Body = @{
    >>     comment_text = "Task comment content"
    >>     assignee = 183
    >>     notify_all = $true
    >> }
    PS C:\> New-ClickUpTaskComment -TaskID 9hz -Body $Body
    Create new ClickUp task comment on task with ID "9hz".
.EXAMPLE
    PS C:\> $Body = @{
    >>     comment_text = "Task comment content"
    >>     assignee = 183
    >>     notify_all = $true
    >> }
    PS C:\> New-ClickUpTaskComment -TaskID 'CustomTaskID' -Body $Body -CustomTaskIDs $true -TeamID 1111111
    Create new ClickUp task comment on task with custom id "CustomTaskID".
.EXAMPLE
    PS C:\> $Body = @{
    >>     comment_text = "Task comment content"
    >>     assignee = 183
    >>     notify_all = $true
    >> }
    PS C:\> New-ClickUpTaskComment -TaskID 9hz -Body $Body
    Create new ClickUp task comment on task with ID "9hz".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createtaskcomment
#>
function New-ClickUpTaskComment {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [ValidateNotNullOrEmpty()]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [ValidateNotNullOrEmpty()]
        [hashtable]$Body,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [ValidateRange(1, [uint64]::MaxValue)]
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

    Write-Verbose "Creating comment on task '$TaskID'..."
    try {
        $Comment = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/comment" -Body $Body
        Write-Verbose 'Task comment created successfully.'
        return $Comment
    } catch {
        Write-Error "Failed to create task comment. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Create ClickUp chat view comment.
.DESCRIPTION
    Create ClickUp chat view comment.
.EXAMPLE
    PS C:\> $Body = @{
    >>     comment_text = "Chat view comment content"
    >>     assignee = 183
    >>     notify_all = $true
    >> }
    PS C:\> New-ClickUpChatViewComment -TaskID 3c -Body $Body
    Create new ClickUp chat view comment on chat view with ID "3c".
.EXAMPLE
    PS C:\> $Body = @{
    >>     comment_text = "Chat view comment content"
    >>     assignee = 183
    >>     notify_all = $true
    >> }
    PS C:\> New-ClickUpChatViewComment -ViewID 3c -Body $Body
    Create new ClickUp chat view comment on chat view with ID "3c".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createchatviewcomment
#>
function New-ClickUpChatViewComment {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$ViewID,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [hashtable]$Body
    )

    Write-Verbose "Creating comment on chat view '$ViewID'..."
    try {
        $Comment = Invoke-ClickUpAPIPost -Endpoint "view/$ViewID/comment" -Body $Body
        Write-Verbose 'Chat view comment created successfully.'
        return $Comment
    } catch {
        Write-Error "Failed to create chat view comment. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Create ClickUp list comment.
.DESCRIPTION
    Create ClickUp list comment.
.EXAMPLE
    PS C:\> $Body = @{
    >>     comment_text = "List comment content"
    >>     assignee = 183
    >>     notify_all = $true
    >> }
    PS C:\> New-ClickUpListComment -ListID 124 -Body $Body
    Create new ClickUp list comment on list with ID "124".
.EXAMPLE
    PS C:\> $Body = @{
    >>     comment_text = "List comment content"
    >>     assignee = 183
    >>     notify_all = $true
    >> }
    PS C:\> New-ClickUpListComment -ListID 124 -Body $Body
    Create new ClickUp list comment with formatting on list with ID "124".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createlistcomment
#>
function New-ClickUpListComment {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$ListID,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [hashtable]$Body
    )

    Write-Verbose "Creating comment on list '$ListID'..."
    try {
        $Comment = Invoke-ClickUpAPIPost -Endpoint "list/$ListID/comment" -Body $Body
        Write-Verbose 'List comment created successfully.'
        return $Comment
    } catch {
        Write-Error "Failed to create list comment. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Create ClickUp threaded comment.
.DESCRIPTION
    Create ClickUp threaded comment.
.EXAMPLE
    PS C:\> $Body = @{
    >>     comment_text = "Threaded comment content"
    >>     assignee = 183
    >>     notify_all = $true
    >> }
    PS C:\> New-ClickUpThreadedComment -CommentID 124 -Body $Body
    Create new ClickUp threaded comment on comment with ID "124".
.EXAMPLE
    PS C:\> $Body = @{
    >>     comment_text = "Threaded comment content"
    >>     assignee = 183
    >>     notify_all = $true
    >> }
    PS C:\> New-ClickUpThreadedComment -CommentID 124 -Body $Body
    Create new ClickUp threaded comment on comment with ID "124".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createthreadedcomment
#>
function New-ClickUpThreadedComment {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$CommentID,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [hashtable]$Body
    )

    Write-Verbose "Creating threaded comment on comment '$CommentID'..."
    try {
        $Comment = Invoke-ClickUpAPIPost -Endpoint "comment/$CommentID/reply" -Body $Body
        Write-Verbose 'Threaded comment created successfully.'
        return $Comment
    } catch {
        Write-Error "Failed to create threaded comment. Error: $_"
        throw
    }
}