<#
.SYNOPSIS
    Get all ClickUp space tags.
.DESCRIPTION
    Get all ClickUp space tags. Can accept SpaceID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Get-ClickUpTags -SpaceID 512
    Gets all ClickUp tags for space with ID "512".
.EXAMPLE
    PS C:\> Get-ClickUpSpace -SpaceID 512 | Get-ClickUpTags
    Gets tags by piping space ID from Get-ClickUpSpace.
.INPUTS
    System.UInt64. SpaceID via pipeline by property name.
.OUTPUTS
    System.Object
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('space_id', 'id')]
        [uint64]$SpaceID
    )

    Write-Verbose 'Entering Get-ClickUpTags'
    try {
        Write-Verbose "Getting tags for space ID: $SpaceID"
        $Tags = Invoke-ClickUpAPIGet -Endpoint "space/$SpaceID/tag"
        Write-Verbose 'Successfully retrieved tags'
        return $Tags.tags
    } catch {
        Write-Error "Error in Get-ClickUpTags: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Create a new ClickUp space tag.
.DESCRIPTION
    Create a new ClickUp space tag. Can accept SpaceID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> New-ClickUpTag -SpaceID 512 -Name "Tag Name" -ForegroundColor "#ffffff" -BackgroundColor "#000000"
    Creates a new ClickUp tag for space with ID "512" with the name "Tag Name", foreground color white, and background color black.
.EXAMPLE
    PS C:\> Get-ClickUpSpace -SpaceID 512 | New-ClickUpTag -TagName "New Tag"
    Creates tag by piping space ID from Get-ClickUpSpace.
.INPUTS
    System.UInt64. SpaceID via pipeline by property name.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('space_id', 'id')]
        [uint64]$SpaceID,
        [Parameter(Mandatory = $true)]
        [string]$TagName,
        [Parameter()]
        [string]$ForegroundColor,
        [Parameter()]
        [string]$BackgroundColor
    )

    Write-Verbose 'Entering New-ClickUpTag'
    try {
        Write-Verbose "Creating tag '$TagName' in space ID: $SpaceID"
        $Body = @{
            name = $TagName
        }

        if ($PSBoundParameters.ContainsKey('ForegroundColor')) {
            $Body.Add('tag_fg', $ForegroundColor)
        }
        if ($PSBoundParameters.ContainsKey('BackgroundColor')) {
            $Body.Add('tag_bg', $BackgroundColor)
        }

        $null = Invoke-ClickUpAPIPost -Endpoint "space/$SpaceID/tag" -Body $Body
        Write-Verbose 'Successfully created tag'
    } catch {
        Write-Error "Error in New-ClickUpTag: $($_.Exception.Message)"
        throw $_
    }
}


<#
.SYNOPSIS
    Update a ClickUp space tag.
.DESCRIPTION
    Update a ClickUp space tag. Can accept SpaceID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Set-ClickUpTag -SpaceID 512 -TagName "Tag Name" -NewName "Updated Tag" -ForegroundColor "#ffffff" -BackgroundColor "#000000"
    Updates a ClickUp tag with name "Tag Name" for space with ID "512" to the name "Updated Tag", foreground color to white, and background color to black.
.EXAMPLE
    PS C:\> Get-ClickUpSpace -SpaceID 512 | Set-ClickUpTag -TagName "Old Name" -NewName "New Name"
    Updates tag by piping space ID from Get-ClickUpSpace.
.INPUTS
    System.UInt64. SpaceID via pipeline by property name.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('space_id', 'id')]
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

    Write-Verbose 'Entering Set-ClickUpTag'
    try {
        Write-Verbose "Updating tag '$TagName' in space ID: $SpaceID"
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

        $Tag = Invoke-ClickUpAPIPut -Endpoint "space/$SpaceID/tag/$TagName" -Body $Body
        Write-Verbose 'Successfully updated tag'
        return $Tag.tag
    } catch {
        Write-Error "Error in Set-ClickUpTag: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Remove a ClickUp space tag.
.DESCRIPTION
    Remove a ClickUp space tag. Can accept SpaceID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Remove-ClickUpTag -SpaceID 512 -TagName "Tag name"
    Removes a ClickUp tag with name "Tag Name" for space with ID "512".
.EXAMPLE
    PS C:\> Get-ClickUpSpace -SpaceID 512 | Remove-ClickUpTag -TagName "Tag Name"
    Removes tag by piping space ID from Get-ClickUpSpace.
.INPUTS
    System.UInt64. SpaceID via pipeline by property name.
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
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('space_id', 'id')]
        [uint64]$SpaceID,
        [Parameter(Mandatory = $true)]
        [string]$TagName
    )

    Write-Verbose 'Entering Remove-ClickUpTag'
    try {
        if ($PSCmdlet.ShouldProcess($TagName)) {
            Write-Verbose "Removing tag '$TagName' from space ID: $SpaceID"
            $Null = Invoke-ClickUpAPIDelete -Endpoint "space/$SpaceID/tag/$TagName"
            Write-Verbose 'Successfully removed tag'
        }
    } catch {
        Write-Error "Error in Remove-ClickUpTag: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Add ClickUp tag to task.
.DESCRIPTION
    Add ClickUp tag to task. Can accept TaskID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Add-ClickUpTagToTask -TaskID abc -TagName "name"
    Adds ClickUp tag with name "name" to task with ID "abc".
.EXAMPLE
    PS C:\> Add-ClickUpTagToTask -TaskID "Custom Task ID" -TagName "name" -CustomTaskIDs $true -TeamID 123
    Adds ClickUp tag with name "name" to task with custom ID "Custom Task ID".
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID abc | Add-ClickUpTagToTask -TagName "name"
    Adds tag to task by piping task ID from Get-ClickUpTask.
.INPUTS
    System.String. TaskID via pipeline by property name.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/addtagtotask
#>
function Add-ClickUpTagToTask {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', ValueFromPipelineByPropertyName = $true)]
        [Alias('task_id', 'id')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TagName,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [uint64]$TeamID
    )

    Write-Verbose 'Entering Add-ClickUpTagToTask'
    try {
        Write-Verbose "Adding tag '$TagName' to task ID: $TaskID"
        if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
            $QueryString = @{
                custom_task_ids = $CustomTaskIDs
                team_id         = $TeamID
            }
        } else {
            $QueryString = @{
            }
        }

        $null = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/tag/$TagName"
        Write-Verbose 'Successfully added tag to task'
    } catch {
        Write-Error "Error in Add-ClickUpTagToTask: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Remove ClickUp tag from task.
.DESCRIPTION
    Remove ClickUp tag from task. Can accept TaskID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Remove-ClickUpTagFromTask -TaskID abc -TagName "name"
    Removes ClickUp tag with name "name" from task with ID "abc".
.EXAMPLE
    PS C:\> Remove-ClickUpTagFromTask -TaskID "Custom Task ID" -TagName "name" -CustomTaskIDs $true -TeamID 123
    Removes ClickUp tag with name "name" from task with custom ID "Custom Task ID".
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID abc | Remove-ClickUpTagFromTask -TagName "name"
    Removes tag from task by piping task ID from Get-ClickUpTask.
.INPUTS
    System.String. TaskID via pipeline by property name.
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
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', ValueFromPipelineByPropertyName = $true)]
        [Alias('task_id', 'id')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TagName,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [uint64]$TeamID
    )

    Write-Verbose 'Entering Remove-ClickUpTagFromTask'
    try {
        if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
            $QueryString = @{
                custom_task_ids = $CustomTaskIDs
                team_id         = $TeamID
            }
        } else {
            $QueryString = @{
            }
        }

        if ($PSCmdlet.ShouldProcess($TaskID)) {
            Write-Verbose "Removing tag '$TagName' from task ID: $TaskID"
            $null = Invoke-ClickUpAPIDelete -Arguments $QueryString -Endpoint "task/$TaskID/tag/$TagName"
            Write-Verbose 'Successfully removed tag from task'
        }
    } catch {
        Write-Error "Error in Remove-ClickUpTagFromTask: $($_.Exception.Message)"
        throw $_
    }
}
