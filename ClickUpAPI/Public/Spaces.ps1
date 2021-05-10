<#
.SYNOPSIS
    Get the details on all ClickUp Spaces in a team.
.DESCRIPTION
    Get the details on all ClickUp Spaces in a team.
.EXAMPLE
    PS C:\> Get-ClickUpSpaces TeamID 11111111
    Returns the data on all the ClickUp Spaces with the Team ID "11111111"
.EXAMPLE
    PS C:\> Get-ClickUpSpaces TeamID 11111111 -Archived $true
    Returns the data on all the ClickUp Spaces with the Team ID "11111111" including archived
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/get-spaces.html
#>
function Get-ClickUpSpaces {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$TeamID,
        [Parameter()]
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
.EXAMPLE
    PS C:\> Get-ClickUpSpace SpaceID 11111111
    Returns the data on the ClickUp Space with ID "11111111"
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/get-space.html
#>
function Get-ClickUpSpace {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$SpaceID
    )
    $Space = Invoke-ClickUpAPIGet -Endpoint "space/$SpaceID"
    Return $Space
}

<#
.SYNOPSIS
    Create a new ClickUp Space.
.DESCRIPTION
    Create a new ClickUp Space.
.EXAMPLE
    PS C:\> New-ClickUpSpace -TeamID 11111111 -Name 'New ClickUp Space' -Multiple_Assignees
    Creates a new ClickUp Space with the name "New Clickup Space" and the Multiple Assignees feature enabled.
.INPUTS
    None
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/create-space.html
#>
function New-ClickUpSpace {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$TeamID,
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [bool]$Multiple_Assignees = $true,
        [bool]$FeatureDueDates = $true,
        [bool]$FeatureStartDate = $false,
        [bool]$FeatureRemapDueDates = $true,
        [bool]$FeatureRemapClosedDueDate = $true,
        [bool]$FeatureTimeTracking = $true,
        [bool]$FeatureTags = $true,
        [bool]$FeatureTimeEstimates = $true,
        [bool]$FeatureChecklist = $true,
        [bool]$FeatureCustomFields = $true,
        [bool]$FeatureRemapdependencies = $true,
        [bool]$FeatureDependencyWarning = $true,
        [bool]$FeaturePortfolios = $true
    )
    $Body = @{
        name               = $Name
        multiple_assignees = $Multiple_Assignees
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
    System.Object Hashtable.
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
    param (
        [Parameter(Mandatory = $true)]
        [int]$SpaceID,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )

    $Space = Invoke-ClickUpAPIPut -Endpoint "space/$SpaceID" -Body $Body
    Return $Space
}

function Remove-ClickupSpace {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$SpaceID
    )

    $Space = Invoke-ClickUpAPIDelete -Endpoint "space/$SpaceID"
    Return $Space
}