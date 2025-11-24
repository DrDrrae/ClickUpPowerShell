<#
.SYNOPSIS
    Get available custom roles in the workspace.
.DESCRIPTION
    View the custom roles available in a Workspace.
.EXAMPLE
    PS C:\> Get-ClickUpCustomRoles -TeamID 123
    Get all custom roles for team with ID "123".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getcustomroles
#>
function Get-ClickUpCustomRoles {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$TeamID
    )

    $Roles = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/customroles"
    return $Roles.custom_roles
}
