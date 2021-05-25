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
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/folders/get-folders.html
#>
function Get-ClickUpFolders {
    [CmdletBinding()]
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

<#
.SYNOPSIS
    Get properties on a particular ClickUp folder.
.DESCRIPTION
    Get properties on a particular ClickUp folder.
.EXAMPLE
    PS C:\> Get-ClickUpFolder -FolderID 11111111
    Get ClickUp folder with ID "11111111".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/folders/get-folder.html
#>
function Get-ClickUpFolder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$FolderID
    )

    $Folder = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "folder/$FolderID"
    Return $Folder
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
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/folders/create-folder.html
#>
function New-ClickUpFolder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$SpaceID,
        [Parameter(Mandatory = $true)]
        [int]$Name
    )

    $Body = @{
        name = $Name
    }

    $NewFolder = Invoke-ClickUpAPIPost -Endpoint "space/$SpaceID/folder" -Body $Body
    Return $NewFolder
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
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/folders/create-folder.html
#>
function Set-ClickUpFolder {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$FolderID,
        [Parameter(Mandatory = $true)]
        [int]$Name
    )

    $Body = @{
        name = $Name
    }

    $Folder = Invoke-ClickUpAPIPut -Endpoint "folder/$FolderID" -Body $Body
    Return $Folder
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
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/folders/delete-folder.html
#>
function Remove-ClickUpFolder {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [int]$FolderID
    )

    if ($PSCmdlet.ShouldProcess($FolderID)) {
        Invoke-ClickUpAPIDelete -Endpoint "folder/$FolderID"
    }
}