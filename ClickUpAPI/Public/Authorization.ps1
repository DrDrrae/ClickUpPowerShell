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
    https://developer.clickup.com/reference/getauthorizeduser
#>
function Get-ClickUpAuthorizedUser {
    [CmdletBinding()]
    param ()

    try {
        $User = Invoke-ClickUpAPIGet -Endpoint 'user'
        return $User.user
    } catch {
        Write-Error "Failed to get authorized user. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Get ClickUp authorized workspaces.
.DESCRIPTION
    Get ClickUp authorized workspaces.
.EXAMPLE
    PS C:\> Get-ClickUpAuthorizedWorkspaces
    Get the authorized workspaces for this token
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
    https://developer.clickup.com/docs/faq#what-is-a-team
.LINK
    https://developer.clickup.com/reference/getauthorizedteams
#>
function Get-ClickUpAuthorizedWorkspaces {
    [CmdletBinding()]
    [Alias('Get-ClickUpAuthorizedTeams')]
    param ()

    try {
        $Teams = Invoke-ClickUpAPIGet -Endpoint 'team'
        return $Teams.teams
    } catch {
        Write-Error "Failed to get authorized workspaces. Error: $_"
        throw
    }
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
    https://developer.clickup.com/reference/getaccesstoken
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

    try {
        $AccessToken = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint 'oath/token'
        return $AccessToken
    } catch {
        Write-Error "Failed to get access token. Error: $_"
        throw
    }
}