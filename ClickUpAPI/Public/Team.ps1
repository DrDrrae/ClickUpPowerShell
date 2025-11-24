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
.OUTPUTS
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
    Get all ClickUp team plan.
.EXAMPLE
    PS C:\> Get-ClickUpTeamPlan -TeamID 123
    Get all ClickUp team plan for team with ID "123".
.INPUTS
    None. This cmdlet does not accept any input.
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
        [Parameter(Mandatory = $true)]
        [UInt64]$TeamID
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
    Get all ClickUp team seats.
.EXAMPLE
    PS C:\> Get-ClickUpTeamSeats -TeamID 123
    Get all ClickUp team seats for team with ID "123".
.INPUTS
    None. This cmdlet does not accept any input.
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
        [Parameter(Mandatory = $true)]
        [UInt64]$TeamID
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