<#
.SYNOPSIS
    Get ClickUp shared hierarchy.
.DESCRIPTION
    Get ClickUp shared hierarchy. Returns all resources you have access to where you don't have access to its parent. For example, if you have a access to a shared task, but don't have access to its parent list, it will come back in this request.
.EXAMPLE
    PS C:\> Get-ClickUpSharedHierarchy -TeamID 123
    Returns all ClickUp resources you have access to where you don't have access to its parent.
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Returns all resources you have access to where you don't have access to its parent. For example, if you have a access to a shared task, but don't have access to its parent list, it will come back in this request.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/shared-hierarchy/shared-hierarchy.html
#>
function Get-ClickUpSharedHierarchy {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [uint64]$TeamID
    )

    $SharedHierarchy = Invoke-ClickUpAPIGet-Endpoint "team/$TeamID/shared"
    Return $SharedHierarchy.shared
}