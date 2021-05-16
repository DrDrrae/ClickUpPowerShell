<#
.SYNOPSIS
    Get all ClickUp team goals.
.DESCRIPTION
    Get all ClickUp team goals.
.EXAMPLE
    PS C:\> Get-ClickUpGoals -TeamID 123
    Get all ClickUp team goals for team with ID "123".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/get-goals.html
#>
function Get-ClickUpGoals {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$TeamID
    )

    $Goals = Invoke-ClickUpAPIGet-Endpoint "team/$TeamID/goal"
    Return $Goals.goals
}

<#
.SYNOPSIS
    Get a single ClickUp team goal.
.DESCRIPTION
    Get a single ClickUp team goal.
.EXAMPLE
    PS C:\> Get-ClickUpGoal -GoalID e53a033c
    Get a ClickUp team goal with ID "e53a033c".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/get-goal.html
#>
function Get-ClickUpGoal {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$GoalID
    )

    $Goal = Invoke-ClickUpAPIGet-Endpoint "goal/$GoalID"
    Return $Goal.goal
}

<#
.SYNOPSIS
    Create a ClickUp team goal.
.DESCRIPTION
    Create a ClickUp team goal.
.EXAMPLE
    PS C:\> New-ClickUpGoal -TeamID 123 -Name 'Goal Name' -DueDate "12/31/2021 17:00"
    Create a new ClickUp goal for team with ID "123" with the name of "Goal Name" and the due date of "December 31st, 2021 at 5:00 PM."
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/create-goal.html
#>
function New-ClickUpGoal {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [Uint32]$TeamID,
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [Parameter()]
        [DateTime]$DueDate,
        [Parameter()]
        [string]$Description,
        [Parameter()]
        [bool]$MultipleOwners,
        [Parameter()]
        [UInt32[]]$Owners,
        [Parameter()]
        [string]$Color
    )

    $Body = @{
        name = $Name
    }

    if($PSBoundParameters.ContainsKey('DueDate')) {
        $Body.Add('due_date', $(Get-DatePosixMilliseconds -DateTime $DueDate))
    }
    if ($PSBoundParameters.ContainsKey('Description')) {
        $Body.Add('description', $Description)
    }
    if ($PSBoundParameters.ContainsKey('MultipleOwners')) {
        $Body.Add('multiple_owners', $MultipleOwners)
    }
    if ($PSBoundParameters.ContainsKey('Owners')) {
        $Body.Add('owners', $Owners)
    }
    if ($PSBoundParameters.ContainsKey('Color')) {
        $Body.Add('color', $Color)
    }

    $Goal = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/goal" -Body $Body
    Return $Goal.goal
}

<#
.SYNOPSIS
    Create a ClickUp team goal.
.DESCRIPTION
    Create a ClickUp team goal.
.EXAMPLE
    PS C:\> Set-ClickUpGoal -GoalID e53a033c -Name "Updated Goal Name"
    Update ClickUp goal with ID "e53a033c" name to "Updated Goal Name".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/update-goal.html
#>
function Set-ClickUpGoal {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [Uint32]$GoalID,
        [Parameter()]
        [string]$Name,
        [Parameter()]
        [DateTime]$DueDate,
        [Parameter()]
        [string]$Description,
        [Parameter()]
        [bool]$MultipleOwners,
        [Parameter()]
        [UInt32[]]$Owners,
        [Parameter()]
        [string]$Color
    )

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('Name')) {
        $Body.Add('name', $Name)
    }
    if ($PSBoundParameters.ContainsKey('DueDate')) {
        $Body.Add('due_date', $(Get-DatePosixMilliseconds -DateTime $DueDate))
    }
    if ($PSBoundParameters.ContainsKey('Description')) {
        $Body.Add('description', $Description)
    }
    if ($PSBoundParameters.ContainsKey('MultipleOwners')) {
        $Body.Add('multiple_owners', $MultipleOwners)
    }
    if ($PSBoundParameters.ContainsKey('Owners')) {
        $Body.Add('owners', $Owners)
    }
    if ($PSBoundParameters.ContainsKey('Color')) {
        $Body.Add('color', $Color)
    }

    $Goal = Invoke-ClickUpAPIPut -Endpoint "goal/$GoalID" -Body $Body
    Return $Goal.goal
}

<#
.SYNOPSIS
    Remove a ClickUp team goal.
.DESCRIPTION
    Remove a ClickUp team goal.
.EXAMPLE
    PS C:\> Remove-ClickUpGoal -GoalID e53a033c
    Remove ClickUp goal with ID "e53a033c".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/delete-goal.html
#>
function Remove-ClickUpGoal {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $True)]
        [string]$GoalID
    )

    if ($PSCmdlet.ShouldProcess($CommentID)) {
        Invoke-ClickUpAPIDelete -Endpoint "goal/$GoalID"
    }
}

<#
.SYNOPSIS
    Create a ClickUp key result.
.DESCRIPTION
    Create a ClickUp key result.
.EXAMPLE
    PS C:\> New-ClickUpKeyResult -GoalID e53a033c -Name 'New Key Result Name' -Owners 183 -Type number -StepsStart 0 -StepsEnd 10 -Unit km
    Create a new ClickUp key result for goal with ID "e53a033c".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/create-key-result.html
#>
function New-ClickUpKeyResult {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$GoalID,
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [Parameter()]
        [UInt32[]]$Owners,
        [Parameter()]
        [ValidateSet('number','currency','boolean','percentage','automatic')]
        [string]$Type,
        [Parameter()]
        [UInt32]$StepsStart,
        [Parameter()]
        [UInt32]$StepsEnd,
        [Parameter()]
        [string]$Unit,
        [Parameter()]
        [string[]]$TaskIDs,
        [Parameter()]
        [UInt32[]]$ListIDs
    )

    $Body = @{
        name = $Name
    }

    if ($PSBoundParameters.ContainsKey('Owners')) {
        $Body.Add('owners', $Owners)
    }
    if ($PSBoundParameters.ContainsKey('Type')) {
        $Body.Add('type', $Type)
    }
    if ($PSBoundParameters.ContainsKey('StepsStart')) {
        $Body.Add('steps_start', $StepsStart)
    }
    if ($PSBoundParameters.ContainsKey('StepsEnd')) {
        $Body.Add('steps_end', $StepsEnd)
    }
    if ($PSBoundParameters.ContainsKey('Unit')) {
        $Body.Add('unit', $Unit)
    }
    if ($PSBoundParameters.ContainsKey('TaskIDs')) {
        $Body.Add('task_ids', $TaskIDs)
    }
    if ($PSBoundParameters.ContainsKey('ListIDs')) {
        $Body.Add('list_ids', $ListIDs)
    }

    $KeyResult = Invoke-ClickUpAPIPost -Endpoint "goal/$GoalID/key_result" -Body $Body
    Return $KeyResult.key_result
}

<#
.SYNOPSIS
    Update a ClickUp key result.
.DESCRIPTION
    Update a ClickUp key result.
.EXAMPLE
    PS C:\> Set-ClickUpKeyResult -KeyResultID 947d46ed -StepsCurrent 5 -Note 'Target achieved'
    Update a ClickUp key result with ID "947d46ed".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/edit-key-result.html
#>
function Set-ClickUpKeyResult {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$KeyResultID,
        [Parameter()]
        [string]$Name,
        [Parameter()]
        [string]$Note,
        [Parameter()]
        [UInt32[]]$Owners,
        [Parameter()]
        [ValidateSet('number', 'currency', 'boolean', 'percentage', 'automatic')]
        [string]$Type,
        [Parameter()]
        [UInt32]$StepsStart,
        [Parameter()]
        [UInt32]$StepsEnd,
        [Parameter()]
        [UInt32]$StepsCurrent,
        [Parameter()]
        [string]$Unit,
        [Parameter()]
        [string[]]$TaskIDs,
        [Parameter()]
        [UInt32[]]$ListIDs
    )

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('Name')) {
        $Body.Add('name', $Name)
    }
    if ($PSBoundParameters.ContainsKey('Note')) {
        $Body.Add('note', $Note)
    }
    if ($PSBoundParameters.ContainsKey('Owners')) {
        $Body.Add('owners', $Owners)
    }
    if ($PSBoundParameters.ContainsKey('Type')) {
        $Body.Add('type', $Type)
    }
    if ($PSBoundParameters.ContainsKey('StepsStart')) {
        $Body.Add('steps_start', $StepsStart)
    }
    if ($PSBoundParameters.ContainsKey('StepsEnd')) {
        $Body.Add('steps_end', $StepsEnd)
    }
    if ($PSBoundParameters.ContainsKey('StepsCurrent')) {
        $Body.Add('steps_current', $StepsCurrent)
    }
    if ($PSBoundParameters.ContainsKey('Unit')) {
        $Body.Add('unit', $Unit)
    }
    if ($PSBoundParameters.ContainsKey('TaskIDs')) {
        $Body.Add('task_ids', $TaskIDs)
    }
    if ($PSBoundParameters.ContainsKey('ListIDs')) {
        $Body.Add('list_ids', $ListIDs)
    }

    $KeyResult = Invoke-ClickUpAPIPut -Endpoint 'key_result/$KeyResultID' -Body $Body
    Return $KeyResult.key_result
}

<#
.SYNOPSIS
    Remove a ClickUp key result.
.DESCRIPTION
    Remove a ClickUp key result.
.EXAMPLE
    PS C:\> Remove-ClickUpKeyResult -KeyResultID 947d46ed
    Remove ClickUp key result with ID "947d46ed".
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/delete-key-result.html
#>
function Remove-ClickUpKeyResult {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $True)]
        [string]$KeyResultID
    )

    if ($PSCmdlet.ShouldProcess($KeyResultID)) {
        Invoke-ClickUpAPIDelete -Endpoint "key_result/$KeyResultID"
    }
}
