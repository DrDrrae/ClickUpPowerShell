<#
.SYNOPSIS
    Get ClickUp shared hierarchy.
.DESCRIPTION
    Get ClickUp shared hierarchy. Returns all resources you have access to where you don't have access to its parent. For example, if you have access to a shared task, but don't have access to its parent list, it will come back in this request. Can accept TeamID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Get-ClickUpSharedHierarchy -TeamID 123
    Returns all ClickUp resources you have access to where you don't have access to its parent.
.EXAMPLE
    PS C:\> Get-ClickUpAuthorizedWorkspaces | Get-ClickUpTeam | Get-ClickUpSharedHierarchy
    Gets shared hierarchy by piping team ID from Get-ClickUpTeam.
.INPUTS
    System.UInt64. TeamID via pipeline by property name.
.OUTPUTS
    System.Object
    System.Array
.NOTES
    See the link for information.

    Returns all resources you have access to where you don't have access to its parent. For example, if you have access to a shared task, but don't have access to its parent list, it will come back in this request.
.LINK
    https://developer.clickup.com/reference/sharedhierarchy
#>
function Get-ClickUpSharedHierarchy {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('team_id', 'id')]
        [uint64]$TeamID
    )

    Write-Verbose 'Entering Get-ClickUpSharedHierarchy'
    try {
        Write-Verbose "Getting shared hierarchy for team ID: $TeamID"
        $SharedHierarchy = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/shared"
        Write-Verbose 'Successfully retrieved shared hierarchy'
        return $SharedHierarchy.shared
    } catch {
        Write-Error "Error in Get-ClickUpSharedHierarchy: $($_.Exception.Message)"
        throw $_
    }
}