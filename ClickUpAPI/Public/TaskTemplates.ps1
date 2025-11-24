<#
.SYNOPSIS
    Get all ClickUp task templates.
.DESCRIPTION
    Get all ClickUp task templates.
.EXAMPLE
    PS C:\> Get-ClickUpTaskTemplates -TeamID 512
    Get all ClickUp team goals for team with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpTaskTemplates -TeamID 512 -Page 1
    Get all ClickUp team goals for team with ID "123" starting on page 2.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.OUTPUTS
    System.Array
.NOTES
    See the link for information.
.LINK
    https://developer.clickup.com/reference/gettasktemplates
#>
function Get-ClickUpTaskTemplates {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt64]$TeamID,
        [Parameter()]
        [UInt64]$Page = 0
    )

    $QueryString = @{
        page = $Page
    }

    $Templates = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "team/$TeamID/taskTemplate"
    return $Templates.templates
}