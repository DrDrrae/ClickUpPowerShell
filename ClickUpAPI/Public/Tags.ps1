<#
.SYNOPSIS
    Get all ClickUp space tags.
.DESCRIPTION
    Get all ClickUp space tags.
.EXAMPLE
    PS C:\> Get-ClickUpTags -SpaceID 512
    Get all ClickUp tags for space with ID "512".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getspacetags
#>
function Get-ClickUpTags {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true)]
        [uint64]$SpaceID
    )

    $Tags = Invoke-ClickUpAPIGet-Endpoint "space/$SpaceID/tag"
    return $Tags.tags
}

<#
.SYNOPSIS
    Create a new ClickUp space tag.
.DESCRIPTION
    Create a new ClickUp space tag.
.EXAMPLE
    PS C:\> New-ClickUpTag -SpaceID 512 -Name "Tag Name" -ForegroundColor "#ffffff" -BackgroundColor "#000000"
    Create a new ClickUp tag for space with ID "512" with the name "Tag Name", foreground color white, and background color black.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createspacetag
#>
function New-ClickUpTag {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [uint64]$SpaceID,
        [Parameter(Mandatory = $true)]
        [string]$TagName,
        [Parameter()]
        [string]$ForegroundColor,
        [Parameter()]
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

    $null = Invoke-ClickUpAPIPost-Endpoint "space/$SpaceID/tag" -Body $Body
}


<#
.SYNOPSIS
    Update a ClickUp space tag.
.DESCRIPTION
    Update a ClickUp space tag.
.EXAMPLE
    PS C:\> Set-ClickUpTag -SpaceID 512 -TagName "Tag Name" -NewName "Updated Tag" -ForegroundColor "#ffffff" -BackgroundColor "#000000"
    Update a ClickUp tag with name "Tag Name" for space with ID "512" to the name "Updated Tag", foreground color to white, and background color to black.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/tags/edit-space-tag.html
#>
function Set-ClickUpTag {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [uint64]$SpaceID,
        [Parameter(Mandatory = $true)]
        [string]$TagName,
        [Parameter()]
        [string]$NewName,
        [Parameter()]
        [string]$ForegroundColor,
        [Parameter()]
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

    $Tag = Invoke-ClickUpAPIPut-Endpoint "space/$SpaceID/tag/$TagName" -Body $Body
    return $Tag.tag
}

<#
.SYNOPSIS
    Remove a ClickUp space tag.
.DESCRIPTION
    Remove a ClickUp space tag.
.EXAMPLE
    PS C:\> Remove-ClickUpTag -SpaceID 512 -TagName "Tag name"
    Remove a ClickUp tag with name "Tag Name" for space with ID "512".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/deletespacetag
#>
function Remove-ClickUpTag {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [uint64]$SpaceID,
        [Parameter(Mandatory = $true)]
        [string]$TagName
    )

    if ($PSCmdlet.ShouldProcess($Name)) {
        $Null = Invoke-ClickUpAPIDelete -Endpoint "space/$SpaceID/tag/$TagName"
    }
}

<#
.SYNOPSIS
    Add ClickUp tag to task.
.DESCRIPTION
    Add ClickUp tag to task.
.EXAMPLE
    PS C:\> Add-ClickUpTagToTask -TaskID abc -TagName "name"
    Add ClickUp tag with name "name" to task with ID "abc".
.EXAMPLE
    PS C:\> Add-ClickUpTagToTask -TaskID "Custom Task ID" -TagName "name" -CustomTaskIDs $true -TeamID 123
    Add ClickUp tag with name "name" to task with custom ID "Custom Task ID".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/addtagtotask
#>
function Add-ClickUpTagToTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskIDs')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskIDs')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskIDs')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TagName,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
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

    $null = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/tag/$TagName"
}

<#
.SYNOPSIS
    Remove ClickUp tag from task.
.DESCRIPTION
    Remove ClickUp tag from task.
.EXAMPLE
    PS C:\> Remove-ClickUpTagToTask -TaskID abc -TagName "name"
    Remove ClickUp tag with name "name" to task with ID "abc".
.EXAMPLE
    PS C:\> Remove-ClickUpTagToTask -TaskID "Custom Task ID" -TagName "name" -CustomTaskIDs $true -TeamID 123
    Remove ClickUp tag with name "name" to task with custom ID "Custom Task ID".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/removetagfromtask
#>
function Remove-ClickUpTagFromTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID', SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskIDs')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskIDs')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TagName,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
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

    if ($PSCmdlet.ShouldProcess($TaskID)) {
        $null = Invoke-ClickUpAPIDelete -Arguments $QueryString -Endpoint "task/$TaskID/tag/$TagName"
    }
}
