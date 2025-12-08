<#
.SYNOPSIS
    Get ClickUp authorized user.
.DESCRIPTION
    Get ClickUp authorized user.
.EXAMPLE
    PS C:\> Get-ClickUpAuthorizedUser
    Get the user that belongs to this token
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getauthorizeduser
#>
function Get-ClickUpAuthorizedUser {
    [CmdletBinding()]
    [OutputType([System.Object])]
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
    System.Array
.NOTES
    See the link for information.
    https://developer.clickup.com/docs/faq#what-is-a-team
.LINK
    https://developer.clickup.com/reference/getauthorizedteams
#>
function Get-ClickUpAuthorizedWorkspaces {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
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
    Get a new ClickUp access token. Supports pipeline input from configuration objects containing ClientID, ClientSecret, and Code properties.
.EXAMPLE
    PS C:\> New-ClickUpAccessToken -ClientID "ClientID" -ClientSecret "ClientSecret" -Code "Code"
    Get a new ClickUp access token.
.EXAMPLE
    PS C:\> $config = [PSCustomObject]@{ClientID = "id"; ClientSecret = "secret"; Code = "code"}
    PS C:\> $config | New-ClickUpAccessToken
    Get a new ClickUp access token by piping a configuration object.
.INPUTS
    System.Management.Automation.PSCustomObject. You can pipe a configuration object with ClientID, ClientSecret, and Code properties to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getaccesstoken
#>
function New-ClickUpAccessToken {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
        [string]$ClientID,
        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
        [string]$ClientSecret,
        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
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