<#
.SYNOPSIS
    Get all ClickUp task members.
.DESCRIPTION
    Get all ClickUp task members. Can accept TaskID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Get-ClickUpTaskMembers -TaskId 9hz
    Gets ClickUp task members from task with ID "9hz".
.EXAMPLE
    PS C:\> Get-ClickUpTask -TaskID 9hz | Get-ClickUpTaskMembers
    Gets task members by piping task ID from Get-ClickUpTask.
.INPUTS
    System.String. TaskID via pipeline by property name.
.OUTPUTS
    System.Object
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/gettaskmembers
#>
function Get-ClickUpTaskMembers {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('task_id','id')]
        [string]$TaskID
    )

    Write-Verbose 'Entering Get-ClickUpTaskMembers'
    try {
        Write-Verbose "Getting members for task ID: $TaskID"
        $TaskMembers = Invoke-ClickUpAPIGet -Endpoint "task/$TaskID/member"
        Write-Verbose 'Successfully retrieved task members'
        return $TaskMembers.members
    } catch {
        Write-Error "Error in Get-ClickUpTaskMembers: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Get all ClickUp list members.
.DESCRIPTION
    Get all ClickUp list members. Can accept ListID via pipeline input for integration with other cmdlets.
.EXAMPLE
    PS C:\> Get-ClickUpListMembers -ListId 123
    Gets ClickUp list members from list with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpList -ListID 123 | Get-ClickUpListMembers
    Gets list members by piping list ID from Get-ClickUpList.
.INPUTS
    System.UInt64. ListID via pipeline by property name.
.OUTPUTS
    System.Object
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getlistmembers
#>
function Get-ClickUpListMembers {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('list_id','id')]
        [uint64]$ListID
    )

    Write-Verbose 'Entering Get-ClickUpListMembers'
    try {
        Write-Verbose "Getting members for list ID: $ListID"
        $ListMembers = Invoke-ClickUpAPIGet -Endpoint "list/$ListID/member"
        Write-Verbose 'Successfully retrieved list members'
        return $ListMembers.members
    } catch {
        Write-Error "Error in Get-ClickUpListMembers: $($_.Exception.Message)"
        throw $_
    }
}