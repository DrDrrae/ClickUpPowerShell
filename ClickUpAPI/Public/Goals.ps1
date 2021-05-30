<#
.SYNOPSIS
    Get all ClickUp team goals.
.DESCRIPTION
    Get all ClickUp team goals.
.PARAMETER TeamID
    ClickUp team ID.
.EXAMPLE
    PS C:\> Get-ClickUpGoals -TeamID 123
    Get all ClickUp team goals for team with ID "123".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/get-goals.html
#>
function Get-ClickUpGoals {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [UInt32]$TeamID
    )

    $Goals = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/goal"
    Return $Goals.goals
}

<#
.SYNOPSIS
    Get a single ClickUp team goal.
.DESCRIPTION
    Get a single ClickUp team goal.
.PARAMETER GoalID
    ClickUp goal ID.
.EXAMPLE
    PS C:\> Get-ClickUpGoal -GoalID e53a033c
    Get a ClickUp team goal with ID "e53a033c".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/get-goal.html
#>
function Get-ClickUpGoal {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp goal ID.')]
        [UInt32]$GoalID
    )

    $Goal = Invoke-ClickUpAPIGet -Endpoint "goal/$GoalID"
    Return $Goal.goal
}

<#
.SYNOPSIS
    Create a ClickUp team goal.
.DESCRIPTION
    Create a ClickUp team goal.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER Name
    Name of the ClickUp team goal to create.
.PARAMETER DueDate
    The due-date of the ClickUp team goal.
.PARAMETER Description
    Description of the ClickUp team goal.
.PARAMETER MultipleOwners
    If set to true, allows multiple owners.
.PARAMETER Owners
    The ClickUp team member ID for the owner(s) of the team goal.
.PARAMETER Color
    The color of the team goal in hex notation. i.e. "#32a852"
.EXAMPLE
    PS C:\> New-ClickUpGoal -TeamID 123 -Name 'Goal Name' -DueDate "12/31/2021 17:00"
    Create a new ClickUp goal for team with ID "123" with the name of "Goal Name" and the due date of "December 31st, 2021 at 5:00 PM."
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/create-goal.html
#>
function New-ClickUpGoal {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [UInt32]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'Name of the ClickUp team goal to create.')]
        [string]$Name,
        [Parameter(HelpMessage = 'The due-date of the ClickUp team goal.')]
        [DateTime]$DueDate,
        [Parameter(HelpMessage = 'Description of the ClickUp team goal.')]
        [string]$Description,
        [Parameter(HelpMessage = 'If set to true, allows multiple owners.')]
        [bool]$MultipleOwners,
        [Parameter(HelpMessage = 'The ClickUp team member ID for the owner(s) of the team goal.')]
        [UInt32[]]$Owners,
        [Parameter(HelpMessage = 'The color of the team goal in hex notation. i.e. "#32a852"')]
        [string]$Color
    )

    $Body = @{
        name = $Name
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

    $Goal = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/goal" -Body $Body
    Return $Goal.goal
}

<#
.SYNOPSIS
    Create a ClickUp team goal.
.DESCRIPTION
    Create a ClickUp team goal.
.PARAMETER GoalID
    ClickUp goal ID.
.PARAMETER Name
    New name of the ClickUp team goal being updated.
.PARAMETER DueDate
    The due-date of the ClickUp team goal.
.PARAMETER Description
    Description of the ClickUp team goal.
.PARAMETER MultipleOwners
    If set to true, allows multiple owners.
.PARAMETER Owners
    The ClickUp team member ID for the owner(s) of the team goal.
.PARAMETER Color
    The color of the team goal in hex notation. i.e. "#32a852"
.EXAMPLE
    PS C:\> Set-ClickUpGoal -GoalID e53a033c -Name "Updated Goal Name"
    Update ClickUp goal with ID "e53a033c" name to "Updated Goal Name".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/update-goal.html
#>
function Set-ClickUpGoal {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp goal ID.')]
        [UInt32]$GoalID,
        [Parameter(HelpMessage = 'New name of the ClickUp team goal being updated.')]
        [string]$Name,
        [Parameter(HelpMessage = 'The due-date of the ClickUp team goal.')]
        [DateTime]$DueDate,
        [Parameter(HelpMessage = 'Description of the ClickUp team goal.')]
        [string]$Description,
        [Parameter(HelpMessage = 'If set to true, allows multiple owners.')]
        [bool]$MultipleOwners,
        [Parameter(HelpMessage = 'The ClickUp team member ID for the owner(s) of the team goal.')]
        [UInt32[]]$Owners,
        [Parameter(HelpMessage = 'The color of the team goal in hex notation. i.e. "#32a852"')]
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
.PARAMETER GoalID
    ClickUp goal ID.
.EXAMPLE
    PS C:\> Remove-ClickUpGoal -GoalID e53a033c
    Remove ClickUp goal with ID "e53a033c".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/delete-goal.html
#>
function Remove-ClickUpGoal {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $True, HelpMessage = 'ClickUp goal ID.')]
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
.PARAMETER GoalID
    ClickUp goal ID.
.PARAMETER Name
    Name of the ClickUp key result.
.PARAMETER Owners
    The ClickUp team member ID for the owner(s) of the team goal.
.PARAMETER Type
    Type of the key result.
.PARAMETER StepsStart
    Step number to start at.
.PARAMETER StepsEnd
    Number of steps to reach the end.
.PARAMETER Unit
    Unit of the key result.
.PARAMETER TaskIDs
    If specified, will attach the task resource to the goal.
.PARAMETER ListIDs
    If specified, will attach the list resource to the goal.
.EXAMPLE
    PS C:\> New-ClickUpKeyResult -GoalID e53a033c -Name 'New Key Result Name' -Owners 183 -Type number -StepsStart 0 -StepsEnd 10 -Unit km
    Create a new ClickUp key result for goal with ID "e53a033c".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/create-key-result.html
#>
function New-ClickUpKeyResult {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp goal ID.')]
        [string]$GoalID,
        [Parameter(Mandatory = $true, HelpMessage = 'Name of the ClickUp key result.')]
        [string]$Name,
        [Parameter(HelpMessage = 'The ClickUp team member ID for the owner(s) of the team goal.')]
        [UInt32[]]$Owners,
        [Parameter(HelpMessage = 'Type of the key result.')]
        [ValidateSet('number', 'currency', 'boolean', 'percentage', 'automatic')]
        [string]$Type,
        [Parameter(HelpMessage = 'Current step.')]
        [UInt32]$StepsStart,
        [Parameter(HelpMessage = 'Number of steps to reach the end.')]
        [UInt32]$StepsEnd,
        [Parameter(HelpMessage = 'Unit of the key result.')]
        [string]$Unit,
        [Parameter(HelpMessage = 'If specified, will attach the task resource to the goal.')]
        [string[]]$TaskIDs,
        [Parameter(HelpMessage = 'If specified, will attach the list resource to the goal.')]
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
.PARAMETER KeyResultID
    ClickUp key result ID.
.PARAMETER Name
    New name of the ClickUp key result.
.PaRAMETER Note
    Note to add to the ClickUp key result.
.PARAMETER Owners
    The ClickUp team member ID for the owner(s) of the team goal.
.PARAMETER Type
    Type of the key result.
.PARAMETER StepsStart
    Step number to start at.
.PARAMETER StepsEnd
    Number of steps to reach the end.
.PARAMETER StepsCurrent
    Current step.
.PARAMETER Unit
    Unit of the key result.
.PARAMETER TaskIDs
    If specified, will attach the task resource to the goal.
.PARAMETER ListIDs
    If specified, will attach the list resource to the goal.
.EXAMPLE
    PS C:\> Set-ClickUpKeyResult -KeyResultID 947d46ed -StepsCurrent 5 -Note 'Target achieved'
    Update a ClickUp key result with ID "947d46ed".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/edit-key-result.html
#>
function Set-ClickUpKeyResult {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp key result ID.')]
        [string]$KeyResultID,
        [Parameter(HelpMessage = 'New name of the ClickUp key result.')]
        [string]$Name,
        [Parameter(HelpMessage = 'Note to add to the ClickUp key result.')]
        [string]$Note,
        [Parameter(HelpMessage = 'The ClickUp team member ID for the owner(s) of the team goal.')]
        [UInt32[]]$Owners,
        [Parameter(HelpMessage = 'Type of the key result.')]
        [ValidateSet('number', 'currency', 'boolean', 'percentage', 'automatic')]
        [string]$Type,
        [Parameter(HelpMessage = 'Step number to start at.')]
        [UInt32]$StepsStart,
        [Parameter(HelpMessage = 'Number of steps to reach the end.')]
        [UInt32]$StepsEnd,
        [Parameter(HelpMessage = 'Current step.')]
        [UInt32]$StepsCurrent,
        [Parameter(HelpMessage = 'Unit of the key result.')]
        [string]$Unit,
        [Parameter(HelpMessage = 'If specified, will attach the task resource to the goal.')]
        [string[]]$TaskIDs,
        [Parameter(HelpMessage = 'If specified, will attach the list resource to the goal.')]
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
.PARAMETER KeyResultID
    ClickUp key result ID.
.EXAMPLE
    PS C:\> Remove-ClickUpKeyResult -KeyResultID 947d46ed
    Remove ClickUp key result with ID "947d46ed".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/goals/delete-key-result.html
#>
function Remove-ClickUpKeyResult {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $True, HelpMessage = 'ClickUp key result ID.')]
        [string]$KeyResultID
    )

    if ($PSCmdlet.ShouldProcess($KeyResultID)) {
        Invoke-ClickUpAPIDelete -Endpoint "key_result/$KeyResultID"
    }
}
