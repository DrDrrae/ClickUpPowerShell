
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

    $CustomTaskTypes = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "team/$TeamID/custom_item"
    return $CustomTaskTypes.custom_items
}
