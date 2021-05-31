<#
.SYNOPSIS
    Get ClickUp user.
.DESCRIPTION
    Get ClickUp user.

    The following user routes are only available to enterprise teams.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER UserID
    ClickUp user ID.
.EXAMPLE
    PS C:\> Get-ClickUpUser -TeamID 333 -UserID 403
    Get ClickUp user with ID "403" under team with ID "333".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for more information.

    The following user routes are only available to enterprise teams.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/users/get-user.html
#>
function Get-ClickUpUser {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp user ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$UserID
    )

    $Member = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/user/$UserID"
    Return $Member.member
}

<#
.SYNOPSIS
    Add ClickUp user to a workspace.
.DESCRIPTION
    Add ClickUp user to a workspace.

    The following user routes are only available to enterprise teams.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER EmailAddress
    Email address of the user to invite.
.PARAMETER Admin
    Set to true to make the invited user an admin.
.EXAMPLE
    PS C:\> Add-ClickUpUser -TeamID 333 -EmailAddress 'user@example.com'
    Invite user with email address "user@example.com" to ClickUp team with ID "333".
.EXAMPLE
    PS C:\> Add-ClickUpUser -TeamID 333 -EmailAddress 'user@example.com' -Admin $true
    Invite user with email address "user@example.com" to ClickUp team with ID "333" and make them an administrator.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for more information.

    The following user routes are only available to enterprise teams.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/users/invite-user-to-workspace.html
#>
function Add-ClickUpUser {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'Email address of the user to invite.')]
        [ValidateNotNullOrEmpty()]
        [string]$EmailAddress,
        [Parameter(HelpMessage = 'Set to true to make the invited user an admin.')]
        [ValidateNotNullOrEmpty()]
        [bool]$Admin = $false
    )

    $Body = @{
        email = $EmailAddress
        admin = $Admin
    }

    $Team = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/user" -Body $Body
    Return $Team.team
}

<#
.SYNOPSIS
    Update ClickUp user on a workspace.
.DESCRIPTION
    Update ClickUp user on a workspace.

    The following user routes are only available to enterprise teams.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER UserID
    ClickUp user ID.
.PARAMETER EmailAddress
    Email address of the user to invite.
.PARAMETER Admin
    Set to true to make the invited user an admin.
.EXAMPLE
    PS C:\> Set-ClickUpUser -TeamID 333 -UserID 403 -EmailAddress 'newuser@example.com'
    Update user with ID "403" with new email address "newuser@example.com".
.EXAMPLE
    PS C:\> Set-ClickUpUser -TeamID 333 -UserID 403 -Admin
    Update user with ID "403" and make them an administrator.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for more information.

    The following user routes are only available to enterprise teams.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/users/edit-user-on-workspace.html
#>
function Set-ClickUpUser {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp user ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$UserID,
        [Parameter(HelpMessage = 'Email address of the user to invite.')]
        [ValidateNotNullOrEmpty()]
        [string]$EmailAddress,
        [Parameter(HelpMessage = 'Set to true to make the invited user an admin.')]
        [ValidateNotNullOrEmpty()]
        [bool]$Admin = $false
    )

    $Body = @{
        email = $EmailAddress
        admin = $Admin
    }

    $Member = Invoke-ClickUpAPIPut -Endpoint "team/$TeamID/user/$UserID" -Body $Body
    Return $Member.member
}

<#
.SYNOPSIS
    Update ClickUp user on a workspace.
.DESCRIPTION
    Update ClickUp user on a workspace.

    The following user routes are only available to enterprise teams.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER UserID
    ClickUp user ID.
.EXAMPLE
    PS C:\> Remove-ClickUpUser -TeamID 333 -UserID 403
    Remove user with ID "403" from ClickUp team with ID "333".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for more information.

    The following user routes are only available to enterprise teams.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/users/remove-user-from-workspace.html
#>
function Remove-ClickUpUser {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp user ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$UserID
    )

    if ($PSCmdlet.ShouldProcess($TimerID)) {
        $Team = Invoke-ClickUpAPIDelete -Endpoint "team/$TeamID/user/$UserID"
        Return $Team.team
    }
}