<#
.SYNOPSIS
    Add ClickUp dependency.
.DESCRIPTION
    Add ClickUp dependency.
.PARAMETER TaskID
    The ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER DependsOn
    The ClickUp task ID that the task ID referenced by "TaskID" depends on.
.PARAMETER DependendencyOf
    The ClickUp task ID that the task ID referenced by "TaskID" is a dependency of.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to true.
.EXAMPLE
    PS C:\> Add-ClickUpDependency -TaskID 9hv -DependsOn 9hz
    Add ClickUp task with ID "9hz" as a dependency of ClickUp task with ID "9hv".
.EXAMPLE
    PS C:\> Add-ClickUpDependency -TaskID 9hv -DependencyOf 9hz
    Add ClickUp task with ID "9hv" as a dependency of ClickUp task with ID "9hz".
.EXAMPLE
    PS C:\> Add-ClickUpDependency -TaskID "CustomTaskID 1" -DependsOn "CustomTaskID 2" -CustomTaskID $true -TeamID 123
    Add ClickUp task with ID "CustomTaskID 2" as a dependency of ClickUp task with ID "CustomTaskID 1".
.EXAMPLE
    PS C:\> Add-ClickUpDependency -TaskID "CustomTaskID 1" -DependencyOf "CustomTaskID 2" -CustomTaskID $true -TeamID 123
    Add ClickUp task with ID "CustomTaskID 1" as a dependency of ClickUp task with ID "CustomTaskID 2".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.

    To create a waiting on dependency, pass the property depends_on in the body. To create a blocking dependency, pass the property dependency_of. Both can not be passed in the same request.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/dependencies/add-dependency.html
#>
function Add-ClickUpDependency {
    [CmdletBinding(DefaultParameterSetName = 'DependsOnTaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnTaskID', HelpMessage = 'The ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID', HelpMessage = 'The custom ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfTaskID', HelpMessage = 'The ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID', HelpMessage = 'The custom ClickUp task ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnTaskID', HelpMessage = 'The ClickUp task ID that the task ID referenced by "TaskID" depends on.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID', HelpMessage = 'The ClickUp task ID that the task ID referenced by "TaskID" depends on.')]
        [ValidateNotNullOrEmpty()]
        [string]$DependsOn,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfTaskID', HelpMessage = 'The ClickUp task ID that the task ID referenced by "TaskID" is a dependency of.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID', HelpMessage = 'The ClickUp task ID that the task ID referenced by "TaskID" is a dependency of.')]
        [ValidateNotNullOrEmpty()]
        [string]$DependendencyOf,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [ValidateNotNullOrEmpty()]
        [bool]$CustomTaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to true.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to true.')]
        [ValidateNotNullOrEmpty()]
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

    if ($PSBoundParameters.ContainsKey('DependsOn')) {
        $Body = @{
            depends_on = $DependsOn
        }
    } elseif ($PSBoundParameters.ContainsKey('DependendencyOf')) {
        $Body = @{
            dependency_of = $DependendencyOf
        }
    }

    Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/dependency" -Body $Body
}

<#
.SYNOPSIS
    Remove ClickUp dependency.
.DESCRIPTION
    Remove ClickUp dependency.
.PARAMETER TaskID
    The ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER DependsOn
    The ClickUp task ID that the task ID referenced by "TaskID" depends on to be removed.
.PARAMETER DependendencyOf
    The ClickUp task ID that the task ID referenced by "TaskID" is a dependency of to be removed.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to true.
.EXAMPLE
    PS C:\> Remove-ClickUpDependency -TaskID 9hv -DependsOn 9hz
    Remove ClickUp task with ID "9hz" as a dependency of ClickUp task with ID "9hv".
.EXAMPLE
    PS C:\> Remove-ClickUpDependency -TaskID 9hv -DependencyOf 9hz
    Remove ClickUp task with ID "9hv" as a dependency of ClickUp task with ID "9hz".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.

    One and only one of depends_on or dependency_of must be passed in the query params.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/dependencies/delete-dependency.html
#>
function Remove-ClickUpDependency {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High', DefaultParameterSetName = 'DependsOnTaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnTaskID', HelpMessage = 'The ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID', HelpMessage = 'The custom ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfTaskID', HelpMessage = 'The ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID', HelpMessage = 'The custom ClickUp task ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnTaskID', HelpMessage = 'The ClickUp task ID that the task ID referenced by "TaskID" depends on.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID', HelpMessage = 'The ClickUp task ID that the task ID referenced by "TaskID" depends on.')]
        [ValidateNotNullOrEmpty()]
        [string]$DependsOn,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfTaskID', HelpMessage = 'The ClickUp task ID that the task ID referenced by "TaskID" is a dependency of.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID', HelpMessage = 'The ClickUp task ID that the task ID referenced by "TaskID" is a dependency of.')]
        [ValidateNotNullOrEmpty()]
        [string]$DependendencyOf,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [ValidateNotNullOrEmpty()]
        [bool]$CustomTaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to true.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to true.')]
        [ValidateNotNullOrEmpty()]
        [UInt32]$TeamID
    )

    $QueryString = @{}

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    }

    if ($PSBoundParameters.ContainsKey('DependsOn')) {
        $QueryString.Add('depends_on', $DependsOn)
    } elseif ($PSBoundParameters.ContainsKey('DependendencyOf')) {
        $QueryString.Add('dependency_of', $DependendencyOf)
    }

    if ($PSCmdlet.ShouldProcess($TaskID)) {
        Invoke-ClickUpAPIDelete -Arguments $QueryString -Endpoint "task/$TaskID/dependency"
    }
}

<#
.SYNOPSIS
    Add ClickUp task link.
.DESCRIPTION
    Add ClickUp task link.
.PARAMETER TaskID
    The ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER LinksTo
    The ClickUp task ID that the task ID referenced by "TaskID" should be linked to.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to true.
.EXAMPLE
    PS C:\> Add-ClickUpTaskLink -TaskID 9hv -LinksTo 9hz
    Add ClickUp task with ID "9hz" as a link to ClickUp task with ID "9hv".
.EXAMPLE
    PS C:\> Add-ClickUpTaskLink -TaskID "CustomTaskID 1" -LinksTo "CustomTaskID 2" -CustomTaskID $true -TeamID 123
    Add ClickUp task with ID "CustomTaskID 2" as a link to ClickUp task with ID "CustomTaskID 1".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/dependencies/add-task-link.html
#>
function Add-ClickUpTaskLink {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'The ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID', HelpMessage = 'The custom ClickUp task ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'The ClickUp task ID that the task ID referenced by "TaskID" should be linked to.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID', HelpMessage = 'The ClickUp task ID that the task ID referenced by "TaskID" should be linked to.')]
        [ValidateNotNullOrEmpty()]
        [string]$LinksTo,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [ValidateNotNullOrEmpty()]
        [bool]$CustomTaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to true.')]
        [ValidateNotNullOrEmpty()]
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

    Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/link/$LinksTo/"
}

<#
.SYNOPSIS
    Remove ClickUp task link.
.DESCRIPTION
    Remove ClickUp task link.
.PARAMETER TaskID
    The ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER LinksTo
    The ClickUp task ID that the task ID referenced by "TaskID" should be removed from linked to.
.PARAMETER CustomTaskIDs
    Set to true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to true.
.EXAMPLE
    PS C:\> Remove-ClickUpTaskLink -TaskID 9hv -LinksTo 9hz
    Remove ClickUp task with ID "9hz" as a link to ClickUp task with ID "9hv".
.EXAMPLE
    PS C:\> Remove-ClickUpTaskLink -TaskID 9hv -LinksTo 9hz
    Remove ClickUp task with ID "CustomTaskID 2" as a link to ClickUp task with ID "CustomTaskID 1".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/dependencies/delete-task-link.html
#>
function Remove-ClickUpTaskLink {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High', DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'The ClickUp task ID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID', HelpMessage = 'The custom ClickUp task ID.')]
        [ValidateNotNullOrEmpty()]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', HelpMessage = 'The ClickUp task ID that the task ID referenced by "TaskID" should be removed from linked to.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID', HelpMessage = 'The ClickUp task ID that the task ID referenced by "TaskID" should be removed from linked to.')]
        [ValidateNotNullOrEmpty()]
        [string]$LinksTo,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID', HelpMessage = 'Set to true if the task ID provided is a custom ID.')]
        [ValidateNotNullOrEmpty()]
        [bool]$CustomTaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID', HelpMessage = 'Required ClickUp team ID if -CustomTaskIDs is set to true.')]
        [ValidateNotNullOrEmpty()]
        [UInt32]$TeamID
    )

    $QueryString = @{}

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    }

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    if ($PSCmdlet.ShouldProcess($TaskID)) {
        Invoke-ClickUpAPIDelete -Arguments $QueryString -Endpoint "task/$TaskID/link/$LinksTo/"
    }
}