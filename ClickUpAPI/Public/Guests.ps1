<#
.SYNOPSIS
    Get ClickUp guest.
.DESCRIPTION
    Get ClickUp guest.
.EXAMPLE
    PS C:\> Get-ClickUpGuest -TeamID 333 -GuestID 403
    Guest ClickUp guest user with ID "403" for team with ID "333".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/guests/get-guest.html
#>
function Get-ClickUpGuest {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $True)]
        [UInt32]$TeamID,
        [Parameter(Mandatory = $True)]
        [UInt32]$GuestID
    )

    $Guest = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/guest/$GuestID"
    Return $Guest.guest
}

<#
.SYNOPSIS
    Invite ClickUp guest to workspace.
.DESCRIPTION
    Invite ClickUp guest to workspace.
.EXAMPLE
    PS C:\> Add-ClickUpGuest -TeamID 333 -GuestEmail 'guest@example.com'
    Add ClickUp guest user with email "guest@example.com" for team with ID "333".
.EXAMPLE
    PS C:\> Add-ClickUpGuest -TeamID 333 -GuestEmail 'guest@example.com' -CanEditTags $true -CanSeeTimeSpent $true -CanSeeTimeEstimated $true
    Add ClickUp guest user with email "guest@example.com" for team with ID "333" and give them access to edit tags, see time spent, and see time estimated.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/invite-guest-to-workspace.html
#>
function Add-ClickUpGuest {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $True)]
        [UInt32]$TeamID,
        [Parameter(Mandatory = $True)]
        [string]$GuestEmail,
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

    $Team = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/guest" -Body $Body
    Return $Team.team
}

<#
.SYNOPSIS
    Update ClickUp guest on workspace.
.DESCRIPTION
    Update ClickUp guest on workspace.
.EXAMPLE
    PS C:\> Set-ClickUpGuest -TeamID 333 -GuestID 403 -Username 'Guest User'
    Update ClickUp guest's username to "Guest User"  for guest with ID "403".
.EXAMPLE
    PS C:\> Set-ClickUpGuest -TeamID 333 -GuestID 403 -CanEditTags $true -CanSeeTimeSpent $true -CanSeeTimeEstimated $true
    Update ClickUp guest user's permissions to edit tags, see time spent, and see time estimated for guest with ID "403".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/guests/edit-guest-on-workspace.html
#>
function Set-ClickUpGuest {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $True)]
        [UInt32]$TeamID,
        [Parameter()]
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

    $Guest = Invoke-ClickUpAPIPut -Endpoint "team/$TeamID/guest" -Body $Body
    Return $Guest.guest
}

<#
.SYNOPSIS
    Add ClickUp guest to task.
.DESCRIPTION
    Add ClickUp guest to task.
.EXAMPLE
    PS C:\> Add-ClickUpGuestToTask -TaskID c04 -GuestID 403
    Add ClickUp guest user with ID "403" to task with ID "c04" with permission level "read".
.EXAMPLE
    PS C:\> Add-ClickUpGuestToTask -TaskID c04 -GuestID 403 -PermissionLevel edit
    Add ClickUp guest user with ID "403" to task with ID "c04" with permission level "edit".
.EXAMPLE
    PS C:\> Add-ClickUpGuestToTask -TaskID CustomID -GuestID 403 -CustomTaskIDs $true -TeamID 123 -PermissionLevel edit.
    Add ClickUp guest user with  custom ID "CustomID" to task with ID "c04" with permission level "edit".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/guests/add-guest-to-task.html
#>
function Add-ClickUpGuestToTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [UInt32]$GuestID,
        [Parameter(ParameterSetName = 'TaskID')]
        [Parameter(ParameterSetName = 'CustomTaskIDs')]
        [ValidateSet('read', 'comment', 'edit', 'create')]
        [string]$PermissionLevel = 'read',
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [UInt32]$TeamID
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

    $Guest = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/guest/$GuestID" -Body $Body
    Return $Guest.guest
}

<#
.SYNOPSIS
    Add ClickUp guest to list.
.DESCRIPTION
    Add ClickUp guest to list.
.EXAMPLE
    PS C:\> Add-ClickUpGuestToList -ListID 1427 -GuestID 403
    Add ClickUp guest user with ID "403" to list with ID "1427" with permission level "read".
.EXAMPLE
    PS C:\> Add-ClickUpGuestToList -ListID 1427 -GuestID 403 -PermissionLevel edit
    Add ClickUp guest user with ID "403" to list with ID "1427" with permission level "edit".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/guests/add-guest-to-list.html
#>
function Add-ClickUpGuestToTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt32]$ListID,
        [Parameter(Mandatory = $true)]
        [UInt32]$GuestID,
        [Parameter()]
        [ValidateSet('read', 'comment', 'edit', 'create')]
        [string]$PermissionLevel = 'read'
    )

    $Body = @{
        permission_level = $PermissionLevel
    }

    $Guest = Invoke-ClickUpAPIPost -Endpoint "list/$ListID/guest/$GuestID" -Body $Body
    Return $Guest.guest
}

<#
.SYNOPSIS
    Add ClickUp guest to folder.
.DESCRIPTION
    Add ClickUp guest to folder.
.EXAMPLE
    PS C:\> Add-ClickUpGuestToFolder -FolderID 1057 -GuestID 403
    Add ClickUp guest user with ID "403" to folder with ID "1057" with permission level "read".
.EXAMPLE
    PS C:\> Add-ClickUpGuestToList -FolderID 1057 -GuestID 403 -PermissionLevel edit
    Add ClickUp guest user with ID "403" to folder with ID "1057" with permission level "edit".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/guests/add-guest-to-folder.html
#>
function Add-ClickUpGuestToFolder {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt32]$FolderID,
        [Parameter(Mandatory = $true)]
        [UInt32]$GuestID,
        [Parameter()]
        [ValidateSet('read', 'comment', 'edit', 'create')]
        [string]$PermissionLevel = 'read'
    )

    $Body = @{
        permission_level = $PermissionLevel
    }

    $Guest = Invoke-ClickUpAPIPost -Endpoint "list/$ListID/guest/$GuestID" -Body $Body
    Return $Guest.guest
}

<#
.SYNOPSIS
    Remove ClickUp guest from workspace.
.DESCRIPTION
    Remove ClickUp guest from workspace.
.EXAMPLE
    PS C:\> Remove-ClickUpGuest -TeamID 333 -GuestID 403
    Remove ClickUp guest with Id "403" from team with ID "333".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/guests/remove-guest-from-workspace.html
#>
function Remove-ClickUpGuest {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [UInt32]$TeamID,
        [Parameter(Mandatory = $true)]
        [UInt32]$GuestID
    )

    if ($PSCmdlet.ShouldProcess($GuestID)) {
        $Team = Invoke-ClickUpAPIDelete -Endpoint "team/$TeamID/guest/$GuestID"
        $Team.team
    }
}

<#
.SYNOPSIS
    Remove ClickUp guest from task.
.DESCRIPTION
    Remove ClickUp guest from task.
.EXAMPLE
    PS C:\> Remove-ClickUpGuestFromTask -TaskID 1427 -GuestID 403
    Remove ClickUp guest with Id "403" from task with ID "1427".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/guests/remove-guest-from-task.html
#>
function Remove-ClickUpGuestFromTask {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High', DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [UInt32]$GuestID,
        [Parameter(ParameterSetName = 'TaskID')]
        [Parameter(ParameterSetName = 'CustomTaskIDs')]
        [ValidateSet('read', 'comment', 'edit', 'create')]
        [string]$PermissionLevel = 'read',
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [UInt32]$TeamID
    )

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    if ($PSCmdlet.ShouldProcess($GuestID)) {
        $Guest = Invoke-ClickUpAPIDelete -Arguments $QueryString -Endpoint "task/$TaskID/guest/$GuestID"
        $Guest.guest
    }
}

<#
.SYNOPSIS
    Remove ClickUp guest from list.
.DESCRIPTION
    Remove ClickUp guest from list.
.EXAMPLE
    PS C:\> Remove-ClickUpGuestFromList -ListID c04 -GuestID 403
    Remove ClickUp guest with Id "403" from list with ID "c04".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/guests/remove-guest-from-list.html
#>
function Remove-ClickUpGuestFromList {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ListID,
        [Parameter(Mandatory = $true)]
        [UInt32]$GuestID
    )

    if ($PSCmdlet.ShouldProcess($GuestID)) {
        $Guest = Invoke-ClickUpAPIDelete -Endpoint "list/$ListID/guest/$GuestID"
        $Guest.guest
    }
}

<#
.SYNOPSIS
    Remove ClickUp guest from folder.
.DESCRIPTION
    Remove ClickUp guest from folder.
.EXAMPLE
    PS C:\> Remove-ClickUpGuestFromFolder -FolderID 1057 -GuestID 403
    Remove ClickUp guest with Id "403" from folder with ID "1057".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/guests/remove-guest-from-folder.html
#>
function Remove-ClickUpGuestFromFolder {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$FolderID,
        [Parameter(Mandatory = $true)]
        [UInt32]$GuestID
    )

    if ($PSCmdlet.ShouldProcess($GuestID)) {
        $Guest = Invoke-ClickUpAPIDelete -Endpoint "folder/$FolderID/guest/$GuestID"
        $Guest.guest
    }
}