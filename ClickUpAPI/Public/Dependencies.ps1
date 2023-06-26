<#
.SYNOPSIS
    Add ClickUp dependency.
.DESCRIPTION
    Add ClickUp dependency.
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
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID')]
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
        [UInt64]$TeamID
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
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependsOnCustomTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfTaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'DependendencyOfCustomTaskID')]
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
        [UInt64]$TeamID
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
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$LinksTo,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [bool]$CustomTaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [UInt64]$TeamID
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
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [string]$LinksTo,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [bool]$CustomTaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskID')]
        [UInt64]$TeamID
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