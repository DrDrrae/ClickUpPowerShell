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
        [ulong]$TeamID
    )

    Write-Verbose 'Entering Get-ClickUpCustomRoles'
    try {
        Write-Verbose "Getting custom roles for team ID: $TeamID"
        $Roles = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/customroles"
        Write-Verbose 'Successfully retrieved custom roles'
        return $Roles.custom_roles
    } catch {
        Write-Error "Error in Get-ClickUpCustomRoles: $($_.Exception.Message)"
        throw $_
    }
}
