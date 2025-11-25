
<#
.SYNOPSIS
    Get Clickup Custom Task Types.
.DESCRIPTION
    Get Clickup Custom Task Types.
.EXAMPLE
    PS C:\> Get-ClickUpCustomTaskTypes -TeamID 123
    Get Clickup Custom Task Types for Team with ID "123".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/getcustomitems
#>
function Get-ClickUpCustomTaskTypes {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true)]
        [ulong]$TeamID
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
