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
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/task-templates/get-task-templates.html
#>
function Get-ClickUpTaskTemplates {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [UInt32]$TeamID,
        [Parameter()]
        [UInt32]$Page = 0
    )

    $QueryString = @{
        page = $Page
    }

    $Templates = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "team/$TeamID/taskTemplate"
    Return $Templates.templates
}

<#
.SYNOPSIS
    Create a ClickUp task from template.
.DESCRIPTION
    Create a ClickUp task from template.
.EXAMPLE
    PS C:\> New-ClickUpTaskFromTemplate -TeamID 512
    Get all ClickUp team goals for team with ID "123".
.EXAMPLE
    PS C:\> Get-ClickUpTaskFromTemplate -TeamID 512 -Page 1
    Get all ClickUp team goals for team with ID "123" starting on page 2.
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/task-templates/create-task-from-template.html
#>
function New-ClickUpTaskFromTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [UInt32]$ListID,
        [Parameter(Mandatory = $true)]
        [string]$TemplateID,
        [Parameter()]
        [string]$Name
    )

    if ($PSBoundParameters.ContainsKey('Name')) {
        $Body = @{
            name = $Name
        }
    } else {
        $Body = @{}
    }

    $Task = Invoke-ClickUpAPIPost -Endpoint 'list/$ListID/taskTemplate/$TemplateID' -Body $Body
    Return $Task
}
