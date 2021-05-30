<#
.SYNOPSIS
    Get all ClickUp teams.
.DESCRIPTION
    Get all ClickUp teams.
.EXAMPLE
    PS C:\> Get-ClickUpTeam
    Get all ClickUp teams the authorized user has access to.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/teams/get-teams.html
#>
function Get-ClickUpTeam {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param ()

    $Teams = Invoke-ClickUpAPIGet -Endpoint 'team'
    Return $Teams.teams
}