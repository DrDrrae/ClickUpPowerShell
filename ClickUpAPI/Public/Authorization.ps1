<#
.SYNOPSIS
    Get ClickUp authorized user.
.DESCRIPTION
    Get ClickUp authorized user.
.EXAMPLE
    PS C:\> Get-ClickUpAuthorizedUser
    Get the user that belongs to this token
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/authorization/get-authorized-user.html
#>
function Get-ClickUpAuthorizedUser {
    [CmdletBinding()]
    param ()

    $User = Invoke-ClickUpAPIPost -Endpoint 'user'
    Return $User.user
}

<#
.SYNOPSIS
    Get ClickUp authorized teams.
.DESCRIPTION
    Get ClickUp authorized teams.
.EXAMPLE
    PS C:\> Get-ClickUpAuthorizedTeams
    Get the authorized teams for this token
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/authorization/get-authorized-teams.html
#>
function Get-ClickUpAuthorizedTeams {
    [CmdletBinding()]
    param ()

    $Teams = Invoke-ClickUpAPIPost -Endpoint 'team'
    Return $Teams.teams
}

<#
.SYNOPSIS
    Get a new ClickUp access token.
.DESCRIPTION
    Get a new ClickUp access token.
.EXAMPLE
    PS C:\> New-ClickUpAccessToken -ClientID "ClientID" -ClientSecret "ClientSecret" -Code "Code"
    Get a new ClickUp access token.
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/authorization/get-access-token.html
#>
function New-ClickUpAccessToken {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $True)]
        [string]$ClientID,
        [Parameter(Mandatory = $True)]
        [string]$ClientSecret,
        [Parameter(Mandatory = $True)]
        [string]$Code
    )

    $QueryString = @{
        client_id     = $ClientID
        client_secret = $ClientSecret
        code          = $Code
    }

    $AccessToken = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint 'oath/token'
    Return $AccessToken
}