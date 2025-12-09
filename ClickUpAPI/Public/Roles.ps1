<#
.SYNOPSIS
    Get available custom roles in the workspace.
.DESCRIPTION
    View the custom roles available in a Workspace. Can accept TeamID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Get-ClickUpCustomRoles -TeamID 123
    Gets all custom roles for team with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpAuthorizedWorkspaces | Get-ClickUpTeam | Get-ClickUpCustomRoles
    Gets custom roles by piping team ID from Get-ClickUpTeam.
.INPUTS
    System.UInt64. TeamID via pipeline by property name.
.OUTPUTS
    System.Object
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('team_id','id')]
        [uint64]$TeamID
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
