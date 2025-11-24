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

    $Teams = Invoke-ClickUpAPIGet -Endpoint 'team'
    return $Teams.teams
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

    $Plan = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/plan"
    return $Plan
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

    $Seats = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/seats"
    return $Seats
}