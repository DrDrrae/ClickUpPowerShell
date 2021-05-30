<#
.SYNOPSIS
    Get a ClickUp view.
.DESCRIPTION
    Get a ClickUp view.
.PARAMETER ViewID
    ClickUp view ID.
.EXAMPLE
    PS C:\> Get-ClickUpView -ViewID 3c
    Get a ClickUp view with ID "3c".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-view.html
#>
function Get-ClickUpView {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp view ID.')]
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
.PARAMETER TeamID
    ClickUp team ID.
.EXAMPLE
    PS C:\> Get-ClickUpTeamViews -TeamID 512
    Get ClickUp team views with team ID "512".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-team-views.html
#>
function Get-ClickUpTeamViews {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [UInt32]$TeamID
    )

    $Views = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/view"
    Return $Views.views
}

<#
.SYNOPSIS
    Get ClickUp space views.
.DESCRIPTION
    Get ClickUp space views.
.PARAMETER SpaceID
    ClickUp space ID.
.EXAMPLE
    PS C:\> Get-ClickUpSpaceViews -SpaceID 790
    Get ClickUp space views with space ID "790".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-space-views.html
#>
function Get-ClickUpSpaceViews {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp space ID.')]
        [UInt32]$SpaceID
    )

    $Views = Invoke-ClickUpAPIGet -Endpoint "space/$SpaceID/view"
    Return $Views.views
}

<#
.SYNOPSIS
    Get ClickUp folder views.
.DESCRIPTION
    Get ClickUp folder views.
.PARAMETER FolderID
    ClickUp folder ID.
.EXAMPLE
    PS C:\> Get-ClickUpFolderViews -FolderID 124
    Get ClickUp folder views with folder ID "124".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-folder-views.html
#>
function Get-ClickUpListViews {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp folder ID.')]
        [UInt32]$FolderID
    )

    $Views = Invoke-ClickUpAPIGet -Endpoint "folder/$FolderID/view"
    Return $Views.views
}

<#
.SYNOPSIS
    Get ClickUp list views.
.DESCRIPTION
    Get ClickUp list views.
.PARAMETER ListID
    ClickUp list ID.
.EXAMPLE
    PS C:\> Get-ClickUpListViews -ListID 124
    Get ClickUp list views with list ID "124".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-list-views.html
#>
function Get-ClickUpListViews {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp list ID.')]
        [UInt32]$ListID
    )

    $Views = Invoke-ClickUpAPIGet -Endpoint "list/$ListID/view"
    Return $Views.views
}

<#
.SYNOPSIS
    Get ClickUp view tasks.
.DESCRIPTION
    Get ClickUp view tasks.

    This request will always return paged responses. If you do not include the page parameter, it will return page 0. Each page includes 30 tasks.
.PARAMETER ViewID
    ClickUp view ID.
.PARAMETER Page
    Page number to return.
.EXAMPLE
    PS C:\> Get-ClickUpViewTasks -ViewID 3c
    Get a ClickUp view tasks with ID "3c".
.EXAMPLE
    PS C:\> Get-ClickUpViewTasks -ViewID 3c -Page 2
    Get ClickUp view tasks with ID "3c" staring on page "2".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.

    This request will always return paged responses. If you do not include the page parameter, it will return page 0. Each page includes 30 tasks.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-view-tasks.html
#>
function Get-ClickUpViewTaks {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp view ID.')]
        [string]$ViewID,
        [Parameter(HelpMessage = 'Page number to return.')]
        [UInt32]$Page = 0
    )

    $QueryString = @{
        page = $Page
    }

    $Views = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "view/$ViewID/task"
    Return $Views.views
}

<#
.SYNOPSIS
    Create new ClickUp team view.
.DESCRIPTION
    Create new ClickUp team view.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER Body
    Hashtable containing the setting and parameters to create.
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
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/create-team-view.html
#>
function New-ClickUpTeamView {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [UInt32]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'Hashtable containing the setting and parameters to create.')]
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
.PARAMETER SpaceID
    ClickUp space ID.
.PARAMETER Body
    Hashtable containing the setting and parameters to create.
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
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/create-space-view.html
#>
function New-ClickUpSpaceView {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp space ID.')]
        [UInt32]$SpaceID,
        [Parameter(Mandatory = $true, HelpMessage = 'Hashtable containing the setting and parameters to create.')]
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
.PARAMETER FolderID
    ClickUp folder ID.
.PARAMETER Body
    Hashtable containing the setting and parameters to create.
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
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/create-folder-view.html
#>
function New-ClickUpListView {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp folder ID.')]
        [UInt32]$FolderID,
        [Parameter(Mandatory = $true, HelpMessage = 'Hashtable containing the setting and parameters to create.')]
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
.PARAMETER ListID
    ClickUp list ID.
.PARAMETER Body
    Hashtable containing the setting and parameters to create.
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
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/create-list-view.html
#>
function New-ClickUpListViews {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp list ID.')]
        [UInt32]$ListID,
        [Parameter(Mandatory = $true, HelpMessage = 'Hashtable containing the setting and parameters to create.')]
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
.PARAMETER ViewID
    ClickUp view ID.
.PARAMETER Body
    Hashtable containing the setting and parameters to update.
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
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/views/update-view.html
#>
function Set-ClickUpView {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp view ID.')]
        [string]$ViewID,
        [Parameter(Mandatory = $true, HelpMessage = 'Hashtable containing the setting and parameters to update.')]
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
.PARAMETER ViewID
    ClickUp view ID.
.EXAMPLE
    PS C:\> Remove-ClickUpView -ViewID 3c
    Get a ClickUp view with ID "3c".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
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
        [Parameter(Mandatory = $true, HelpMessage = 'lickUp view ID.')]
        [string]$ViewID
    )

    if ($PSCmdlet.ShouldProcess($WebhookID)) {
        Invoke-ClickUpAPIDelete -Endpoint "view/$ViewID"
    }
}
