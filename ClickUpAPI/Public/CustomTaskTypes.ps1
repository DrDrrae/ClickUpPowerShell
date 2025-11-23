
<#
.SYNOPSIS
    Get Clickup Custom Task Types.
.DESCRIPTION
    Get Clickup Custom Task Types.
.EXAMPLE
    PS C:\> Get-ClickUpCustomTaskTypes -TeamID 123
    Get Clickup Custom Task Types for Team with ID "123".
.INPUTS
    None
.OUTPUTS
    System.Object Array.
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getcustomitems
#>
function Get-ClickUpCustomTaskTypes {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [uint64]$TeamID
    )

    Write-Verbose "Retrieving custom task types for TeamID: $TeamID"
    try {
        $CustomTaskTypes = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/custom_item"
        Write-Verbose 'Successfully retrieved custom task types.'
        return $CustomTaskTypes.custom_items
    } catch {
        Write-Error "Failed to retrieve custom task types. Error: $_"
        throw
    }
}
