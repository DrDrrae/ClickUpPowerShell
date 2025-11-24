# Locations of settings path and file
$ClickUpAPIConfPath = "$($env:USERPROFILE)\ClickUpAPI"
$ClickUpAPIConfFile = 'Config.xml'

<#
.SYNOPSIS
    Exports the ClickUp module settings to a configuration file.
.DESCRIPTION
    Exports the current ClickUp API key and JSON conversion depth settings to a secure XML configuration file.
    The file is saved in the user's profile directory under 'ClickUpAPI'.
.EXAMPLE
    PS C:\> Export-ClickUpModuleSettings
    Exports the current settings to the configuration file.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    The API key is saved as a secure string.
#>
function Export-ClickUpModuleSettings {
    [CmdletBinding()]
    param ()

    Write-Verbose 'Entering Export-ClickUpModuleSettings'
    try {
        # Confirm variables exist and are not null before exporting
        if ($ClickUpAPIKey -and $ClickUpJSONConversionDepth) {
            Write-Verbose "Exporting settings to $ClickUpAPIConfPath\$ClickUpAPIConfFile"
            $secureString = $ClickUpAPIKey | ConvertFrom-SecureString
            if (-not (Test-Path -Path $ClickUpAPIConfPath)) {
                Write-Verbose "Creating directory $ClickUpAPIConfPath"
                New-Item -ItemType Directory -Force -Path $ClickUpAPIConfPath | ForEach-Object { $_.Attributes = 'hidden' }
            }

            $ClickupSettings = @{
                ClickUpAPIKey              = $secureString
                ClickUpJSONConversionDepth = $ClickUpJSONConversionDepth
            }
            $ClickupSettings | Export-Clixml -LiteralPath ($ClickUpAPIConfPath + '\' + $ClickUpAPIConfFile) -Force
            Write-Verbose 'Successfully exported settings'
        } else {
            Write-Error -Message "Failed export ClickUp Module settings to $ClickUpAPIConfPath\$ClickUpAPIConfFile. Variables not set."
        }
    } catch {
        Write-Error "Error in Export-ClickUpModuleSettings: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Imports the ClickUp module settings from a configuration file.
.DESCRIPTION
    Imports the ClickUp API key and JSON conversion depth settings from the secure XML configuration file.
    Sets the global variables 'ClickUpAPIKey' and 'ClickUpJSONConversionDepth'.
.EXAMPLE
    PS C:\> Import-ClickUpModuleSettings
    Imports the settings from the configuration file.
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    If the configuration file is not found, it sets a default JSON conversion depth and prompts the user to run Add-ClickUpAPIKey.
#>
function Import-ClickUpModuleSettings {
    [CmdletBinding()]
    param ()

    Write-Verbose 'Entering Import-ClickUpModuleSettings'
    try {
        if (Test-Path ($ClickUpAPIConfPath + '\' + $ClickUpAPIConfFile) ) {
            Write-Verbose "Loading configuration from $ClickUpAPIConfPath\$ClickUpAPIConfFile"
            $tmp_config = Import-Clixml -LiteralPath ($ClickUpAPIConfPath + '\' + $ClickUpAPIConfFile)

            $tmp_config.ClickUpAPIKey = ConvertTo-SecureString $tmp_config.ClickUpAPIKey

            Set-Variable -Name 'ClickUpAPIKey' -Value $tmp_config.ClickUpAPIKey -Option ReadOnly -Scope Global -Force
            Set-Variable -Name 'ClickUpJSONConversionDepth' -Value $tmp_config.ClickUpJSONConversionDepth -Scope Global -Force

            Write-Host "ClickUpAPI Module configuration loaded successfully from $ClickUpAPIConfPath\$ClickUpAPIConfFile!" -ForegroundColor Green

            # Clean things up
            Remove-Variable 'tmp_config'
            Write-Verbose 'Successfully imported settings'
        } else {
            Write-Warning -Message "No configuration file was found at $ClickUpAPIConfPath\$ClickUpAPIConfFile."

            Write-Host 'Please run Add-ClickUpAPIKey to get started.' -ForegroundColor Magenta

            Set-Variable -Name 'ClickUpJSONConversionDepth' -Value 100 -Scope Global -Force
            Write-Verbose 'Set default ClickUpJSONConversionDepth to 100'
        }
    } catch {
        Write-Error "Error in Import-ClickUpModuleSettings: $($_.Exception.Message)"
        throw $_
    }
}