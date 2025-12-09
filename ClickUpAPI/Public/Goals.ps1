<#
.SYNOPSIS
    Get all ClickUp team goals.
.DESCRIPTION
    Get all ClickUp team goals. Supports pipeline input from team/workspace objects for TeamID parameter.
.EXAMPLE
    PS C:\> Get-ClickUpGoals -TeamID 123
    Get all ClickUp team goals for team with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpTeam -TeamID 123 | Get-ClickUpGoals
    Get all goals by piping a team/workspace object.
.INPUTS
    System.UInt64. You can pipe a team ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getgoals
#>
function Get-ClickUpGoals {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('team_id','id')]
        [uint64]$TeamID
    )

    Write-Verbose "Getting all goals for team ID: $TeamID"
    try {
        $Goals = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/goal"
        Write-Verbose "Successfully retrieved $($Goals.goals.Count) goals."
        return $Goals.goals
    } catch {
        Write-Error "Failed to get goals for team ID $TeamID. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Get a single ClickUp team goal.
.DESCRIPTION
    Get a single ClickUp team goal. Supports pipeline input from goal objects for GoalID parameter.
.EXAMPLE
    PS C:\> Get-ClickUpGoal -GoalID e53a033c
    Get a ClickUp team goal with ID "e53a033c".
.EXAMPLE
    PS C:\> Get-ClickUpGoals -TeamID 123 | Get-ClickUpGoal
    Get detailed goal properties by piping a goal object.
.INPUTS
    System.UInt64. You can pipe a goal ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getgoal
#>
function Get-ClickUpGoal {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('goal_id','id')]
        [uint64]$GoalID
    )

    Write-Verbose "Getting goal with ID: $GoalID"
    try {
        $Goal = Invoke-ClickUpAPIGet -Endpoint "goal/$GoalID"
        Write-Verbose "Successfully retrieved goal: $($Goal.goal.name)"
        return $Goal.goal
    } catch {
        Write-Error "Failed to get goal with ID $GoalID. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Create a ClickUp team goal.
.DESCRIPTION
    Create a ClickUp team goal. Supports pipeline input from team/workspace objects for TeamID parameter.
.EXAMPLE
    PS C:\> New-ClickUpGoal -TeamID 123 -Name 'Goal Name' -DueDate "12/31/2021 17:00"
    Create a new ClickUp goal for team with ID "123" with the name of "Goal Name" and the due date of "December 31st, 2021 at 5:00 PM."
.EXAMPLE
    PS C:\> Get-ClickUpTeam -TeamID 123 | New-ClickUpGoal -Name 'Goal Name' -DueDate "12/31/2021 17:00"
    Create a new goal by piping a team/workspace object.
.INPUTS
    System.UInt64. You can pipe a team ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/creategoal
#>
function New-ClickUpGoal {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('team_id','id')]
        [uint64]$TeamID,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter()]
        [DateTime]$DueDate,
        [Parameter()]
        [string]$Description,
        [Parameter()]
        [bool]$MultipleOwners,
        [Parameter()]
        [uint64[]]$Owners,
        [Parameter()]
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

    Write-Verbose "Creating new goal '$Name' for team ID: $TeamID"
    try {
        $Goal = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/goal" -Body $Body
        Write-Verbose "Successfully created goal: $($Goal.goal.name) (ID: $($Goal.goal.id))"
        return $Goal.goal
    } catch {
        Write-Error "Failed to create goal '$Name'. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Update a ClickUp team goal.
.DESCRIPTION
    Update a ClickUp team goal. Supports pipeline input from goal objects for GoalID parameter.
.EXAMPLE
    PS C:\> Set-ClickUpGoal -GoalID e53a033c -Name "Updated Goal Name"
    Update ClickUp goal with ID "e53a033c" name to "Updated Goal Name".
.EXAMPLE
    PS C:\> Get-ClickUpGoal -GoalID e53a033c | Set-ClickUpGoal -Name "Updated Goal Name"
    Update a goal by piping a goal object.
.INPUTS
    System.UInt64. You can pipe a goal ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/updategoal
#>
function Set-ClickUpGoal {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(1, [uint64]::MaxValue)]
        [Alias('goal_id','id')]
        [uint64]$GoalID,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter()]
        [DateTime]$DueDate,
        [Parameter()]
        [string]$Description,
        [Parameter()]
        [bool]$MultipleOwners,
        [Parameter()]
        [uint64[]]$Owners,
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

    Write-Verbose "Updating goal with ID: $GoalID"
    try {
        $Goal = Invoke-ClickUpAPIPut -Endpoint "goal/$GoalID" -Body $Body
        Write-Verbose "Successfully updated goal: $($Goal.goal.name)"
        return $Goal.goal
    } catch {
        Write-Error "Failed to update goal with ID $GoalID. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Remove a ClickUp team goal.
.DESCRIPTION
    Remove a ClickUp team goal. Supports pipeline input from goal objects for GoalID parameter.
.EXAMPLE
    PS C:\> Remove-ClickUpGoal -GoalID e53a033c
    Remove ClickUp goal with ID "e53a033c".
.EXAMPLE
    PS C:\> Get-ClickUpGoal -GoalID e53a033c | Remove-ClickUpGoal
    Remove a goal by piping a goal object.
.INPUTS
    System.String. You can pipe a goal ID to this cmdlet.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/deletegoal
#>
function Remove-ClickUpGoal {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $True, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('goal_id','id')]
        [string]$GoalID
    )

    if ($PSCmdlet.ShouldProcess($GoalID, 'Remove Goal')) {
        Write-Verbose "Removing goal with ID: $GoalID"
        try {
            $Null = Invoke-ClickUpAPIDelete -Endpoint "goal/$GoalID"
            Write-Verbose "Successfully removed goal with ID: $GoalID"
        } catch {
            Write-Error "Failed to remove goal with ID $GoalID. Error: $_"
            throw $_
        }
    }
}

<#
.SYNOPSIS
    Create a ClickUp key result.
.DESCRIPTION
    Create a ClickUp key result. Supports pipeline input from goal objects for GoalID parameter.
.EXAMPLE
    PS C:\> New-ClickUpKeyResult -GoalID e53a033c -Name 'New Key Result Name' -Owners 183 -Type number -StepsStart 0 -StepsEnd 10 -Unit km
    Create a new ClickUp key result for goal with ID "e53a033c".
.EXAMPLE
    PS C:\> Get-ClickUpGoal -GoalID e53a033c | New-ClickUpKeyResult -Name 'New Key Result Name' -Owners 183
    Create a key result by piping a goal object.
.INPUTS
    System.String. You can pipe a goal ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/createkeyresult
#>
function New-ClickUpKeyResult {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('goal_id','id')]
        [string]$GoalID,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter()]
        [uint64[]]$Owners,
        [Parameter()]
        [ValidateSet('number', 'currency', 'boolean', 'percentage', 'automatic')]
        [string]$Type,
        [Parameter()]
        [ValidateRange(0, [uint64]::MaxValue)]
        [uint64]$StepsStart,
        [Parameter()]
        [ValidateRange(0, [uint64]::MaxValue)]
        [uint64]$StepsEnd,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Unit,
        [Parameter()]
        [string[]]$TaskIDs,
        [Parameter()]
        [uint64[]]$ListIDs
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

    Write-Verbose "Creating new key result '$Name' for goal ID: $GoalID"
    try {
        $KeyResult = Invoke-ClickUpAPIPost -Endpoint "goal/$GoalID/key_result" -Body $Body
        Write-Verbose "Successfully created key result: $($KeyResult.key_result.name) (ID: $($KeyResult.key_result.id))"
        return $KeyResult.key_result
    } catch {
        Write-Error "Failed to create key result '$Name'. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Update a ClickUp key result.
.DESCRIPTION
    Update a ClickUp key result. Supports pipeline input from key result objects for KeyResultID parameter.
.EXAMPLE
    PS C:\> Set-ClickUpKeyResult -KeyResultID 947d46ed -StepsCurrent 5 -Note 'Target achieved'
    Update a ClickUp key result with ID "947d46ed".
.EXAMPLE
    PS C:\> New-ClickUpKeyResult -GoalID e53a033c -Name 'New Key Result' | Set-ClickUpKeyResult -StepsCurrent 5
    Update a key result by piping a key result object.
.INPUTS
    System.String. You can pipe a key result ID to this cmdlet.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/editkeyresult
#>
function Set-ClickUpKeyResult {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('key_result_id','id')]
        [string]$KeyResultID,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Note,
        [Parameter()]
        [uint64[]]$Owners,
        [Parameter()]
        [ValidateSet('number', 'currency', 'boolean', 'percentage', 'automatic')]
        [string]$Type,
        [Parameter()]
        [ValidateRange(0, [uint64]::MaxValue)]
        [uint64]$StepsStart,
        [Parameter()]
        [ValidateRange(0, [uint64]::MaxValue)]
        [uint64]$StepsEnd,
        [Parameter()]
        [ValidateRange(0, [uint64]::MaxValue)]
        [uint64]$StepsCurrent,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Unit,
        [Parameter()]
        [string[]]$TaskIDs,
        [Parameter()]
        [uint64[]]$ListIDs
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

    Write-Verbose "Updating key result with ID: $KeyResultID"
    try {
        $KeyResult = Invoke-ClickUpAPIPut -Endpoint "key_result/$KeyResultID" -Body $Body
        Write-Verbose "Successfully updated key result: $($KeyResult.key_result.name)"
        return $KeyResult.key_result
    } catch {
        Write-Error "Failed to update key result with ID $KeyResultID. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Remove a ClickUp key result.
.DESCRIPTION
    Remove a ClickUp key result. Supports pipeline input from key result objects for KeyResultID parameter.
.EXAMPLE
    PS C:\> Remove-ClickUpKeyResult -KeyResultID 947d46ed
    Remove ClickUp key result with ID "947d46ed".
.EXAMPLE
    PS C:\> New-ClickUpKeyResult -GoalID e53a033c -Name 'New Key Result' | Remove-ClickUpKeyResult
    Remove a key result by piping a key result object.
.INPUTS
    System.String. You can pipe a key result ID to this cmdlet.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/deletekeyresult
#>
function Remove-ClickUpKeyResult {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $True, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('key_result_id','id')]
        [string]$KeyResultID
    )

    if ($PSCmdlet.ShouldProcess($KeyResultID, 'Remove Key Result')) {
        Write-Verbose "Removing key result with ID: $KeyResultID"
        try {
            $Null = Invoke-ClickUpAPIDelete -Endpoint "key_result/$KeyResultID"
            Write-Verbose "Successfully removed key result with ID: $KeyResultID"
        } catch {
            Write-Error "Failed to remove key result with ID $KeyResultID. Error: $_"
            throw $_
        }
    }
}
