<#
.SYNOPSIS
    Get all ClickUp Folders.
.DESCRIPTION
    Get all ClickUp Folders.
.EXAMPLE
    PS C:\> Get-ClickUpFolders
    
.EXAMPLE
    PS C:\> Get-ClickUpFolders
    
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/comments/get-task-comments.html
#>
function Get-ClickUpFolders {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true)]
        [int]$SpaceID,
        [Parameter()]
        [bool]$Archived = $false
    )

    $QueryString = @{
        $Archived = $Archived
    }

    $Folders = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "space/$SpaceID/folder"
    Return $Folders.folders
}
