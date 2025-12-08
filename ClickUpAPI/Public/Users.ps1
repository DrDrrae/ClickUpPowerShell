<#
.SYNOPSIS
    Get ClickUp user.
.DESCRIPTION
    View information about a user in a Workspace. The UserID can be provided via pipeline.
.EXAMPLE
    PS C:\> Get-ClickUpUser -TeamID 123 -UserID 456
    Get ClickUp user for team with ID "123" and user with ID "456".
.EXAMPLE
    PS C:\> 456 | Get-ClickUpUser -TeamID 123
    Pipe user ID and retrieve user details.
.INPUTS
    System.UInt64. You can pipe a user ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    This endpoint is only available to Workspaces on our Enterprise Plan.

    See the link for information.
.LINK
    https://developer.clickup.com/reference/getuser
#>
function Get-ClickUpUser {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [uint64]$TeamID,
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('user_id','id')]
        [uint64]$UserID,
        [Parameter()]
        [bool]$IncludeShared = $true
    )

    $QueryString = @{
        include_shared = $IncludeShared
    }

    Write-Verbose 'Entering Get-ClickUpUser'
    try {
        Write-Verbose "Getting user with ID: $UserID for team ID: $TeamID"
        $User = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/user/$UserID" -Arguments $QueryString
        Write-Verbose 'Successfully retrieved user'
        return $User.member
    } catch {
        Write-Error "Error in Get-ClickUpUser: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Invite user to ClickUp workspace.
.DESCRIPTION
    Invite someone to join your Workspace as a member. To invite someone as a guest, use the Invite Guest endpoint.
.EXAMPLE
    PS C:\> New-ClickUpUser -TeamID 123 -Email "user@example.com" -Admin $false
    Invite user to ClickUp workspace with ID "123".
.EXAMPLE
    PS C:\> New-ClickUpUser -TeamID 123 -Email "user@example.com" -Admin $true -CustomRoleID 456
    Invite user to ClickUp workspace with ID "123".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    This endpoint is only available to Workspaces on our Enterprise Plan.

    See the link for information.
.LINK
    https://developer.clickup.com/reference/inviteusertoworkspace
#>
function New-ClickUpUser {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$TeamID,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('^[^@]+@[^@]+\\.[^@]+$')]
        [string]$Email,
        [Parameter(Mandatory = $true)]
        [bool]$Admin,
        [Parameter()]
        [uint64]$CustomRoleID
    )

    $Body = @{
        email = $Email
        admin = $Admin
    }

    if ($PSBoundParameters.ContainsKey('CustomRoleID')) {
        $Body.Add('custom_role_id', $CustomRoleID)
    }

    Write-Verbose 'Entering New-ClickUpUser'
    try {
        Write-Verbose "Inviting user '$Email' to team ID: $TeamID"
        #https://api.clickup.com/api/v2/team/{team_id}/user
        $User = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/user" -Body $Body
        Write-Verbose 'Successfully invited user'
        return $User
    } catch {
        Write-Error "Error in New-ClickUpUser: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Edit user in ClickUp workspace.
.DESCRIPTION
    Edit a user in a Workspace. The UserID can be provided via pipeline.
.EXAMPLE
    PS C:\> Set-ClickUpUser -TeamID 123 -UserID 456 -Admin $true
    Edit user in ClickUp workspace with ID "123" and user with ID "456".
.EXAMPLE
    PS C:\> 456 | Set-ClickUpUser -TeamID 123 -Username "newusername" -Admin $false
    Pipe user ID and update the user.
.INPUTS
    System.UInt64. You can pipe a user ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    This endpoint is only available to Workspaces on our Enterprise Plan.

    See the link for information.
.LINK
    https://developer.clickup.com/reference/edituseronworkspace
#>
function Set-ClickUpUser {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$TeamID,
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('user_id','id')]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$UserID,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Username,
        [Parameter(Mandatory = $true)]
        [bool]$Admin,
        [Parameter()]
        [uint64]$CustomRoleID
    )

    $Body = @{
        username = $Username
        admin    = $Admin
    }

    if ($PSBoundParameters.ContainsKey('CustomRoleID')) {
        $Body.Add('custom_role_id', $CustomRoleID)
    }

    Write-Verbose 'Entering Set-ClickUpUser'
    try {
        Write-Verbose "Updating user with ID: $UserID for team ID: $TeamID"
        $User = Invoke-ClickUpAPIPut -Endpoint "team/$TeamID/user/$UserID" -Body $Body
        Write-Verbose 'Successfully updated user'
        return $User.member
    } catch {
        Write-Error "Error in Set-ClickUpUser: $($_.Exception.Message)"
        throw $_
    }
}


<#
.SYNOPSIS
    Remove user from ClickUp workspace.
.DESCRIPTION
    Remove a user from a Workspace. The UserID can be provided via pipeline.
.EXAMPLE
    PS C:\> Remove-ClickUpUser -TeamID 123 -UserID 456
    Remove user from ClickUp workspace with ID "123" and user with ID "456".
.EXAMPLE
    PS C:\> 456 | Remove-ClickUpUser -TeamID 123
    Pipe user ID and remove the user.
.INPUTS
    System.UInt64. You can pipe a user ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    This endpoint is only available to Workspaces on our Enterprise Plan.

    See the link for information.
.LINK
    https://developer.clickup.com/reference/removeuserfromworkspace
#>
function Remove-ClickUpUser {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [uint64]$TeamID,
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('user_id','id')]
        [uint64]$UserID
    )

    Write-Verbose 'Entering Remove-ClickUpUser'
    if ($PSCmdlet.ShouldProcess($UserID)) {
        try {
            Write-Verbose "Removing user with ID: $UserID from team ID: $TeamID"
            $User = Invoke-ClickUpAPIDelete -Endpoint "team/$TeamID/user/$UserID"
            Write-Verbose 'Successfully removed user'
            return $User.team
        } catch {
            Write-Error "Error in Remove-ClickUpUser: $($_.Exception.Message)"
            throw $_
        }
    }
}