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
