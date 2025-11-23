<#
.SYNOPSIS
    Create a new ClickUp checklist.
.DESCRIPTION
    Create a new ClickUp checklist.
.EXAMPLE
    PS C:\> New-ClickUpChecklist -TaskID 9hz -Name "Checklist"
    Create a new checklist on ClickUp task with ID "9hz" with name "Checklist".
.EXAMPLE
    PS C:\> New-ClickUpChecklist -TaskID CustomID -CustomTaskIDs $true -TeamID 123 -Name "Checklist"
    Create a new checklist on ClickUp task with custom ID "CustomID" with name "Checklist".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createchecklist
#>
function New-ClickUpChecklist {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$Name,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
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

    Write-Verbose "Creating new checklist '$Name' on task '$TaskID'..."
    try {
        $Checklist = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/checklist" -Body $Body
        Write-Verbose 'Checklist created successfully.'
        return $Checklist.checklist
    } catch {
        Write-Error "Failed to create checklist. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Update a ClickUp checklist.
.DESCRIPTION
    Update a ClickUp checklist.
.EXAMPLE
    PS C:\> Set-ClickUpChecklist -ChecklistID b955c4dc -Name "New checklist name."
    Update ClickUp checklist with ID "b955c4dc" to new name "New checklist name."
.EXAMPLE
    PS C:\> Set-ClickUpChecklist -ChecklistID b955c4dc -Name "Update Checklist." -Position 3
    Update ClickUp checklist with ID "b955c4dc" to new name "Update Checklist." and position 3.
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/editchecklist
#>
function Set-ClickUpChecklist {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ChecklistID,
        [Parameter()]
        [string]$Name,
        [Parameter()]
        [UInt64]$Position
    )

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('Name')) {
        $Body.Add('name', $Name)
    }
    if ($PSBoundParameters.ContainsKey('Position')) {
        $Body.Add('position', $Position)
    }

    Write-Verbose "Updating checklist '$ChecklistID'..."
    try {
        $Checklist = Invoke-ClickUpAPIPut -Endpoint "checklist/$ChecklistID" -Body $Body
        Write-Verbose 'Checklist updated successfully.'
        return $Checklist.checklist
    } catch {
        Write-Error "Failed to update checklist. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Delete a ClickUp checklist.
.DESCRIPTION
    Delete a ClickUp checklist.
.EXAMPLE
    PS C:\> Remove-ClickUpChecklist -ChecklistID b955c4dc
    Remove ClickUp checklist with ID "b955c4dc".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/deletechecklist
#>
function Remove-ClickUpChecklist {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ChecklistID
    )

    if ($PSCmdlet.ShouldProcess($ChecklistID, 'Delete Checklist')) {
        Write-Verbose "Deleting checklist '$ChecklistID'..."
        try {
            Invoke-ClickUpAPIDelete -Endpoint "checklist/$ChecklistID"
            Write-Verbose 'Checklist deleted successfully.'
        } catch {
            Write-Error "Failed to delete checklist. Error: $_"
            throw
        }
    }
}

<#
.SYNOPSIS
    Create a new ClickUp checklist item.
.DESCRIPTION
    Create a new ClickUp checklist item.
.EXAMPLE
    PS C:\> New-ClickUpChecklist -CheckListID b955c4dc -Name "Checklist item"
    Create a new checklist item on ClickUp Checklist with ID "b955c4dc" with name "Checklist item".
.EXAMPLE
    PS C:\> New-ClickUpChecklist -CheckListID b955c4dc -Name "Checklist item" -Assignee 183
    Create a new checklist item on ClickUp Checklist with ID "b955c4dc" with name "Checklist item" and assign it to member with ID "183."
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createchecklistitem
#>
function New-ClickUpChecklistItem {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $True)]
        [string]$CheckListID,
        [Parameter(Mandatory = $True)]
        [string]$Name,
        [Parameter()]
        [UInt64]$Assignee
    )

    $Body = @{
        name = $Name
    }

    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $Body.Add('assignee', $Assignee)
    }

    Write-Verbose "Creating new checklist item '$Name' in checklist '$CheckListID'..."
    try {
        $Checklist = Invoke-ClickUpAPIPost -Endpoint "checklist/$CheckListID/checklist_item" -Body $Body
        Write-Verbose 'Checklist item created successfully.'
        return $Checklist.checklist
    } catch {
        Write-Error "Failed to create checklist item. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Update a ClickUp checklist item.
.DESCRIPTION
    Update a ClickUp checklist item.
.EXAMPLE
    PS C:\> Set-ClickUpChecklist -ChecklistID b955c4dc -ChecklistItemId 21e08dc8 -Name "New checklist item name."
    Update ClickUp checklist item with ID "21e08dc8" under checklist with ID "b955c4dc" to new name "New checklist item name."
.EXAMPLE
    PS C:\> Set-ClickUpChecklist -ChecklistID b955c4dc -ChecklistItemId 21e08dc8 -Name "Update Checklist item." -Assignee 183
    Update ClickUp checklist item with ID "21e08dc8" under checklist with ID "b955c4dc" to new name "Update Checklist item." and assign it to member with ID "183."
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/editchecklistitem
#>
function Set-ClickUpChecklistItem {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ChecklistID,
        [Parameter(Mandatory = $true)]
        [string]$ChecklistItemId,
        [Parameter()]
        [string]$Name,
        [Parameter()]
        [UInt64]$Assignee,
        [Parameter()]
        [bool]$Resolved,
        [Parameter()]
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

    Write-Verbose "Updating checklist item '$ChecklistItemId'..."
    try {
        $Checklist = Invoke-ClickUpAPIPut -Endpoint "checklist/$ChecklistID/checklist_item/$ChecklistItemId" -Body $Body
        Write-Verbose 'Checklist item updated successfully.'
        return $Checklist.checklist
    } catch {
        Write-Error "Failed to update checklist item. Error: $_"
        throw
    }
}

<#
.SYNOPSIS
    Delete a ClickUp checklist item.
.DESCRIPTION
    Delete a ClickUp checklist item.
.EXAMPLE
    PS C:\> Remove-ClickUpChecklist -ChecklistID b955c4dc -ChecklistItemId 21e08dc8
    Remove ClickUp checklist with ID "b955c4dc".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/deletechecklistitem
#>
function Remove-ClickUpCheckListItem {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ChecklistID,
        [Parameter(Mandatory = $true)]
        [string]$ChecklistItemId
    )

    if ($PSCmdlet.ShouldProcess("$ChecklistID - $ChecklistItemId", 'Delete Checklist Item')) {
        Write-Verbose "Deleting checklist item '$ChecklistItemId' from checklist '$ChecklistID'..."
        try {
            Invoke-ClickUpAPIDelete -Endpoint "checklist/$ChecklistID/checklist_item/$ChecklistItemId"
            Write-Verbose 'Checklist item deleted successfully.'
        } catch {
            Write-Error "Failed to delete checklist item. Error: $_"
            throw
        }
    }
}