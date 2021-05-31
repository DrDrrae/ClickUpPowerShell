<#
.SYNOPSIS
    Create a new ClickUp checklist.
.DESCRIPTION
    Create a new ClickUp checklist.
.PARAMETER TaskID
    The ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER Name
    The name of the new ClickUp checklist.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to true.
.EXAMPLE
    PS C:\> New-ClickUpChecklist -TaskID 9hz -Name "Checklist"
    Create a new checklist on ClickUp task with ID "9hz" with name "Checklist".
.EXAMPLE
    PS C:\> New-ClickUpChecklist -TaskID CustomID -CustomTaskIDs $true -TeamID 123 -Name "Checklist"
    Create a new checklist on ClickUp task with custom ID "CustomID" with name "Checklist".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/create-checklist.html
#>
function New-ClickUpChecklist {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'The ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'The custom ClickUp task ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'The name of the new ClickUp checklist.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'The name of the new ClickUp checklist.')]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [ValidateNotNullOrEmpty()]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to true.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID
    )

    $Body = @{
        name = $Name
    }

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    $Checklist = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "task/$TaskID/checklist" -Body $Body
    return $Checklist.checklist
}

<#
.SYNOPSIS
    Update a ClickUp checklist.
.DESCRIPTION
    Update a ClickUp checklist.
.PARAMETER ChecklistID
    The ClickUp checklist ID.
.PARAMETER Name
    The new name of the ClickUp checklist.
.PARAMETER Position
    The position of the checklist.

    Zero-based index of the order you want the checklist to exist on the task. If you want the checklist to be in the first position, pass 0.
.EXAMPLE
    PS C:\> Set-ClickUpChecklist -ChecklistID b955c4dc -Name "New checklist name."
    Update ClickUp checklist with ID "b955c4dc" to new name "New checklist name."
.EXAMPLE
    PS C:\> Set-ClickUpChecklist -ChecklistID b955c4dc -Name "Update Checklist." -Position 3
    Update ClickUp checklist with ID "b955c4dc" to new name "Update Checklist." and position 3.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/edit-checklist.html
#>
function Set-ClickUpChecklist {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'The ClickUp checklist ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$ChecklistID,
        [Parameter(HelpMessage = 'The new name of the ClickUp checklist.')]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter(HelpMessage = 'The zero-based position of the checklist.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$Position
    )

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('Name')) {
        $Body.Add('name', $Name)
    }
    if ($PSBoundParameters.ContainsKey('Position')) {
        $Body.Add('position', $Position)
    }

    $Checklist = Invoke-ClickUpAPIPut -Endpoint 'checklist/$ChecklistID' -Body $Body
    return $Checklist.checklist
}

<#
.SYNOPSIS
    Delete a ClickUp checklist.
.DESCRIPTION
    Delete a ClickUp checklist.
.PARAMETER ChecklistID
    The ClickUp checklist ID.
.EXAMPLE
    PS C:\> Remove-ClickUpChecklist -ChecklistID b955c4dc
    Remove ClickUp checklist with ID "b955c4dc".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/delete-checklist.html
#>
function Remove-ClickUpChecklist {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'The ClickUp checklist ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$ChecklistID
    )

    if ($PSCmdlet.ShouldProcess($ChecklistID)) {
        Invoke-ClickUpAPIDelete -Endpoint "checklist/$CheckListID"
    }
}

<#
.SYNOPSIS
    Create a new ClickUp checklist item.
.DESCRIPTION
    Create a new ClickUp checklist item.
.PARAMETER ChecklistID
    The ClickUp checklist ID.
.PARAMETER Name
    The name of the new ClickUp checklist item.
.PARAMETER Assignee
    The ClickUp user ID of the user to assign the checklist item to.
.EXAMPLE
    PS C:\> New-ClickUpChecklist -CheckListID b955c4dc -Name "Checklist item"
    Create a new checklist item on ClickUp Checklist with ID "b955c4dc" with name "Checklist item".
.EXAMPLE
    PS C:\> New-ClickUpChecklist -CheckListID b955c4dc -Name "Checklist item" -Assignee 183
    Create a new checklist item on ClickUp Checklist with ID "b955c4dc" with name "Checklist item" and assign it to member with ID "183."
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/create-checklist-item.html
#>
function New-ClickUpChecklistItem {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $True, HelpMessage = 'The ClickUp checklist ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$CheckListID,
        [Parameter(Mandatory = $True, HelpMessage = 'The name of the new ClickUp checklist item')]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter(HelpMessage = 'The ClickUp user ID of the user to assign the checklist item to.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$Assignee
    )

    $Body = @{
        name = $Name
    }

    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $Body.Add('assignee', $Assignee)
    }

    $Checklist = Invoke-ClickUpAPIPost -Endpoint "checklist/$CheckListID/checklist_item" -Body $Body
    $Checklist.checklist
}

<#
.SYNOPSIS
    Update a ClickUp checklist item.
.DESCRIPTION
    Update a ClickUp checklist item.
.PARAMETER ChecklistID
    The ClickUp checklist ID.
.PARAMETER ChecklistItemID
    The ClickUp checklist item ID.
.PARAMETER Name
    The new name of the ClickUp checklist item.
.PARAMETER Assignee
    The ClickUp user ID of the user to assign the checklist item to.
.PARAMETER Resolved
    If the checklist item is resolved or not.
.PARAMETER Parent
    Another checklist item that you want to nest the target checklist item underneath.
.EXAMPLE
    PS C:\> Set-ClickUpChecklist -ChecklistID b955c4dc -ChecklistItemId 21e08dc8 -Name "New checklist item name."
    Update ClickUp checklist item with ID "21e08dc8" under checklist with ID "b955c4dc" to new name "New checklist item name."
.EXAMPLE
    PS C:\> Set-ClickUpChecklist -ChecklistID b955c4dc -ChecklistItemId 21e08dc8 -Name "Update Checklist item." -Assignee 183
    Update ClickUp checklist item with ID "21e08dc8" under checklist with ID "b955c4dc" to new name "Update Checklist item." and assign it to member with ID "183."
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/edit-checklist-item.html
#>
function Set-ClickUpChecklistItem {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'The ClickUp checklist ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$ChecklistID,
        [Parameter(Mandatory = $true, HelpMessage = 'The ClickUp checklist item ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$ChecklistItemId,
        [Parameter(HelpMessage = 'The new name of the ClickUp checklist item.')]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter(HelpMessage = 'The ClickUp user ID of the user to assign the checklist item to.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$Assignee,
        [Parameter(HelpMessage = 'If the checklist item is resolved or not.')]
        [ValidateNotNullOrEmpty()]
        [bool]$Resolved,
        [Parameter(HelpMessage = 'Another checklist item that you want to nest the target checklist item underneath.')]
        [ValidateNotNullOrEmpty()]
        [string]$Parent
    )

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('Name')) {
        $Body.Add('name', $Name)
    }
    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $Body.Add('assignee', $Assignee)
    }
    if ($PSBoundParameters.ContainsKey('Resolved')) {
        $Body.Add('resolved', $Resolved)
    }
    if ($PSBoundParameters.ContainsKey('Parent')) {
        $Body.Add('parent', $Parent)
    }

    $Checklist = Invoke-ClickUpAPIPut -Endpoint "checklist/$ChecklistID/checklist_item/$ChecklistItemId" -Body $Body
    $CheckList.checklist
}

<#
.SYNOPSIS
    Delete a ClickUp checklist item.
.DESCRIPTION
    Delete a ClickUp checklist item.
.PARAMETER ChecklistID
    The ClickUp checklist ID.
.PARAMETER ChecklistItemID
    The ClickUp checklist item ID.
.EXAMPLE
    PS C:\> Remove-ClickUpChecklist -ChecklistID b955c4dc -ChecklistItemId 21e08dc8
    Remove ClickUp checklist with ID "b955c4dc".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/delete-checklist-item.html
#>
function Remove-ClickUpCheckListItem {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'The ClickUp checklist ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$ChecklistID,
        [Parameter(Mandatory = $true, HelpMessage = 'The ClickUp checklist item ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$ChecklistItemId
    )

    if ($PSCmdlet.ShouldProcess($ChecklistID)) {
        Invoke-ClickUpAPIDelete -Endpoint "checklist/$ChecklistID/checklist_item/$ChecklistItemId"
    }
}