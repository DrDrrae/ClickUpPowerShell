<#
.SYNOPSIS
    Get a ClickUp view.
.DESCRIPTION
    Get a ClickUp view.
.EXAMPLE
    PS C:\> Get-ClickUpView -ViewID 3c
    Get a ClickUp view with ID "3c".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getview
#>
function Get-ClickUpView {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ViewID
    )

    $View = Invoke-ClickUpAPIGet -Endpoint "view/$ViewID"
    return $View.view
}

<#
.SYNOPSIS
    Get ClickUp team views.
.DESCRIPTION
    View the task and page views available at the Everything Level of a Workspace.
.EXAMPLE
    PS C:\> Get-ClickUpTeamViews -TeamID 512
    Get ClickUp team views with team ID "512".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getview
#>
function Get-ClickUpTeamViews {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$TeamID
    )

    $Views = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/view"
    return $Views.views
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getspaceviews
#>
function Get-ClickUpSpaceViews {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$SpaceID
    )

    $Views = Invoke-ClickUpAPIGet -Endpoint "space/$SpaceID/view"
    return $Views.views
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getfolderviews
#>
function Get-ClickUpListViews {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$FolderID
    )

    $Views = Invoke-ClickUpAPIGet -Endpoint "folder/$FolderID/view"
    return $Views.views
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getlistviews
#>
function Get-ClickUpListViews {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$ListID
    )

    $Views = Invoke-ClickUpAPIGet -Endpoint "list/$ListID/view"
    return $Views.views
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getviewtasks
#>
function Get-ClickUpViewTasks {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
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
    return $Views.tasks
}

<#
.SYNOPSIS
    Create new ClickUp team view.
.DESCRIPTION
    Add a List, Board, Calendar, Table, Timeline, Workload, Activity, Map, Chat, or Gantt view at the Everything Level of a Workspace.
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createteamview
#>
function New-ClickUpTeamView {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $View = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/view" -Body $Body
    return $View.view
}

<#
.SYNOPSIS
    Create new ClickUp space view.
.DESCRIPTION
    Add a List, Board, Calendar, Table, Timeline, Workload, Activity, Map, Chat, or Gantt view to a Space.
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createspaceview
#>
function New-ClickUpSpaceView {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$SpaceID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $View = Invoke-ClickUpAPIPost -Endpoint "space/$SpaceID/view" -Body $Body
    return $View.view
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createfolderview
#>
function New-ClickUpFolderView {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$FolderID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $View = Invoke-ClickUpAPIPost -Endpoint "folder/$FolderID/view" -Body $Body
    return $View.view
}

<#
.SYNOPSIS
    Create new ClickUp list view.
.DESCRIPTION
    Add a List, Board, Calendar, Table, Timeline, Workload, Activity, Map, Chat, or Gantt view to a List.
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createlistview
#>
function New-ClickUpListView {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$ListID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $View = Invoke-ClickUpAPIPost -Endpoint "list/$ListID/view" -Body $Body
    return $View.view
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
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/updateview
#>
function Set-ClickUpView {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ViewID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $View = Invoke-ClickUpAPIPost -Endpoint "list/$ListID/view" -Body $Body
    return $View.view
}

<#
.SYNOPSIS
    Remove a ClickUp view.
.DESCRIPTION
    Remove a ClickUp view.
.EXAMPLE
    PS C:\> Remove-ClickUpView -ViewID 3c
    Remove a ClickUp view with ID "3c".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any value.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/deleteview
#>
function Remove-ClickUpView {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ViewID
    )

    if ($PSCmdlet.ShouldProcess($ViewID)) {
        $null = Invoke-ClickUpAPIDelete -Endpoint "view/$ViewID"
    }
}
