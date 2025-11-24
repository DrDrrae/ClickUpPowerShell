<#
.SYNOPSIS
    Get all user groups in a Workspace.
.DESCRIPTION
    View the user groups created via the API for a Workspace.
.EXAMPLE
    PS C:\> Get-ClickupUserGroups -TeamID 123
    Get all user groups for team with ID "123".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getusergroups
#>
function Get-ClickupUserGroups {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$TeamID,
        [Parameter()]
        [string[]]$GroupIDs
    )

    $Arguments = @{
        team_id = $TeamID
    }

    if ($PSBoundParameters.ContainsKey('GroupIDs')) {
        $Arguments.Add('group_ids', $GroupIDs)
    }

    $Groups = Invoke-ClickUpAPIGet -Endpoint 'group' -Arguments $Arguments
    return $Groups.groups
}

<#
.SYNOPSIS
    Create a new user group.
.DESCRIPTION
    Create a new user group in a Workspace.
.EXAMPLE
    PS C:\> New-ClickUpUserGroup -TeamID 123 -Name "New Group" -Members 456, 789
    Create a new user group with name "New Group" and members with IDs "456" and "789" in team with ID "123".
.EXAMPLE
    PS C:\> New-ClickUpUserGroup -TeamID 123 -Name "New Group" -Members 456, 789 -Handle "new-group"
    Create a new user group with name "New Group" and members with IDs "456" and "789" in team with ID "123".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createusergroup
#>
function New-ClickUpUserGroup {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [Parameter(Mandatory = $true)]
        [UInt64[]]$Members,
        [Parameter()]
        [string]$Handle
    )

    $Body = @{
        name    = $Name
        members = $Members
    }

    if ($PSBoundParameters.ContainsKey('Handle')) {
        $Body.Add('handle', $Handle)
    }

    $Group = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/group" -Body $Body
    return $Group
}

<#
.SYNOPSIS
    Update a user group.
.DESCRIPTION
    Update a user group in a Workspace.
.EXAMPLE
    PS C:\> Set-ClickUpUserGroup -GroupID "123-456" -Name "Updated Group" -Handle "updated-handle"
    Update user group with ID "123-456" to have name "Updated Group" and handle "updated-handle".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/updategroup
#>
function Set-ClickUpUserGroup {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$GroupID,
        [Parameter()]
        [string]$Name,
        [Parameter()]
        [string]$Handle,
        [Parameter()]
        [UInt64[]]$AddMembers = @(),
        [Parameter()]
        [UInt64[]]$RemoveMembers = @()
    )

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('Name')) {
        $Body.Add('name', $Name)
    }
    if ($PSBoundParameters.ContainsKey('Handle')) {
        $Body.Add('handle', $Handle)
    }
    if ($PSBoundParameters.ContainsKey('AddMembers') -or $PSBoundParameters.ContainsKey('RemoveMembers')) {
        $Body.Add('members', @{
                add    = $AddMembers
                remove = $RemoveMembers
            })
    }

    $Group = Invoke-ClickUpAPIPut -Endpoint "group/$GroupID" -Body $Body
    return $Group
}

<#
.SYNOPSIS
    Delete a user group.
.DESCRIPTION
    Delete a user group in a Workspace.
.EXAMPLE
    PS C:\> Remove-ClickUpUserGroup -GroupID "123-456"
    Delete user group with ID "123-456".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/deletegroup
#>
function Remove-ClickUpUserGroup {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$GroupID
    )

    if ($PSCmdlet.ShouldProcess($GroupID)) {
        $null = Invoke-ClickUpAPIDelete -Endpoint "group/$GroupID"
    }
}
