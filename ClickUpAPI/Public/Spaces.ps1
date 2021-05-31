<#
.SYNOPSIS
    Get the details on all ClickUp Spaces in a team.
.DESCRIPTION
    Get the details on all ClickUp Spaces in a team.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER Archived
    If set to true, will returned archived spaces in addition to non-archived spaces.
.EXAMPLE
    PS C:\> Get-ClickUpSpaces TeamID 11111111
    Returns the data on all the ClickUp Spaces with the Team ID "11111111"
.EXAMPLE
    PS C:\> Get-ClickUpSpaces TeamID 11111111 -Archived $true
    Returns the data on all the ClickUp Spaces with the Team ID "11111111" including archived
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/get-spaces.html
#>
function Get-ClickUpSpaces {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(HelpMessage = 'If set to true, will returned archived spaces in addition to non-archived spaces.')]
        [ValidateNotNullOrEmpty()]
        [bool]$Archived = $false
    )

    $QueryString = @{
        $Archived = $Archived
    }

    $Spaces = Invoke-ClickUpAPIGet -Arguments $QueryString -Endpoint "team/$TeamID/space"
    Return $Spaces.spaces
}

<#
.SYNOPSIS
    Get the details on a single ClickUp Space.
.DESCRIPTION
    Get the details on a single ClickUp Space.
.PARAMETER SpaceID
    ClickUp space ID.
.EXAMPLE
    PS C:\> Get-ClickUpSpace SpaceID 11111111
    Returns the data on the ClickUp Space with ID "11111111"
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/get-space.html
#>
function Get-ClickUpSpace {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp space ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$SpaceID
    )
    $Space = Invoke-ClickUpAPIGet -Endpoint "space/$SpaceID"
    Return $Space
}

<#
.SYNOPSIS
    Create a new ClickUp Space.
.DESCRIPTION
    Create a new ClickUp Space.
.PARAMETER TeamID
    ClickUp team ID.
.PARAMETER Name
    Name of the new ClickUp space.
.PARAMETER MultipleAssignees
    Set to true to enable the multiple assignees ClickUp app.
.PARAMETER FeatureDueDates
    Set to true to enable the due dates ClickUp app.
.PARAMETER FeatureStartDate
    Set to true to enable the start dates ClickUp app.
.PARAMETER FeatureRemapDueDates
    Set to true to enable the remap due dates ClickUp app.
.PARAMETER FeatureRemapClosedDueDate
    Set to true to enable the remap closed due date ClickUp app.
.PARAMETER FeatureTimeTracking
    Set to true to enable the time tracking ClickUp app.
.PARAMETER FeatureTags
    Set to true to enable the tags ClickUp app.
.PARAMETER FeatureTimeEstimates
    Set to true to enable the time estimates ClickUp app.
.PARAMETER FeatureChecklist
    Set to true to enable the checklist ClickUp app.
.PARAMETER FeatureCustomFields
    Set to true to enable the custom fields ClickUp app.
.PARAMETER FeatureRemapDependencies
    Set to true to enable the remap dependencies ClickUp app.
.PARAMETER FeatureDependencyWarning
    Set to true to enable the dependency warning ClickUp app.
.PARAMETER FeaturePortfolios
    Set to true to enable the portfolios ClickUp app.
.EXAMPLE
    PS C:\> New-ClickUpSpace -TeamID 11111111 -Name 'New ClickUp Space' -Multiple_Assignees
    Creates a new ClickUp Space with the name "New Clickup Space" and the Multiple Assignees feature enabled.
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/create-space.html
#>
function New-ClickUpSpace {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp team ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$TeamID,
        [Parameter(Mandatory = $true, HelpMessage = 'Name of the new ClickUp space.')]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter(HelpMessage = 'Set to true to enable the multiple assignees ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$MultipleAssignees = $false,
        [Parameter(HelpMessage = 'Set to true to enable the due dates ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$FeatureDueDates = $false,
        [Parameter(HelpMessage = 'Set to true to enable the start dates ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$FeatureStartDate = $false,
        [Parameter(HelpMessage = 'Set to true to enable the remap due dates ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$FeatureRemapDueDates = $false,
        [Parameter(HelpMessage = 'Set to true to enable the remap closed due date ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$FeatureRemapClosedDueDate = $false,
        [Parameter(HelpMessage = 'Set to true to enable the time tracking ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$FeatureTimeTracking = $false,
        [Parameter(HelpMessage = 'Set to true to enable the tags ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$FeatureTags = $false,
        [Parameter(HelpMessage = 'Set to true to enable the time estimates ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$FeatureTimeEstimates = $false,
        [Parameter(HelpMessage = 'Set to true to enable the checklist ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$FeatureChecklist = $false,
        [Parameter(HelpMessage = 'Set to true to enable the custom fields ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$FeatureCustomFields = $false,
        [Parameter(HelpMessage = 'Set to true to enable the remap dependencies ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$FeatureRemapDependencies = $false,
        [Parameter(HelpMessage = 'Set to true to enable the dependency warning ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$FeatureDependencyWarning = $false,
        [Parameter(HelpMessage = 'Set to true to enable the portfolios ClickUp app.')]
        [ValidateNotNullOrEmpty()]
        [bool]$FeaturePortfolios = $false
    )
    $Body = @{
        name               = $Name
        multiple_assignees = $MultipleAssignees
        features           = @{
            due_dates          = @{
                enabled                = $FeatureDueDates
                start_date             = $FeatureStartDate
                remap_due_dates        = $FeatureRemapDueDates
                remap_closed_due_dates = $FeatureRemapClosedDueDate
            }
            time_tracking      = @{
                enabled = $FeatureTimeTracking
            }
            tags               = @{
                enabled = $FeatureTags
            }
            time_estimates     = @{
                enabled = $FeatureTimeEstimates
            }
            checklists         = @{
                enabled = $FeatureChecklist
            }
            custom_fields      = @{
                enabled = $FeatureCustomFields
            }
            remap_dependencies = @{
                enabled = $FeatureRemapdependencies
            }
            dependency_warning = @{
                enabled = $FeatureDependencyWarning
            }
            portfolios         = @{
                enabled = $FeaturePortfolios
            }
        }
    }
    $Space = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/space" -Body $Body
    Return $Space
}

<#
.SYNOPSIS
    Change settings of a ClickUp Space
.DESCRIPTION
    Change settings of a ClickUp Space. Requires passing a hashtable of expected changes.
.PARAMETER SpaceID
    ClickUp space ID.
.PARAMETER Body
    Hashtable containing the settings and/or properties to change on the ClickUp space.
.EXAMPLE
    PS C:\> $Body = @{
    >> name = 'New Name'
    >> features = @{
    >>     time_tracking = @{
    >>         enabled = $true
    >>     }
    >> }
    >> }
    PS C:\> Set-ClickUpSpace -SpaceID 11111111 -Body $Body
    Will change the name of space with ID "11111111" to "New Name" and enables the time tracking feature.
.EXAMPLE
    PS C:\> $Body = @{
    >> features = @{
    >>     "due_dates" = @{
    >>         "enabled" = $false
    >>         "start_date" = $false
    >>         "remap_due_dates" = $false
    >>         "remap_closed_due_date" = $false
    >>     }
    >>     time_tracking = @{
    >>         enabled = $false
    >>     }
    >>     "custom_fields" = @{
    >>         "enabled" = $false
    >>     }
    >> }
    >> }
    PS C:\> Set-ClickUpSpace -SpaceID 11111111 -Body $Body
    Will enable the due dates feature and disable the time tracking and custom fields features of space with ID "11111111".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information on how to format the body.

    Body format:
    @{
        "name" = "Updated Space Name"
        "multiple_assignees" = $false
        "features" = @{
            "due_dates" = @{
                "enabled" = $false
                "start_date" = $false
                "remap_due_dates" = $false
                "remap_closed_due_date" = $false
            }
            "time_tracking" = @{
                "enabled" = $false
            }
            "tags" = @{
                "enabled" = $false
            }
            "time_estimates" = @{
                "enabled" = $false
            }
            "checklists" = @{
                "enabled" = $true
            }
            "custom_fields" = @{
                "enabled" = $true
            }
            "remap_dependencies" = @{
                "enabled" = $false
            }
            "dependency_warning": @{
                "enabled" = $false
            }
            "portfolios" = @{
                "enabled" = $false
            }
        }
    }
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/update-space.html
#>
function Set-ClickUpSpace {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp space ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$SpaceID,
        [Parameter(Mandatory = $true, HelpMessage = 'Hashtable containing the settings and/or properties to change on the ClickUp space.')]
        [ValidateNotNullOrEmpty()]
        [hashtable]$Body
    )

    $Space = Invoke-ClickUpAPIPut -Endpoint "space/$SpaceID" -Body $Body
    Return $Space
}


<#
.SYNOPSIS
    Remove a ClickUp Space
.DESCRIPTION
    Remove a ClickUp Space
.PARAMETER SpaceID
    ClickUp space ID.
.EXAMPLE
    PS C:\> Set-ClickUpSpace -SpaceID 11111111
    Remove ClickUp space with ID "11111111".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/delete-space.html
#>
function Remove-ClickupSpace {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true, HelpMessage = 'ClickUp space ID.')]
        [ValidateNotNullOrEmpty()]
        [UInt64]$SpaceID
    )

    if ($PSCmdlet.ShouldProcess($SpaceID)) {
        $Space = Invoke-ClickUpAPIDelete -Endpoint "space/$SpaceID"
        Return $Space
    }
}