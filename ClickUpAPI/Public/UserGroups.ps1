<#
.SYNOPSIS
    Get all user groups in a Workspace.
.DESCRIPTION
    View the user groups created via the API for a Workspace. Can accept TeamID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Get-ClickupUserGroups -TeamID 123
    Get all user groups for team with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpTeam | Get-ClickupUserGroups
    Get user groups by piping team ID from Get-ClickUpTeam.
.INPUTS
    System.UInt64. TeamID via pipeline by property name.
.OUTPUTS
    System.Object
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('team_id', 'id')]
        [uint64]$TeamID,
        [Parameter()]
        [string[]]$GroupIDs
    )

    $Arguments = @{
        team_id = $TeamID
    }

    if ($PSBoundParameters.ContainsKey('GroupIDs')) {
        $Arguments.Add('group_ids', $GroupIDs)
    }

    Write-Verbose 'Entering Get-ClickupUserGroups'
    try {
        Write-Verbose "Getting user groups for team ID: $TeamID"
        $Groups = Invoke-ClickUpAPIGet -Endpoint 'group' -Arguments $Arguments
        Write-Verbose 'Successfully retrieved user groups'
        return $Groups.groups
    } catch {
        Write-Error "Error in Get-ClickupUserGroups: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Create a new user group.
.DESCRIPTION
    Create a new user group in a Workspace. Can accept TeamID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> New-ClickUpUserGroup -TeamID 123 -Name "New Group" -Members 456, 789
    Create a new user group with name "New Group" and members with IDs "456" and "789" in team with ID "123".
.EXAMPLE
    PS C:\> New-ClickUpUserGroup -TeamID 123 -Name "New Group" -Members 456, 789 -Handle "new-group"
    Create a new user group with name "New Group" and members with IDs "456" and "789" in team with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpTeam | New-ClickUpUserGroup -Name "Pipeline Group" -Members 456, 789
    Create user group by piping team ID from Get-ClickUpTeam.
.INPUTS
    System.UInt64. TeamID via pipeline by property name.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('team_id', 'id')]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$TeamID,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter(Mandatory = $true)]
        [uint64[]]$Members,
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

    Write-Verbose 'Entering New-ClickUpUserGroup'
    try {
        Write-Verbose "Creating user group '$Name' for team ID: $TeamID"
        $Group = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/group" -Body $Body
        Write-Verbose 'Successfully created user group'
        return $Group
    } catch {
        Write-Error "Error in New-ClickUpUserGroup: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Update a user group.
.DESCRIPTION
    Update a user group in a Workspace. Can accept GroupID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Set-ClickUpUserGroup -GroupID "123-456" -Name "Updated Group" -Handle "updated-handle"
    Update user group with ID "123-456" to have name "Updated Group" and handle "updated-handle".
.EXAMPLE
    PS C:\> Get-ClickupUserGroups -TeamID 123 | Set-ClickUpUserGroup -Name "Renamed Group"
    Update user groups by piping group ID from Get-ClickupUserGroups.
.INPUTS
    System.String. GroupID via pipeline by property name.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('group_id', 'id')]
        [ValidateNotNullOrEmpty()]
        [string]$GroupID,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Handle,
        [Parameter()]
        [uint64[]]$AddMembers = @(),
        [Parameter()]
        [uint64[]]$RemoveMembers = @()
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

    Write-Verbose 'Entering Set-ClickUpUserGroup'
    try {
        Write-Verbose "Updating user group with ID: $GroupID"
        $Group = Invoke-ClickUpAPIPut -Endpoint "group/$GroupID" -Body $Body
        Write-Verbose 'Successfully updated user group'
        return $Group
    } catch {
        Write-Error "Error in Set-ClickUpUserGroup: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Delete a user group.
.DESCRIPTION
    Delete a user group in a Workspace. Can accept GroupID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Remove-ClickUpUserGroup -GroupID "123-456"
    Delete user group with ID "123-456".
.EXAMPLE
    PS C:\> Get-ClickupUserGroups -TeamID 123 | Remove-ClickUpUserGroup
    Remove user groups by piping group ID from Get-ClickupUserGroups.
.INPUTS
    System.String. GroupID via pipeline by property name.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('group_id', 'id')]
        [string]$GroupID
    )

    Write-Verbose 'Entering Remove-ClickUpUserGroup'
    if ($PSCmdlet.ShouldProcess($GroupID)) {
        try {
            Write-Verbose "Removing user group with ID: $GroupID"
            $null = Invoke-ClickUpAPIDelete -Endpoint "group/$GroupID"
            Write-Verbose 'Successfully removed user group'
        } catch {
            Write-Error "Error in Remove-ClickUpUserGroup: $($_.Exception.Message)"
            throw $_
        }
    }
}
