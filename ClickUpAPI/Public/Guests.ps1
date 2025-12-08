<#
.SYNOPSIS
    Get ClickUp guest.
.DESCRIPTION
    Get ClickUp guest. Can accept TeamID and GuestID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Get-ClickUpGuest -TeamID 333 -GuestID 403
    Gets ClickUp guest user with ID "403" for team with ID "333".
.EXAMPLE
    PS C:\> Get-ClickUpAuthorizedUser | Select-Object -ExpandProperty team | Select-Object -First 1 | Get-ClickUpGuest -GuestID 403
    Gets ClickUp guest by piping team ID from Get-ClickUpAuthorizedUser.
.INPUTS
    System.UInt64. TeamID via pipeline by property name.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getguest
#>
function Get-ClickUpGuest {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('team_id', 'id')]
        [uint64]$TeamID,
        [Parameter(Mandatory = $True)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$GuestID
    )

    Write-Verbose "Getting guest with ID: $GuestID for team ID: $TeamID"
    try {
        $Guest = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/guest/$GuestID"
        Write-Verbose "Successfully retrieved guest: $($Guest.guest.username) (ID: $($Guest.guest.id))"
        return $Guest.guest
    } catch {
        Write-Error "Failed to get guest with ID $GuestID for team ID $TeamID. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Invite ClickUp guest to workspace.
.DESCRIPTION
    Invite ClickUp guest to workspace. Can accept TeamID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Add-ClickUpGuest -TeamID 333 -GuestEmail 'guest@example.com'
    Invites ClickUp guest user with email "guest@example.com" for team with ID "333".
.EXAMPLE
    PS C:\> Add-ClickUpGuest -TeamID 333 -GuestEmail 'guest@example.com' -CanEditTags $true -CanSeeTimeSpent $true -CanSeeTimeEstimated $true
    Invites ClickUp guest user with email "guest@example.com" for team with ID "333" and gives them access to edit tags, see time spent, and see time estimated.
.EXAMPLE
    PS C:\> Get-ClickUpAuthorizedWorkspaces | Get-ClickUpTeam | Select-Object -First 1 | Add-ClickUpGuest -GuestEmail 'guest@example.com'
    Invites guest by piping team ID from Get-ClickUpTeam.
.INPUTS
    System.UInt64. TeamID via pipeline by property name.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/inviteguesttoworkspace
#>
function Add-ClickUpGuest {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('team_id', 'id')]
        [uint64]$TeamID,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern(@'
^(?!\.)(?!.*\.\.)([a-z0-9_'+\-\.]*)[a-z0-9_'+\-]@([a-z0-9][a-z0-9\-]*\.)+[a-z]{2,}$
'@)]
        [System.Net.Mail.MailAddress]$GuestEmail,
        [Parameter()]
        [bool]$CanEditTags = $false,
        [Parameter()]
        [bool]$CanSeeTimeSpent = $false,
        [Parameter()]
        [bool]$CanSeeTimeEstimated = $false
    )

    $Body = @{
        email                  = $GuestEmail
        can_edit_tags          = $CanEditTags
        can_see_time_spent     = $CanSeeTimeSpent
        can_see_time_estimated = $CanSeeTimeEstimated
    }

    Write-Verbose "Inviting guest '$GuestEmail' to team ID: $TeamID"
    try {
        $Team = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/guest" -Body $Body
        Write-Verbose "Successfully invited guest '$GuestEmail' to team ID: $TeamID"
        return $Team.team
    } catch {
        Write-Error "Failed to invite guest '$GuestEmail' to team ID $TeamID. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Update ClickUp guest on workspace.
.DESCRIPTION
    Update ClickUp guest on workspace. Can accept TeamID and GuestID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Set-ClickUpGuest -TeamID 333 -GuestID 403 -Username 'Guest User'
    Updates ClickUp guest's username to "Guest User" for guest with ID "403".
.EXAMPLE
    PS C:\> Set-ClickUpGuest -TeamID 333 -GuestID 403 -CanEditTags $true -CanSeeTimeSpent $true -CanSeeTimeEstimated $true
    Updates ClickUp guest user's permissions to edit tags, see time spent, and see time estimated for guest with ID "403".
.EXAMPLE
    PS C:\> Get-ClickUpGuest -TeamID 333 -GuestID 403 | Set-ClickUpGuest -Username 'Updated Guest User'
    Updates guest by piping guest object from Get-ClickUpGuest.
.INPUTS
    System.UInt64. TeamID via pipeline by property name.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/editguestonworkspace
#>
function Set-ClickUpGuest {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('team_id', 'id')]
        [uint64]$TeamID,
        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('guest_id')]
        [uint64]$GuestID,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Username,
        [Parameter()]
        [bool]$CanEditTags = $false,
        [Parameter()]
        [bool]$CanSeeTimeSpent = $false,
        [Parameter()]
        [bool]$CanSeeTimeEstimated = $false
    )

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('Username')) {
        $Body.Add('username', $Username)
    }
    if ($PSBoundParameters.ContainsKey('CanEditTags')) {
        $Body.Add('can_edit_tags', $CanEditTags)
    }
    if ($PSBoundParameters.ContainsKey('CanSeeTimeSpent')) {
        $Body.Add('can_see_time_spent', $CanSeeTimeSpent)
    }
    if ($PSBoundParameters.ContainsKey('CanSeeTimeEstimated')) {
        $Body.Add('can_see_time_estimated', $CanSeeTimeEstimated)
    }

    Write-Verbose "Updating guest with ID: $GuestID for team ID: $TeamID"
    try {
        $Guest = Invoke-ClickUpAPIPut -Endpoint "team/$TeamID/guest/$GuestID" -Body $Body
        Write-Verbose "Successfully updated guest with ID: $GuestID"
        return $Guest.guest
    } catch {
        Write-Error "Failed to update guest with ID $GuestID for team ID $TeamID. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Add ClickUp guest to task.
.DESCRIPTION
    Add ClickUp guest to task. Can accept TaskID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Add-ClickUpGuestToTask -TaskID c04 -GuestID 403
    Adds ClickUp guest user with ID "403" to task with ID "c04" with permission level "read".
.EXAMPLE
    PS C:\> Add-ClickUpGuestToTask -TaskID c04 -GuestID 403 -PermissionLevel edit
    Adds ClickUp guest user with ID "403" to task with ID "c04" with permission level "edit".
.EXAMPLE
    PS C:\> Add-ClickUpGuestToTask -TaskID CustomID -GuestID 403 -CustomTaskIDs $true -TeamID 123 -PermissionLevel edit
    Adds ClickUp guest user with custom task ID "CustomID" to task with permission level "edit".
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID c04 | Add-ClickUpGuestToTask -GuestID 403
    Adds guest to task by piping task ID from Get-ClickUpTask.
.INPUTS
    System.String. TaskID via pipeline by property name.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/addguesttotask
#>
function Add-ClickUpGuestToTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', ValueFromPipelineByPropertyName = $true)]
        [Alias('task_id', 'id')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [uint64]$GuestID,
        [Parameter(ParameterSetName = 'TaskID')]
        [Parameter(ParameterSetName = 'CustomTaskIDs')]
        [ValidateSet('read', 'comment', 'edit', 'create')]
        [string]$PermissionLevel = 'read',
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [uint64]$TeamID
    )

    $Body = @{
        permission_level = $PermissionLevel
    }

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    Write-Verbose "Adding guest with ID: $GuestID to task ID: $TaskID"
    try {
        $Guest = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/guest/$GuestID" -Body $Body
        Write-Verbose "Successfully added guest with ID: $GuestID to task ID: $TaskID"
        return $Guest.guest
    } catch {
        Write-Error "Failed to add guest with ID $GuestID to task ID $TaskID. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Add ClickUp guest to list.
.DESCRIPTION
    Add ClickUp guest to list. Can accept ListID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Add-ClickUpGuestToList -ListID 1427 -GuestID 403
    Adds ClickUp guest user with ID "403" to list with ID "1427" with permission level "read".
.EXAMPLE
    PS C:\> Add-ClickUpGuestToList -ListID 1427 -GuestID 403 -PermissionLevel edit
    Adds ClickUp guest user with ID "403" to list with ID "1427" with permission level "edit".
.EXAMPLE
    PS C:\> Get-ClickUpList -ListID 1427 | Add-ClickUpGuestToList -GuestID 403
    Adds guest to list by piping list ID from Get-ClickUpList.
.INPUTS
    System.UInt64. ListID via pipeline by property name.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/addguesttolist
#>
function Add-ClickUpGuestToList {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('list_id', 'id')]
        [uint64]$ListID,
        [Parameter(Mandatory = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$GuestID,
        [Parameter()]
        [ValidateSet('read', 'comment', 'edit', 'create')]
        [string]$PermissionLevel = 'read'
    )

    $Body = @{
        permission_level = $PermissionLevel
    }

    Write-Verbose "Adding guest with ID: $GuestID to list ID: $ListID"
    try {
        $Guest = Invoke-ClickUpAPIPost -Endpoint "list/$ListID/guest/$GuestID" -Body $Body
        Write-Verbose "Successfully added guest with ID: $GuestID to list ID: $ListID"
        return $Guest.guest
    } catch {
        Write-Error "Failed to add guest with ID $GuestID to list ID $ListID. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Add ClickUp guest to folder.
.DESCRIPTION
    Add ClickUp guest to folder. Can accept FolderID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Add-ClickUpGuestToFolder -FolderID 1057 -GuestID 403
    Adds ClickUp guest user with ID "403" to folder with ID "1057" with permission level "read".
.EXAMPLE
    PS C:\> Add-ClickUpGuestToFolder -FolderID 1057 -GuestID 403 -PermissionLevel edit
    Adds ClickUp guest user with ID "403" to folder with ID "1057" with permission level "edit".
.EXAMPLE
    PS C:\> Get-ClickUpFolder -FolderID 1057 | Add-ClickUpGuestToFolder -GuestID 403
    Adds guest to folder by piping folder ID from Get-ClickUpFolder.
.INPUTS
    System.UInt64. FolderID via pipeline by property name.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/addguesttofolder
#>
function Add-ClickUpGuestToFolder {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('folder_id', 'id')]
        [uint64]$FolderID,
        [Parameter(Mandatory = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$GuestID,
        [Parameter()]
        [ValidateSet('read', 'comment', 'edit', 'create')]
        [string]$PermissionLevel = 'read'
    )

    $Body = @{
        permission_level = $PermissionLevel
    }

    Write-Verbose "Adding guest with ID: $GuestID to folder ID: $FolderID"
    try {
        $Guest = Invoke-ClickUpAPIPost -Endpoint "folder/$FolderID/guest/$GuestID" -Body $Body
        Write-Verbose "Successfully added guest with ID: $GuestID to folder ID: $FolderID"
        return $Guest.guest
    } catch {
        Write-Error "Failed to add guest with ID $GuestID to folder ID $FolderID. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Remove ClickUp guest from workspace.
.DESCRIPTION
    Remove ClickUp guest from workspace. Can accept TeamID and GuestID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Remove-ClickUpGuest -TeamID 333 -GuestID 403
    Removes ClickUp guest with ID "403" from team with ID "333".
.EXAMPLE
    PS C:\> Get-ClickUpGuest -TeamID 333 -GuestID 403 | Remove-ClickUpGuest
    Removes guest by piping guest object from Get-ClickUpGuest.
.INPUTS
    System.UInt64. TeamID and GuestID via pipeline by property name.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/removeguestfromworkspace
#>
function Remove-ClickUpGuest {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('team_id', 'id')]
        [uint64]$TeamID,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('guest_id')]
        [uint64]$GuestID
    )

    if ($PSCmdlet.ShouldProcess($GuestID, 'Remove Guest from Workspace')) {
        Write-Verbose "Removing guest with ID: $GuestID from team ID: $TeamID"
        try {
            $Team = Invoke-ClickUpAPIDelete -Endpoint "team/$TeamID/guest/$GuestID"
            Write-Verbose "Successfully removed guest with ID: $GuestID from team ID: $TeamID"
            return $Team.team
        } catch {
            Write-Error "Failed to remove guest with ID $GuestID from team ID $TeamID. Error: $_"
            throw $_
        }
    }
}

<#
.SYNOPSIS
    Remove ClickUp guest from task.
.DESCRIPTION
    Remove ClickUp guest from task. Can accept TaskID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Remove-ClickUpGuestFromTask -TaskID 1427 -GuestID 403
    Removes ClickUp guest with ID "403" from task with ID "1427".
.EXAMPLE
    PS C:\> Remove-ClickUpGuestFromTask -TaskID CustomID -GuestID 403 -CustomTaskIDs $true -TeamID 123
    Removes ClickUp guest from task with custom task ID.
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID 1427 | Remove-ClickUpGuestFromTask -GuestID 403
    Removes guest from task by piping task ID from Get-ClickUpTask.
.INPUTS
    System.String. TaskID via pipeline by property name.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/removeguestfromtask
#>
function Remove-ClickUpGuestFromTask {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High', DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('task_id', 'id')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$GuestID,
        [Parameter(ParameterSetName = 'TaskID')]
        [Parameter(ParameterSetName = 'CustomTaskIDs')]
        [ValidateSet('read', 'comment', 'edit', 'create')]
        [string]$PermissionLevel = 'read',
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$TeamID
    )

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    if ($PSCmdlet.ShouldProcess($GuestID, 'Remove Guest from Task')) {
        Write-Verbose "Removing guest with ID: $GuestID from task ID: $TaskID"
        try {
            $Guest = Invoke-ClickUpAPIDelete -Arguments $QueryString -Endpoint "task/$TaskID/guest/$GuestID"
            Write-Verbose "Successfully removed guest with ID: $GuestID from task ID: $TaskID"
            return $Guest.guest
        } catch {
            Write-Error "Failed to remove guest with ID $GuestID from task ID $TaskID. Error: $_"
            throw $_
        }
    }
}

<#
.SYNOPSIS
    Remove ClickUp guest from list.
.DESCRIPTION
    Remove ClickUp guest from list. Can accept ListID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Remove-ClickUpGuestFromList -ListID c04 -GuestID 403
    Removes ClickUp guest with ID "403" from list with ID "c04".
.EXAMPLE
    PS C:\> Get-ClickUpList -ListID c04 | Remove-ClickUpGuestFromList -GuestID 403
    Removes guest from list by piping list ID from Get-ClickUpList.
.INPUTS
    System.String. ListID via pipeline by property name.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/removeguestfromlist
#>
function Remove-ClickUpGuestFromList {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('list_id', 'id')]
        [string]$ListID,
        [Parameter(Mandatory = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$GuestID
    )

    if ($PSCmdlet.ShouldProcess($GuestID, 'Remove Guest from List')) {
        Write-Verbose "Removing guest with ID: $GuestID from list ID: $ListID"
        try {
            $Guest = Invoke-ClickUpAPIDelete -Endpoint "list/$ListID/guest/$GuestID"
            Write-Verbose "Successfully removed guest with ID: $GuestID from list ID: $ListID"
            return $Guest.guest
        } catch {
            Write-Error "Failed to remove guest with ID $GuestID from list ID $ListID. Error: $_"
            throw $_
        }
    }
}

<#
.SYNOPSIS
    Remove ClickUp guest from folder.
.DESCRIPTION
    Remove ClickUp guest from folder. Can accept FolderID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Remove-ClickUpGuestFromFolder -FolderID 1057 -GuestID 403
    Removes ClickUp guest with ID "403" from folder with ID "1057".
.EXAMPLE
    PS C:\> Get-ClickUpFolder -FolderID 1057 | Remove-ClickUpGuestFromFolder -GuestID 403
    Removes guest from folder by piping folder ID from Get-ClickUpFolder.
.INPUTS
    System.String. FolderID via pipeline by property name.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/removeguestfromfolder
#>
function Remove-ClickUpGuestFromFolder {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('folder_id', 'id')]
        [string]$FolderID,
        [Parameter(Mandatory = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [uint64]$GuestID
    )

    if ($PSCmdlet.ShouldProcess($GuestID, 'Remove Guest from Folder')) {
        Write-Verbose "Removing guest with ID: $GuestID from folder ID: $FolderID"
        try {
            $Guest = Invoke-ClickUpAPIDelete -Endpoint "folder/$FolderID/guest/$GuestID"
            Write-Verbose "Successfully removed guest with ID: $GuestID from folder ID: $FolderID"
            return $Guest.guest
        } catch {
            Write-Error "Failed to remove guest with ID $GuestID from folder ID $FolderID. Error: $_"
            throw $_
        }
    }
}