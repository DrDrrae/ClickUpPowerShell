<#
.SYNOPSIS
    Get all comments on a ClickUp task.
.DESCRIPTION
    Get all comments on a ClickUp task.
.EXAMPLE
    PS C:\> Get-ClickUpTaskComments -TaskID 9hz
    Get all ClickUp comments under task with ID "9hz"
.EXAMPLE
    PS C:\> Get-ClickUpTaskComments -TaskID CustomID -CustomTaskIDs $true -TeamID 123
    Get all ClickUp comments under task with custom ID "CustomID".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/comments/get-task-comments.html
#>
function Get-ClickUpTaskComments {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TaskID,
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

    $Comments = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "task/$TaskID/comment"
    Return $Comments.comments
}

<#
.SYNOPSIS
    Get ClickUp chat view comments.
.DESCRIPTION
    Get ClickUp chat view comments.
.EXAMPLE
    PS C:\> Get-ClickUpChatViewComments -ViewID 3c
    Get ClickUp chat view comments for view with ID "3c".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/comments/get-chat-view-comments.html
#>
function Get-ClickUpChatViewComments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ViewID
    )

    $Comments = Invoke-ClickUpAPIGet -Endpoint "view/$ViewID/comment"
    Return $Comments.comments
}

<#
.SYNOPSIS
    Get all comments on a ClickUp list.
.DESCRIPTION
    Get all comments on a ClickUp list.
.EXAMPLE
    PS C:\> Get-ClickUpListComments -ListID 123
    Get ClickUp chat view comments for view with ID "3c".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/comments/get-list-comments.html
#>
function Get-ClickUpListComments {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$ListID
    )

    $Comments = Invoke-ClickUpAPIGet -Endpoint "list/$ListID/comment"
    Return $Comments.comments
}

<#
.SYNOPSIS
    Update ClickUp comment.
.DESCRIPTION
    Update ClickUp comment.
.EXAMPLE
    PS C:\> $Body = @{
    >> comment_text = "Updated comment text"
    >> assignee = 183
    >> resolved = $true
    >> }
    PS C:\> Set-ClickUpComment -CommentID 456 -Body $Body
    Update comment with ID "456".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/comments/update-comment.html
#>
function Set-ClickUpListComment {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$CommentID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    Invoke-ClickUpAPIPut -Endpoint "comment/$CommentID"
}

<#
.SYNOPSIS
    Delete ClickUp comment.
.DESCRIPTION
    Delete ClickUp comment.
.EXAMPLE
    PS C:\> Remove-ClickUpComment -CommentID 456
    Delete comment with ID "456".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/comments/delete-comment.html
#>
function Remove-ClickUpListComment {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [int]$CommentID
    )

    if ($PSCmdlet.ShouldProcess($CommentID)) {
        Invoke-ClickUpAPIDelete -Endpoint "comment/$CommentID"
    }
}

<#
.SYNOPSIS
    Create ClickUp task comment.
.DESCRIPTION
    Create ClickUp task comment.
.EXAMPLE
    PS C:\> $Body = @{
    >> comment_text = "Task comment content"
    >> assignee = 183
    >> notify_all = $true
    >> }
    PS C:\> New-ClickUpTaskComment -TaskID 9hz -Body $Body
    Create new ClickUp task comment on task with ID "9hz".
.EXAMPLE
    PS C:\> $Body = @{
    >> comment_text = "Task comment content"
    >> assignee = 183
    >> notify_all = $true
    >> }
    PS C:\> New-ClickUpTaskComment -TaskID 'CustomTaskID' -Body $Body -CustomTaskIDs $true -TeamID 1111111
    Create new ClickUp task comment on task with custom id "CustomTaskID".
.EXAMPLE
    PS C:\> $Body = @{
    >> comment = @(
    >> @{
    >> text = "bold text",
    >> attributes = @{
    >>     bold = $true
    >>     }
    >> },
    >> @{
    >> text = "italic text",
    >>  attributes = @{
    >>     italic = $true
    >>     }
    >> }
    >> )
    >> assignee = 183
    >> notify_all = $true
    >> }
    PS C:\> New-ClickUpTaskComment -TaskID 9hz -Body $Body
    Create new ClickUp task comment with formatting on task with ID "9hz".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/comments/create-task-comment.html
#>
function New-ClickUpTaskComment {
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

    $Comment = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint 'task/$TaskID/comment' -Body $Body
    Return $Comment
}

<#
.SYNOPSIS
    Create ClickUp chat view comment.
.DESCRIPTION
    Create ClickUp chat view comment.
.EXAMPLE
    PS C:\> $Body = @{
    >> comment_text = "Task comment content"
    >> assignee = 183
    >> notify_all = $true
    >> }
    PS C:\> New-ClickUpChatViewComment -TaskID 3c -Body $Body
    Create new ClickUp chat view comment on chat view with ID "3c".
.EXAMPLE
    PS C:\> $Body = @{
    >> comment = @(
    >> @{
    >> text = "bold text",
    >> attributes = @{
    >>     bold = $true
    >>     }
    >> },
    >> @{
    >> text = "italic text",
    >>  attributes = @{
    >>     italic = $true
    >>     }
    >> }
    >> )
    >> assignee = 183
    >> notify_all = $true
    >> }
    PS C:\> New-ClickUpChatViewComment -ViewID 3c -Body $Body
    Create new ClickUp chat view comment with formatting on chat view with ID "3c".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/comments/create-chat-view-comment.html
#>
function New-ClickUpChatViewComment {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ViewID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $Comment = Invoke-ClickUpAPIPost -Endpoint 'view/$ViewID/comment' -Body $Body
    Return $Comment
}

<#
.SYNOPSIS
    Create ClickUp list comment.
.DESCRIPTION
    Create ClickUp list comment.
.EXAMPLE
    PS C:\> $Body = @{
    >> comment_text = "Task comment content"
    >> assignee = 183
    >> notify_all = $true
    >> }
    PS C:\> New-ClickUpListComment -ListID 124 -Body $Body
    Create new ClickUp task comment on list with ID "124".
.EXAMPLE
    PS C:\> $Body = @{
    >> comment = @(
    >> @{
    >> text = "bold text",
    >> attributes = @{
    >>     bold = $true
    >>     }
    >> },
    >> @{
    >> text = "italic text",
    >>  attributes = @{
    >>     italic = $true
    >>     }
    >> }
    >> )
    >> assignee = 183
    >> notify_all = $true
    >> }
    PS C:\> New-ClickUpListComment -ListID 124 -Body $Body
    Create new ClickUp task comment with formatting on task with ID "124".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/comments/create-list-comment.html
#>
function New-ClickUpListComment {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$ListID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $Comment = Invoke-ClickUpAPIPost -Endpoint 'list/$ListID/comment' -Body $Body
    Return $Comment
}