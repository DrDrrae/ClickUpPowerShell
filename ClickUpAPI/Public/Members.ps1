<#
.SYNOPSIS
    Get all ClickUp task members.
.DESCRIPTION
    Get all ClickUp task members.
.EXAMPLE
    PS C:\> Get-ClickUpTaskMembers -TaskId 9hz
    Get ClickUp task members from task with ID "9hz".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
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
        [Parameter(Mandatory = $true)]
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
    Get all ClickUp list members.
.EXAMPLE
    PS C:\> Get-ClickUpListMembers -ListId 123
    Get ClickUp list members from list with ID "123".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
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
        [Parameter(Mandatory = $true)]
        [ulong]$ListID
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