<#
.SYNOPSIS
    Get all ClickUp Lists.
.DESCRIPTION
    Get all ClickUp Lists.
.EXAMPLE
    PS C:\> Get-ClickUpLists
    
.EXAMPLE
    PS C:\> Get-ClickUpLists
    
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/lists/get-lists.html
#>
function Get-ClickUpLists {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true)]
        [int]$FolderID,
        [Parameter()]
        [bool]$Archived = $false
    )

    $QueryString = @{
        $Archived = $Archived
    }

    $Lists = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "folder/$FolderID/list"
    Return $Lists.lists
}
