<#
.SYNOPSIS
    Get all ClickUp teams.
.DESCRIPTION
    Get all ClickUp teams.
.EXAMPLE
    PS C:\> Get-ClickUpTeam
    Get all ClickUp teams.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getauthorizedteams
#>
function Get-ClickUpTeam {
    [CmdletBinding()]
    [Alias('Get-ClickUpTeams', 'Get-ClickupWorkspace', 'Get-ClickupWorkspaces')]
    [OutputType([System.Object], [System.Array])]
    param ()

    Write-Verbose 'Entering Get-ClickUpTeam'
    try {
        Write-Verbose 'Getting all teams'
        $Teams = Invoke-ClickUpAPIGet -Endpoint 'team'
        Write-Verbose 'Successfully retrieved teams'
        return $Teams.teams
    } catch {
        Write-Error "Error in Get-ClickUpTeam: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Get all ClickUp team plan.
.DESCRIPTION
    Get all ClickUp team plan. Can accept TeamID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Get-ClickUpTeamPlan -TeamID 123
    Get all ClickUp team plan for team with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpTeam | Get-ClickUpTeamPlan
    Get team plan by piping team ID from Get-ClickUpTeam.
.INPUTS
    System.UInt64. TeamID via pipeline by property name.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getworkspaceplan
#>
function Get-ClickUpTeamPlan {
    [CmdletBinding()]
    [Alias('Get-ClickUpWorkspacePlan')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('team_id', 'id')]
        [uint64]$TeamID
    )

    Write-Verbose 'Entering Get-ClickUpTeamPlan'
    try {
        Write-Verbose "Getting plan for team ID: $TeamID"
        $Plan = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/plan"
        Write-Verbose 'Successfully retrieved team plan'
        return $Plan
    } catch {
        Write-Error "Error in Get-ClickUpTeamPlan: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Get all ClickUp team seats.
.DESCRIPTION
    Get all ClickUp team seats. Can accept TeamID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Get-ClickUpTeamSeats -TeamID 123
    Get all ClickUp team seats for team with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpTeam | Get-ClickUpTeamSeats
    Get team seats by piping team ID from Get-ClickUpTeam.
.INPUTS
    System.UInt64. TeamID via pipeline by property name.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getworkspaceseats
#>
function Get-ClickUpTeamSeats {
    [CmdletBinding()]
    [Alias('Get-ClickUpWorkspaceSeats')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('team_id', 'id')]
        [uint64]$TeamID
    )

    Write-Verbose 'Entering Get-ClickUpTeamSeats'
    try {
        Write-Verbose "Getting seats for team ID: $TeamID"
        $Seats = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/seats"
        Write-Verbose 'Successfully retrieved team seats'
        return $Seats
    } catch {
        Write-Error "Error in Get-ClickUpTeamSeats: $($_.Exception.Message)"
        throw $_
    }
}