<#
.SYNOPSIS
    Get ClickUp custom fields.
.DESCRIPTION
    Get ClickUp custom fields.
.EXAMPLE
    PS C:\> Get-ClickUpCustomFields -ListID 123
    Get all ClickUp custom fields for list with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpCustomFields -FolderID 456
    Get all ClickUp custom fields for folder with ID "456".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getaccessiblecustomfields
#>
function Get-ClickUpCustomFields {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'ListID')]
        [ulong]$ListID,
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [ulong]$FolderID,
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [ulong]$SpaceID,
        [Parameter(Mandatory = $true, ParameterSetName = 'WorkspaceID')]
        [ulong]$WorkspaceID
    )

    switch ($PSCmdlet.ParameterSetName) {
        'ListID' { $Endpoint = "list/$ListID/field" }
        'FolderID' { $Endpoint = "folder/$FolderID/field" }
        'SpaceID' { $Endpoint = "space/$SpaceID/field" }
        'WorkspaceID' { $Endpoint = "team/$WorkspaceID/field" }
    }

    Write-Verbose "Retrieving custom fields from endpoint '$Endpoint'..."
    try {
        $CustomFields = Invoke-ClickUpAPIGet -Endpoint $Endpoint
        Write-Verbose 'Custom fields retrieved successfully.'
        return $CustomFields.fields
    } catch {
        Write-Error "Failed to retrieve custom fields. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Set ClickUp custom field value.
.DESCRIPTION
    Set ClickUp custom field value.
.EXAMPLE
    PS C:\> Set-ClickUpCustomFieldValue -TaskID 9hz -FieldID b955c4dc -Value 80
    Set the ClickUp custom field under task with ID "9hz" and field with ID "b955c4dc" to value "80".
.EXAMPLE
    PS C:\> Set-ClickUpCustomFieldValue -TaskID CustomID -FieldID b955c4dc -Value 80 -CustomTaskIDs $true -TeamID 123
    Set the ClickUp custom field under task with custom ID "CustomID" and field with ID "b955c4dc" to value "80".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.

    The accessible fields can be found on the task object from the get task route. This is where you can retrieve the field_id.
.LINK
    https://developer.clickup.com/reference/setcustomfieldvalue
#>
function Set-ClickUpCustomFieldValue {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$FieldID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$Value,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [ulong]$TeamID
    )

    Write-Verbose "Setting custom field value for TaskID: $TaskID, FieldID: $FieldID, Value: $Value"

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    $Body = @{
        value = $Value
    }

    try {
        $CustomFieldValue = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/field/$FieldID" -Body $Body
        Write-Verbose 'Successfully set custom field value.'
        return $CustomFieldValue
    } catch {
        Write-Error "Failed to set custom field value. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Remove a ClickUp custom field value.
.DESCRIPTION
    Remove a ClickUp custom field value.
.EXAMPLE
    PS C:\> Remove-ClickUpCustomFieldValue -TaskID 9hz -FieldID b955c4dc -Value 80
    Remove the ClickUp custom field under task with ID "9hz" and field with ID "b955c4dc".
.EXAMPLE
    PS C:\> Set-ClickUpCustomFieldValue -TaskID CustomID -FieldID b955c4dc -Value 80 -CustomTaskIDs $true -TeamID 123
    Remove the ClickUp custom field under task with custom ID "CustomID" and field with ID "b955c4dc".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/removecustomfieldvalue
#>
function Remove-ClickUpCustomFieldValue {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$FieldID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [ulong]$TeamID
    )

    Write-Verbose "Removing custom field value for TaskID: $TaskID, FieldID: $FieldID"

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    if ($PSCmdlet.ShouldProcess($FieldID, 'Remove Custom Field Value')) {
        try {
            $Null = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/field/$FieldID"
            Write-Verbose 'Successfully removed custom field value.'
        } catch {
            Write-Error "Failed to remove custom field value. Error: $_"
            throw
        }
    }
}