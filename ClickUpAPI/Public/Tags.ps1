<#
.SYNOPSIS
    Get all ClickUp space tags.
.DESCRIPTION
    Get all ClickUp space tags.
.PARAMETER SpaceID
    ClickUp space ID.
.EXAMPLE
    PS C:\> Get-ClickUpTags -SpaceID 512
    Get all ClickUp tags for space with ID "512".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tags/get-space-tags.html
#>
function Get-ClickUpTags {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp space ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt32]$SpaceID
    )

    $Tags = Invoke-ClickUpAPIGet-Endpoint "space/$SpaceID/tag"
    Return $Tags.tags
}

<#
.SYNOPSIS
    Create a new ClickUp space tag.
.DESCRIPTION
    Create a new ClickUp space tag.
.PARAMETER SpaceID
    ClickUp space ID.
.PARAMETER TagName
    Name of the new ClickUp tag.
.PARAMETER ForegroundColor
    Foreground color of the new ClickUp tag.
.PARAMETER BackgroundColor
    Background color of the new ClickUp tag.
.EXAMPLE
    PS C:\> New-ClickUpTag -SpaceID 512 -Name "Tag Name" -ForegroundColor "#ffffff" -BackgroundColor "#000000"
    Create a new ClickUp tag for space with ID "512" with the name "Tag Name", foreground color white, and background color black.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tags/create-space-tag.html
#>
function New-ClickUpTag {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp space ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt32]$SpaceID,
        [Parameter(Mandatory = $true, HelpMessage = 'Name of the new ClickUp tag.')]
        [ValidateNotNullOrEmpty()]
        [string]$TagName,
        [Parameter(HelpMessage = 'Foreground color of the new ClickUp tag.')]
        [ValidateNotNullOrEmpty()]
        [string]$ForegroundColor,
        [Parameter(HelpMessage = 'Background color of the new ClickUp tag.')]
        [ValidateNotNullOrEmpty()]
        [string]$BackgroundColor
    )

    $Body = @{
        name = $TagName
    }

    if ($PSBoundParameters.ContainsKey('ForegroundColor')) {
        $Body.Add('tag_fg', $ForegroundColor)
    }
    if ($PSBoundParameters.ContainsKey('BackgroundColor')) {
        $Body.Add('tag_bg', $BackgroundColor)
    }

    Invoke-ClickUpAPIPost-Endpoint "space/$SpaceID/tag" -Body $Body
}


<#
.SYNOPSIS
    Update a ClickUp space tag.
.DESCRIPTION
    Update a ClickUp space tag.
.PARAMETER SpaceID
    ClickUp space ID.
.PARAMETER TagName
    Name of the ClickUp tag.
.PARAMETER NewName
    New name of the clickUp tag.
.PARAMETER ForegroundColor
    New foreground color of the ClickUp tag.
.PARAMETER BackgroundColor
    New background color of the ClickUp tag.
.EXAMPLE
    PS C:\> Set-ClickUpTag -SpaceID 512 -TagName "Tag Name" -NewName "Updated Tag" -ForegroundColor "#ffffff" -BackgroundColor "#000000"
    Update a ClickUp tag with name "Tag Name" for space with ID "512" to the name "Updated Tag", foreground color to white, and background color to black.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tags/edit-space-tag.html
#>
function Set-ClickUpTag {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp space ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt32]$SpaceID,
        [Parameter(Mandatory = $true, HelpMessage = 'Name of the ClickUp tag.')]
        [ValidateNotNullOrEmpty()]
        [string]$TagName,
        [Parameter(HelpMessage = 'New name of the clickUp tag.')]
        [ValidateNotNullOrEmpty()]
        [string]$NewName,
        [Parameter(HelpMessage = 'New foreground color of the ClickUp tag.')]
        [ValidateNotNullOrEmpty()]
        [string]$ForegroundColor,
        [Parameter(HelpMessage = 'New background color of the ClickUp tag.')]
        [ValidateNotNullOrEmpty()]
        [string]$BackgroundColor
    )

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('NewName')) {
        $Body.Add('name', $NewName)
    }
    if ($PSBoundParameters.ContainsKey('ForegroundColor')) {
        $Body.Add('tag_fg', $ForegroundColor)
    }
    if ($PSBoundParameters.ContainsKey('BackgroundColor')) {
        $Body.Add('tag_bg', $BackgroundColor)
    }

    Invoke-ClickUpAPIPut-Endpoint "space/$SpaceID/tag/$TagName" -Body $Body
}

<#
.SYNOPSIS
    Get all ClickUp space tags.
.DESCRIPTION
    Get all ClickUp space tags.
.PARAMETER SpaceID
    ClickUp space ID.
.PARAMETER TagName
    Name of the ClickUp tag.
.EXAMPLE
    PS C:\> Remove-ClickUpTag -SpaceID 512 -TagName "Tag name"
    Remove a ClickUp tag with name "Tag Name" for space with ID "512".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tags/delete-space-tag.html
#>
function Remove-ClickUpTag {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp space ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt32]$SpaceID,
        [Parameter(Mandatory = $true, HelpMessage = 'Name of the ClickUp tag.')]
        [ValidateNotNullOrEmpty()]
        [string]$TagName
    )

    if ($PSCmdlet.ShouldProcess($Name)) {
        Invoke-ClickUpAPIDelete -Endpoint "space/$SpaceID/tag/$TagName"
    }
}

<#
.SYNOPSIS
    Add ClickUp tag to task.
.DESCRIPTION
    Add ClickUp tag to task.
.PARAMETER TaskID
    ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER TagName
    Name of the ClickUp tag.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to true.
.EXAMPLE
    PS C:\> Add-ClickUpTagToTask -TaskID abc -TagName "name"
    Add ClickUp tag with name "name" to task with ID "abc".
.EXAMPLE
    PS C:\> Add-ClickUpTagToTask -TaskID "Custom Task ID" -TagName "name" -CustomTaskIDs $true -TeamID 123
    Add ClickUp tag with name "name" to task with custom ID "Custom Task ID".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tags/add-tag-to-task.html
#>
function Add-ClickUpTagToTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskIDs')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskIDs', HelpMessage = 'ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Custom ClickUp task ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskIDs', HelpMessage = 'Name of the ClickUp tag.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Name of the ClickUp tag.')]
        [ValidateNotNullOrEmpty()]
        [string]$TagName,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [ValidateNotNullOrEmpty()]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to true.')]
        [ValidateNotNullOrEmpty()]
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

    Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/tag/$TagName"
}

<#
.SYNOPSIS
    Remove ClickUp tag from task.
.DESCRIPTION
    Remove ClickUp tag from task.
.PARAMETER TaskID
    ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER TagName
    Name of the ClickUp tag.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to true.
.EXAMPLE
    PS C:\> Remove-ClickUpTagToTask -TaskID abc -TagName "name"
    Remove ClickUp tag with name "name" to task with ID "abc".
.EXAMPLE
    PS C:\> Remove-ClickUpTagToTask -TaskID "Custom Task ID" -TagName "name" -CustomTaskIDs $true -TeamID 123
    Remove ClickUp tag with name "name" to task with custom ID "Custom Task ID".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tags/remove-tag-from-task.html
#>
function Remove-ClickUpTagFromTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID', SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskIDs', HelpMessage = 'ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Custom ClickUp task ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskIDs', HelpMessage = 'Name of the ClickUp tag.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Name of the ClickUp tag.')]
        [ValidateNotNullOrEmpty()]
        [string]$TagName,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [ValidateNotNullOrEmpty()]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to true.')]
        [ValidateNotNullOrEmpty()]
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

    if ($PSCmdlet.ShouldProcess($TaskID)) {
        Invoke-ClickUpAPIDelete -Arguments $QueryString -Endpoint "task/$TaskID/tag/$TagName"
    }
}
