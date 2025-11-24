<#
.SYNOPSIS
    Get all ClickUp task templates.
.DESCRIPTION
    Get all ClickUp task templates.
.EXAMPLE
    PS C:\> Get-ClickUpTaskTemplates -TeamID 512
    Get all ClickUp task templates for team with ID "512".
.EXAMPLE
    PS C:\> Get-ClickUpTaskTemplates -TeamID 512 -Page 1
    Get all ClickUp task templates for team with ID "512" starting on page 2.
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
        [ulong]$TeamID,
        [Parameter()]
        [ulong]$Page = 0
    )

    Write-Verbose 'Entering Get-ClickUpTaskTemplates'
    $QueryString = @{
        page = $Page
    }

    try {
        Write-Verbose "Getting task templates for team ID: $TeamID (Page: $Page)"
        $Templates = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "team/$TeamID/taskTemplate"
        Write-Verbose 'Successfully retrieved task templates'
        return $Templates.templates
    } catch {
        Write-Error "Error in Get-ClickUpTaskTemplates: $($_.Exception.Message)"
        throw $_
    }
}