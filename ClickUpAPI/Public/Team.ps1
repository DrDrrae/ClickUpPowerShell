function Get-ClickUpTeam {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param ()

    $Teams = Invoke-ClickUpAPIGet -Endpoint 'team'
    Return $Teams.teams
}