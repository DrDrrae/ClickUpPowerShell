<#
.SYNOPSIS
    Add ClickUp dependency.
.DESCRIPTION
    Add ClickUp dependency. Supports pipeline input from task objects for TaskID parameter.
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
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID 9hv | Add-ClickUpDependency -DependsOn 9hz
    Add a dependency by piping a task object.
.INPUTS
    System.String. You can pipe a task ID to this cmdlet.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.

    To create a waiting on dependency, pass the property depends_on in the body. To create a blocking dependency, pass the property dependency_of. Both can not be passed in the same request.
.LINK
    https://developer.clickup.com/reference/adddependency
#>
function Add-ClickUpDependency {
    [CmdletBinding(DefaultParameterSetName = 'DependsOnTaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnTaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfTaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('task_id','id')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID')]
        [string]$DependsOn,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID')]
        [string]$DependendencyOf,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID')]
        [bool]$CustomTaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID')]
        [uint64]$TeamID
    )

    Write-Verbose "Entering Add-ClickUpDependency with TaskID: $TaskID"

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

    try {
        $Null = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/dependency" -Body $Body
    } catch {
        Write-Error "Failed to add dependency for TaskID: $TaskID. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Remove ClickUp dependency.
.DESCRIPTION
    Remove ClickUp dependency. Supports pipeline input from task objects for TaskID parameter.
.EXAMPLE
    PS C:\> Remove-ClickUpDependency -TaskID 9hv -DependsOn 9hz
    Remove ClickUp task with ID "9hz" as a dependency of ClickUp task with ID "9hv".
.EXAMPLE
    PS C:\> Remove-ClickUpDependency -TaskID 9hv -DependencyOf 9hz
    Remove ClickUp task with ID "9hv" as a dependency of ClickUp task with ID "9hz".
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID 9hv | Remove-ClickUpDependency -DependsOn 9hz
    Remove a dependency by piping a task object.
.INPUTS
    System.String. You can pipe a task ID to this cmdlet.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.

    One and only one of depends_on or dependency_of must be passed in the query params.
.LINK
    https://developer.clickup.com/reference/deletedependency
#>
function Remove-ClickUpDependency {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High', DefaultParameterSetName = 'DependsOnTaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnTaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfTaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('task_id','id')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID')]
        [string]$DependsOn,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID')]
        [string]$DependendencyOf,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID')]
        [bool]$CustomTaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID')]
        [uint64]$TeamID
    )

    Write-Verbose "Entering Remove-ClickUpDependency with TaskID: $TaskID"

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
        try {
            $Null = Invoke-ClickUpAPIDelete -Arguments $QueryString -Endpoint "task/$TaskID/dependency"
        } catch {
            Write-Error "Failed to remove dependency for TaskID: $TaskID. Error: $_"
            throw $_
        }
    }
}

<#
.SYNOPSIS
    Add ClickUp task link.
.DESCRIPTION
    Add ClickUp task link. Supports pipeline input from task objects for TaskID parameter.
.EXAMPLE
    PS C:\> Add-ClickUpTaskLink -TaskID 9hv -LinksTo 9hz
    Add ClickUp task with ID "9hz" as a link to ClickUp task with ID "9hv".
.EXAMPLE
    PS C:\> Add-ClickUpTaskLink -TaskID "CustomTaskID 1" -LinksTo "CustomTaskID 2" -CustomTaskID $true -TeamID 123
    Add ClickUp task with ID "CustomTaskID 2" as a link to ClickUp task with ID "CustomTaskID 1".
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID 9hv | Add-ClickUpTaskLink -LinksTo 9hz
    Add a task link by piping a task object.
.INPUTS
    System.String. You can pipe a task ID to this cmdlet.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/addtasklink
#>
function Add-ClickUpTaskLink {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('task_id','id')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$LinksTo,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [bool]$CustomTaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [uint64]$TeamID
    )

    Write-Verbose "Entering Add-ClickUpTaskLink with TaskID: $TaskID, LinksTo: $LinksTo"

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    try {
        $Null = Invoke-ClickUpAPIPost -Arguments $QueryString -Endpoint "task/$TaskID/link/$LinksTo/"
    } catch {
        Write-Error "Failed to add task link between $TaskID and $LinksTo. Error: $_"
        throw $_
    }
}

<#
.SYNOPSIS
    Remove ClickUp task link.
.DESCRIPTION
    Remove ClickUp task link. Supports pipeline input from task objects for TaskID parameter.
.EXAMPLE
    PS C:\> Remove-ClickUpTaskLink -TaskID 9hv -LinksTo 9hz
    Remove ClickUp task with ID "9hz" as a link to ClickUp task with ID "9hv".
.EXAMPLE
    PS C:\> Remove-ClickUpTaskLink -TaskID "CustomTaskID1" -LinksTo "CustomTaskID2" -CustomTaskID $true -TeamID 123456
    Remove ClickUp task with ID "CustomTaskID2" as a link to ClickUp task with ID "CustomTaskID1" using custom task IDs.
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID 9hv | Remove-ClickUpTaskLink -LinksTo 9hz
    Remove a task link by piping a task object.
.INPUTS
    System.String. You can pipe a task ID to this cmdlet.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/deletetasklink
#>
function Remove-ClickUpTaskLink {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High', DefaultParameterSetName = 'TaskID')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID', ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('task_id','id')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$LinksTo,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [bool]$CustomTaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [uint64]$TeamID
    )

    Write-Verbose "Entering Remove-ClickUpTaskLink with TaskID: $TaskID, LinksTo: $LinksTo"

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
        try {
            $Null = Invoke-ClickUpAPIDelete -Arguments $QueryString -Endpoint "task/$TaskID/link/$LinksTo/"
        } catch {
            Write-Error "Failed to remove task link between $TaskID and $LinksTo. Error: $_"
            throw $_
        }
    }
}