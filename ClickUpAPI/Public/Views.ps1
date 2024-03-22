<#
.SYNOPSIS
    Get a ClickUp view.
.DESCRIPTION
    Get a ClickUp view.
.EXAMPLE
    PS C:\> Get-ClickUpView -ViewID 3c
    Get a ClickUp view with ID "3c".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-view.html
#>
function Get-ClickUpView {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ViewID
    )

    $View = Invoke-ClickUpAPIGet -Endpoint "view/$ViewID"
    Return $View.view
}

<#
.SYNOPSIS
    Get ClickUp team views.
.DESCRIPTION
    Get ClickUp team views.
.EXAMPLE
    PS C:\> Get-ClickUpTeamViews -TeamID 512
    Get ClickUp team views with team ID "512".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-team-views.html
#>
function Get-ClickUpTeamViews {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$TeamID
    )

    $Views = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/view"
    Return $Views.views
}

<#
.SYNOPSIS
    Get ClickUp space views.
.DESCRIPTION
    Get ClickUp space views.
.EXAMPLE
    PS C:\> Get-ClickUpSpaceViews -SpaceID 790
    Get ClickUp space views with space ID "790".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-space-views.html
#>
function Get-ClickUpSpaceViews {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$SpaceID
    )

    $Views = Invoke-ClickUpAPIGet -Endpoint "space/$SpaceID/view"
    Return $Views.views
}

<#
.SYNOPSIS
    Get ClickUp folder views.
.DESCRIPTION
    Get ClickUp folder views.
.EXAMPLE
    PS C:\> Get-ClickUpFolderViews -FolderID 124
    Get ClickUp folder views with folder ID "124".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-folder-views.html
#>
function Get-ClickUpListViews {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$FolderID
    )

    $Views = Invoke-ClickUpAPIGet -Endpoint "folder/$FolderID/view"
    Return $Views.views
}

<#
.SYNOPSIS
    Get ClickUp list views.
.DESCRIPTION
    Get ClickUp list views.
.EXAMPLE
    PS C:\> Get-ClickUpListViews -ListID 124
    Get ClickUp list views with list ID "124".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-list-views.html
#>
function Get-ClickUpListViews {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$ListID
    )

    $Views = Invoke-ClickUpAPIGet -Endpoint "list/$ListID/view"
    Return $Views.views
}

<#
.SYNOPSIS
    Get ClickUp view tasks.
.DESCRIPTION
    Get ClickUp view tasks.
.EXAMPLE
    PS C:\> Get-ClickUpViewTasks -ViewID 3c
    Get a ClickUp view tasks with ID "3c".
.EXAMPLE
    PS C:\> Get-ClickUpViewTasks -ViewID 3c -Page 2
    Get ClickUp view tasks with ID "3c" staring on page "2".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-view-tasks.html
#>
function Get-ClickUpViewTaks {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ViewID,
        [Parameter()]
        [UInt64]$Page = 0
    )

    $QueryString = @{
        page = $Page
    }

    $Views = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "view/$ViewID/task"
    Return $Views.tasks
}

<#
.SYNOPSIS
    Create new ClickUp team view.
.DESCRIPTION
    Create new ClickUp team view.
.EXAMPLE
    PS C:\> $body = @{
    >> name = "new team view name"
    >> type = "list"
    >> grouping = @{
    >> field = 'status'
    >> dir = 1
    >> }
    >> }
    PS C:\> New-ClickUpTeamView -TeamID 512 -Body $Body
    Create new ClickUp team view for team with ID "512".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/create-team-view.html
#>
function New-ClickUpTeamView {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $View = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/view" -Body $Body
    Return $View.view
}

<#
.SYNOPSIS
    Create new ClickUp space view.
.DESCRIPTION
    Create new ClickUp space view.
.EXAMPLE
    PS C:\> $body = @{
    >> name = "new space view name"
    >> type = "list"
    >> grouping = @{
    >> field = 'status'
    >> dir = 1
    >> }
    >> }
    PS C:\> New-ClickUpSpaceView -SpaceID 790 -Body $Body
    Create new ClickUp space view for space with ID "790".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/create-space-view.html
#>
function New-ClickUpSpaceView {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$SpaceID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $View = Invoke-ClickUpAPIPost -Endpoint "space/$SpaceID/view" -Body $Body
    Return $View.view
}

<#
.SYNOPSIS
    Create new ClickUp folder view.
.DESCRIPTION
    Create new ClickUp folder view.
.EXAMPLE
    PS C:\> $body = @{
    >> name = "new folder view name"
    >> type = "list"
    >> grouping = @{
    >> field = 'status'
    >> dir = 1
    >> }
    >> }
    PS C:\> Get-ClickUpFolderViews -FolderID 124 -Body $Body
    Create new ClickUp folder view for folder with ID "124".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/create-folder-view.html
#>
function New-ClickUpListView {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$FolderID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $Views = Invoke-ClickUpAPIPost -Endpoint "folder/$FolderID/view" -Body $Body
    Return $Views.views
}

<#
.SYNOPSIS
    Create new ClickUp list view.
.DESCRIPTION
    Create new ClickUp lsit view.
.EXAMPLE
    PS C:\> $body = @{
    >> name = "new list view name"
    >> type = "list"
    >> grouping = @{
    >> field = 'status'
    >> dir = 1
    >> }
    >> }
    PS C:\> Get-ClickUpListViews -ListID 124 -Body $Body
    Create new ClickUp list view for list with ID "124".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/create-list-view.html
#>
function New-ClickUpListViews {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$ListID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $Views = Invoke-ClickUpAPIPost -Endpoint "list/$ListID/view" -Body $Body
    Return $Views.views
}

<#
.SYNOPSIS
    Update ClickUp view.
.DESCRIPTION
    Update ClickUp view.
.EXAMPLE
    PS C:\> $body = @{
    >> name = "new list name"
    >> type = "list"
    >> grouping = @{
    >> field = 'status'
    >> dir = 1
    >> }
    >> }
    PS C:\> Set-ClickUpView -ViewID 3c -Body $Body
    Update aClickUp view with ID "124".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/update-view.html
#>
function Set-ClickUpView {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ViewID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $Views = Invoke-ClickUpAPIPost -Endpoint "list/$ListID/view" -Body $Body
    Return $Views.views
}

<#
.SYNOPSIS
    Remove a ClickUp view.
.DESCRIPTION
    Remove a ClickUp view.
.EXAMPLE
    PS C:\> Remove-ClickUpView -ViewID 3c
    Get a ClickUp view with ID "3c".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-view.html
#>
function Remove-ClickUpView {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ViewID
    )

    if ($PSCmdlet.ShouldProcess($WebhookID)) {
        Invoke-ClickUpAPIDelete -Endpoint "view/$ViewID"
    }
}
