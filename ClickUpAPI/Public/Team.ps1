function Get-ClickUpTeam {
    [CmdletBinding()]
    param ()

    $Teams = Invoke-ClickUpAPIGet -Endpoint 'team'
    Return $Teams.teams
}