
<#
.SYNOPSIS
    Get Clickup Custom Task Types.
.DESCRIPTION
    Get Clickup Custom Task Types. Supports pipeline input from team/workspace objects for TeamID parameter.
.EXAMPLE
    PS C:\> Get-ClickUpCustomTaskTypes -TeamID 123
    Get Clickup Custom Task Types for Team with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpTeam -TeamID 123 | Get-ClickUpCustomTaskTypes
    Get custom task types by piping a team/workspace object.
.INPUTS
    System.UInt64. You can pipe a team ID to this cmdlet.
.OUTPUTS
    System.Object
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
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('team_id','id')]
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
