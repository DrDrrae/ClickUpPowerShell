# Locations of settings path and file
$ClickUpAPIConfPath = "$($env:USERPROFILE)\ClickUpAPI"
$ClickUpAPIConfFile = 'Config.xml'

<#
.SYNOPSIS
    Save ClickUp module settings to a file in the user's profile. Can be imported later.
.DESCRIPTION
    Save ClickUp module settings including the ClickUp API Key and JSON conversion depth to a file in the user's profile. Can be imported later.
.EXAMPLE
    PS C:\> Export-ClickUpModuleSettings
    Exports and saves the ClickUp module settings to the user's profile.
.INPUTS
    None
.OUTPUTS
    System.Void
#>
function Export-ClickUpModuleSettings {
    [CmdletBinding()]
    [OutputType([System.Void])]
    param ()
    # Confirm variables exist and are not null before exporting
    if ($ClickUpAPIKey -and $ClickUpJSONConversionDepth) {
        $secureString = $ClickUpAPIKey | ConvertFrom-SecureString
        if (-not (Test-Path -Path $ClickUpAPIConfPath)) {
            New-Item -ItemType Directory -Force -Path $ClickUpAPIConfPath | ForEach-Object { $_.Attributes = 'hidden' }
        }

        $ClickUpSettings = @{
            ClickUpAPIKey              = $secureString
            ClickUpJSONConversionDepth = $ClickUpJSONConversionDepth
        }
        $ClickUpSettings | Export-Clixml -LiteralPath ($ClickUpAPIConfPath + '\' + $ClickUpAPIConfFile) -Force
    } else {
        Write-Error -Message "Failed export ClickUp Module settings to $ClickUpAPIConfPath\$ITGlueAPIConfFile."
    }
}

<#
.SYNOPSIS
    Retrieves the ClickUp module settings from a file in the user's profile. Can be exported later.
.DESCRIPTION
    Retrieves the ClickUp module settings including the ClickUp API Key and JSON conversion depth from a file in the user's profile. Can be exported later.
.EXAMPLE
    PS C:\> Import-ClickUpModuleSettings
    Imports the ClickUp module settings from the user's profile into the current session.
.INPUTS
    None
.OUTPUTS
    System.Void
#>
function Import-ClickUpModuleSettings {
    [CmdletBinding()]
    [OutputType([System.Void])]
    param ()

    if (Test-Path ($ClickUpAPIConfPath + '\' + $ClickUpAPIConfFile) ) {
        $tmp_config = Import-Clixml -LiteralPath ($ClickUpAPIConfPath + '\' + $ClickUpAPIConfFile)

        $tmp_config.ClickUpAPIKey = ConvertTo-SecureString $tmp_config.ClickUpAPIKey

        Set-Variable -Name 'ClickUpAPIKey' -Value $tmp_config.ClickUpAPIKey -Option ReadOnly -Scope Global -Force
        Set-Variable -Name 'ClickUpJSONConversionDepth' -Value $tmp_config.ClickUpJSONConversionDepth -Scope Global -Force

        Write-Host "ClickUpAPI Module configuration loaded successfully from $ClickUpAPIConfPath\$ClickUpAPIConfFile!" -ForegroundColor Green

        # Clean things up
        Remove-Variable 'tmp_config'
    } else {
        Write-Warning -Message "No configuration file was found at $ClickUpAPIConfPath\$ClickUpAPIConfFile."

        Write-Host 'Please run Add-ClickUpAPIKey to get started.' -ForegroundColor Magenta

        Set-Variable -Name 'ClickUpJSONConversionDepth' -Value 100 -Scope Global -Force
    }
}