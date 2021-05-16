<#
.SYNOPSIS
    Get ClickUp custom fields.
.DESCRIPTION
    Get ClickUp custom fields.
.EXAMPLE
    PS C:\> Get-ClickUpCustomFields -TaskID 9hz
    Get all ClickUp custom field under task with ID "9hz"
.EXAMPLE
    PS C:\> Get-ClickUpCustomFields -TaskID CustomID -CustomTaskIDs $true -TeamID 123
    Get all ClickUp custom field under task with custom ID "CustomID".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields/get-accessible-custom-fields.html
#>
function Get-ClickUpCustomFields {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ListID
    )

    $CustomFields = Invoke-ClickUpAPIGet -Endpoint "list/$ListID/field"
    Return $CustomFields.fields
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
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.

    The accessible fields can be found on the task object from the get task route. This is where you can retrieve the field_id.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields/set-custom-field-value.html
#>
function Set-ClickUpCustomFieldValue {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
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
        [bool]$CustomTaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
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

    $Body = @{
        value = $Value
    }


    Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/field/$FieldID" -Body $Body
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
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields/remove-custom-field-value.html
#>
function Remove-ClickUpCustomFieldValue {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$FieldID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [bool]$CustomTaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
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

    Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/field/$FieldID"
}