# Locations of settings path and file
$ClickUpAPIConfPath = "$($env:USERPROFILE)\ClickUpAPI"
$ClickUpAPIConfFile = 'Config.xml'

function Export-ClickUpModuleSettings {
    [CmdletBinding()]
    param ()
    # Confirm variables exist and are not null before exporting
    if ($ClickUpAPIKey -and $ClickUpJSONConversionDepth) {
        $secureString = $ClickUpAPIKey | ConvertFrom-SecureString
        if (-not (Test-Path -Path $ClickUpAPIConfPath)) {
            New-Item -ItemType Directory -Force -Path $ClickUpAPIConfPath | ForEach-Object { $_.Attributes = 'hidden' }
        }

        $ClickupSettings = @{
            ClickUpAPIKey              = $secureString
            ClickUpJSONConversionDepth = $ClickUpJSONConversionDepth
        }
        $ClickupSettings | Export-Clixml -LiteralPath ($ClickUpAPIConfPath + '\' + $ClickUpAPIConfFile) -Force
    } else {
        Write-Error -Message "Failed export ITGlue Module settings to $ClickUpAPIConfPath\$ITGlueAPIConfFile."
    }
}

function Import-ClickUpModuleSettings {
    [CmdletBinding()]
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