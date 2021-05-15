<#
.SYNOPSIS
    Get all ClickUp task members.
.DESCRIPTION
    Get all ClickUp task members.
.EXAMPLE
    PS C:\> Get-ClickUpTaskMembers -TaskId 9hz
    Get ClickUp task members from task with ID "9hz".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/members/get-task-members.html
#>
function Get-ClickUpTaskMembers {
    [CmdletBinding()]
    [OutputType([hashtable])]
    param(
        [Parameter(Mandatory=$true)]
        [string]$TaskID
    )

    $TaskMembers = Invoke-ClickUpAPIGet -Endpoint "task/$TaskID/member"
    $TaskMembers.members
}

<#
.SYNOPSIS
    Get all ClickUp list members.
.DESCRIPTION
    Get all ClickUp list members.
.EXAMPLE
    PS C:\> Get-ClickUpListMembers -ListId 123
    Get ClickUp list members from list with ID "123".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/members/get-list-members.html
#>
function Get-ClickUpListMembers {
    [CmdletBinding()]
    [OutputType([hashtable])]
    param(
        [Parameter(Mandatory = $true)]
        [UInt32]$ListID
    )

    $ListMembers = Invoke-ClickUpAPIGet -Endpoint "list/$TaskID/member"
    $ListMembers.members
}