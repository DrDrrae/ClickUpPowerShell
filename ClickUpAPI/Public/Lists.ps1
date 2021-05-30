<#
.SYNOPSIS
    Get all ClickUp lists.
.DESCRIPTION
    Get all ClickUp lists.
.PARAMETER FolderID
    ClickUp folder ID.
.PARAMETER SpaceID
    Clickup space ID.
.PARAMETER Archived
    If set to true, will returned archived lists in addition to non-archived lists.
.EXAMPLE
    PS C:\> Get-ClickUpLists -FolderID 456
    Get ClickUp lists under folder with ID "456".
.EXAMPLE
    PS C:\> Get-ClickUpLists -FolderID 456 -Archived $true
    Get ClickUp lists under folder with ID "456" including archived lists.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/lists/get-lists.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/lists/get-folderless-lists.html
#>
function Get-ClickUpLists {
    [CmdletBinding(DefaultParameterSetName = 'FolderID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [UInt32]$FolderID,
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [UInt32]$SpaceID,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$Archived = $false
    )

    $QueryString = @{
        $Archived = $Archived
    }

    if ($PSBoundParameters.ContainsKey('FolderID')) {
        $Lists = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "folder/$FolderID/list"
    } elseif ($PSBoundParameters.ContainsKey('SpaceID')) {
        $Lists = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "space/$SpaceID/list"
    }
    Return $Lists.lists
}

<#
.SYNOPSIS
    Get a single ClickUp list.
.DESCRIPTION
    Get a single ClickUp list.
.PARAMETER ListID
    Clickup list ID.
.EXAMPLE
    PS C:\> Get-ClickUpList -ListID 456
    Get a ClickUp list with ID "456".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/lists/get-list.html
#>
function Get-ClickUpList {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt32]$ListID
    )

    $List = Invoke-ClickUpAPIGet -Endpoint "list/$ListID"
    Return $List
}

<#
.SYNOPSIS
    Create a ClickUp list.
.DESCRIPTION
    Create a ClickUp list.
.PARAMETER FolderID
    ClickUp folder ID.
.PARAMETER SpaceID
    Clickup space ID.
.PARAMETER Name
    Name of the new ClickUp list.
.PARAMETER Content
    Content of the new ClickUp list.
.PARAMETER DueDate
    Due date of the new ClickUp list.
.PARAMETER DueDateTime
    If set to true, will set the due date to also include a time instead of just a date.
.PARAMETER Priority
    Priority of the new ClickUp list.
.PARAMETER Assignee
    Member ID of the ClickUp user to assign the list to.
.PARAMETER Status
    Status of the new ClickUp list.
.EXAMPLE
    PS C:\> New-ClickUpList -FolderID 456 -Name "New ClickUp List"
    Create a ClickUp list called "New ClickUp List" under folder with ID "456".
.EXAMPLE
    PS C:\> New-ClickUpList -FolderID 456 -Name "New ClickUp List" -DueDate "12/31/2021" -Prority 2
    Create a ClickUp list called "New ClickUp List" under folder with ID "456" with a due date and priority.
.EXAMPLE
    PS C:\> New-ClickUpList -SpaceID 789 -Name "New ClickUp List"
    Create a ClickUp list called "New ClickUp List" under space with ID "789".
.EXAMPLE
    PS C:\> New-ClickUpList -SpaceID 789 -Name "New ClickUp List" -DueDate "12/31/2021" -Prority 2
    Create a ClickUp list called "New ClickUp List" under space with ID "789" with a due date and priority.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/lists/create-list.html
    https://jsapi.apiary.io/apis/clickup20/reference/0/lists/create-folderless-list.html
#>
function New-ClickUpList {
    [CmdletBinding(DefaultParameterSetName = 'FolderID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [UInt32]$FolderID,
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [UInt32]$SpaceID,
        [Parameter(Mandatory = $true, ParameterSetName = 'FolderID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'SpaceID')]
        [string]$Name,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [string]$Content,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [DateTime]$DueDate,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [bool]$DueDateTime = $false,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [UInt16]$Priorty,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [UInt32]$Assignee,
        [Parameter(ParameterSetName = 'FolderID')]
        [Parameter(ParameterSetName = 'SpaceID')]
        [string]$Status
    )

    $Body = @{
        name = $Name
    }

    if ($PSBoundParameters.ContainsKey('Content')) {
        $Body.Add('content', $Content)
    }
    if ($PSBoundParameters.ContainsKey('DueDate')) {
        $Body.Add('due_date', $(Get-DatePosixMilliseconds -DateTime $DueDate))
    }
    if ($PSBoundParameters.ContainsKey('DueDateTime')) {
        $Body.Add('due_date_time', $DueDateTime)
    }
    if ($PSBoundParameters.ContainsKey('Priorty')) {
        $Body.Add('priority', $Priorty)
    }
    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $Body.Add('assignee', $Assignee)
    }
    if ($PSBoundParameters.ContainsKey('Status')) {
        $Body.Add('status', $Status)
    }

    if ($PSBoundParameters.ContainsKey('FolderID')) {
        $List = Invoke-ClickUpAPIPost -Endpoint 'folder/$FolderID/list' -Body $Body
    } elseif ($PSBoundParameters.ContainsKey('SpaceID')) {
        $List = Invoke-ClickUpAPIPost -Endpoint 'space/$SpaceID/list' -Body $Body
    }
    Return $List
}

<#
.SYNOPSIS
    Update a ClickUp list.
.DESCRIPTION
    Update a ClickUp list.
.PARAMETER ListID
    ClickUp list ID.
.PARAMETER SpaceID
    Clickup space ID.
.PARAMETER Name
    New name of the ClickUp list.
.PARAMETER Content
    New content of the ClickUp list.
.PARAMETER DueDate
    New due date of the ClickUp list.
.PARAMETER DueDateTime
    If set to true, will set the due date to also include a time instead of just a date.
.PARAMETER Priority
    New priority of the ClickUp list.
.PARAMETER Assignee
    Member ID of the ClickUp user to assign the list to.
.PARAMETER Status
    New status of the ClickUp list.
.EXAMPLE
    PS C:\> Set-ClickUpList -ListID 124 -Name "New ClickUp List Name"
    Update a ClickUp list with ID "124" with new name "New ClickUp List Name".
.EXAMPLE
    PS C:\> Set-ClickUpList -ListID 124 -Name "New ClickUp List Name" -DueDate "12/31/2021" -Prority 2
    Update a ClickUp list with ID "124" with new name "New ClickUp List Name" with a due date and priority.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/lists/update-list.html
#>
function Set-ClickUpList {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ListID,
        [Parameter()]
        [string]$Name,
        [Parameter()]
        [string]$Content,
        [Parameter()]
        [DateTime]$DueDate,
        [Parameter()]
        [bool]$DueDateTime = $false,
        [Parameter()]
        [UInt16]$Priorty,
        [Parameter()]
        [UInt32]$Assignee,
        [Parameter()]
        [bool]$UnsetStatus
    )

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('Name')) {
        $Body.Add('name', $Name)
    }
    if ($PSBoundParameters.ContainsKey('Content')) {
        $Body.Add('content', $Content)
    }
    if ($PSBoundParameters.ContainsKey('DueDate')) {
        $Body.Add('due_date', $(Get-DatePosixMilliseconds -DateTime $DueDate))
    }
    if ($PSBoundParameters.ContainsKey('DueDateTime')) {
        $Body.Add('due_date_time', $DueDateTime)
    }
    if ($PSBoundParameters.ContainsKey('Priorty')) {
        $Body.Add('priority', $Priorty)
    }
    if ($PSBoundParameters.ContainsKey('Assignee')) {
        $Body.Add('assignee', $Assignee)
    }
    if ($PSBoundParameters.ContainsKey('UnsetStatus')) {
        $Body.Add('unset_status', $UnsetStatus)
    }


}

<#
.SYNOPSIS
    Remove a ClickUp list.
.DESCRIPTION
    Remove a ClickUp list.
.PARAMETER ListID
    ClickUp list ID.
.EXAMPLE
    PS C:\> Remove-ClickUpList -ListID 124
    Delete a ClickUp list with ID "124".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/lists/delete-list.html
#>
function Remove-ClickUpList {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [UInt32]$ListID
    )
    if ($PSCmdlet.ShouldProcess($ListID)) {
        Invoke-ClickUpAPIDelete -Endpoint "list/$ListID"
    }
}

<#
.SYNOPSIS
    Add a ClickUp task to a list.
.DESCRIPTION
    Add a ClickUp task to a list.
.PARAMETER ListID
    ClickUp list ID.
.PARAMETER TaskID
    ClickUp task ID.
.EXAMPLE
    PS C:\> Add-ClickUpTaskToList -ListID 123 -TaskID 9hz
    Add ClickUp task with ID "9hz" to list with ID "123".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/lists/add-task-to-list.html
#>
function Add-ClickUpTaskToList {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt32]$ListID,
        [Parameter(Mandatory = $true)]
        [string]$TaskID
    )

    Invoke-ClickUpAPIPost -Endpoint "list/$ListID/task/$TaskID"
}

<#
.SYNOPSIS
    Remove a ClickUp task from a list.
.DESCRIPTION
    Remove a ClickUp task from a list.
.PARAMETER ListID
    ClickUp list ID.
.PARAMETER TaskID
    ClickUp task ID.
.EXAMPLE
    PS C:\> Remove-ClickUpTaskFromList -ListID 123 -TaskID 9hz
    Add ClickUp task with ID "9hz" to list with ID "123".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/lists/add-task-to-list.html
#>
function Remove-ClickUpTaskFromList {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]
        [UInt32]$ListID,
        [Parameter(Mandatory = $true)]
        [string]$TaskID
    )

    if ($PSCmdlet.ShouldProcess($TaskID)) {
        Invoke-ClickUpAPIDelete -Endpoint "list/$ListID/task/$TaskID"
    }
}