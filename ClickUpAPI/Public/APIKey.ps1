<#
.SYNOPSIS
    Adds a ClickUp API key to the current session.

.DESCRIPTION
    The Add-ClickUpAPIKey cmdlet securely stores the provided ClickUp API key in a global variable for use by other cmdlets in this module.
    The key is converted to a SecureString and stored in a read-only global variable named 'ClickUpAPIKey'.

.PARAMETER APIKey
    The ClickUp API key to be stored. This parameter is mandatory and can be piped.

.EXAMPLE
    Add-ClickUpAPIKey -APIKey "pk_12345678_ABCDEF1234567890"

    Stores the provided API key in the session.

.INPUTS
    System.String. You can pipe a string containing the API key to this cmdlet.

.OUTPUTS
    None. This cmdlet does not return any output.
#>
function Add-ClickUpAPIKey {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$APIKey
    )

    begin {}

    process {
        Write-Verbose 'Converting API key to SecureString...'
        try {
            $SecureAPIKey = ConvertTo-SecureString $ApiKey -AsPlainText -Force
        } catch {
            Write-Error "Failed to convert API key to SecureString. Error: $_"
            return
        }

        Write-Verbose "Setting global variable 'ClickUpAPIKey'..."
        try {
            $Null = Set-Variable -Name 'ClickUpAPIKey' -Value $SecureAPIKey -Option ReadOnly -Scope Global -Force
        } catch {
            Write-Error "Failed to set global variable 'ClickUpAPIKey'. Error: $_"
        }
    }

    end {
        Remove-Variable -Name ApiKey -ErrorAction SilentlyContinue
    }
}

<#
.SYNOPSIS
    Removes the stored ClickUp API key.

.DESCRIPTION
    The Remove-ClickUpAPIKey cmdlet removes the global variable containing the ClickUp API key from the current session.
    This action requires confirmation if the ConfirmImpact is set to High (default).

.EXAMPLE
    Remove-ClickUpAPIKey

    Removes the stored API key from the session.

.INPUTS
    None. This cmdlet does not accept any input.

.OUTPUTS
    None. This cmdlet does not return any output.
#>
function Remove-ClickUpAPIKey {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param ()

    begin {}

    process {
        if ($PSCmdlet.ShouldProcess('ClickUpAPIKey', 'Remove Global Variable')) {
            Write-Verbose "Removing global variable 'ClickUpAPIKey'..."
            try {
                $Null = Remove-Variable -Name 'ClickUpAPIKey' -Scope Global -Force -ErrorAction Stop
            } catch {
                Write-Error "Failed to remove global variable 'ClickUpAPIKey'. Error: $_"
            }
        }
    }

    end {}
}

<#
.SYNOPSIS
    Retrieves the stored ClickUp API key.

.DESCRIPTION
    The Get-ClickUpAPIKey cmdlet retrieves the SecureString containing the ClickUp API key from the global variable.
    If no key is stored, it throws an error.

.EXAMPLE
    $Key = Get-ClickUpAPIKey

    Retrieves the stored API key and assigns it to the $Key variable.

.INPUTS
    None. This cmdlet does not accept any input.

.OUTPUTS
    System.Security.SecureString. Returns the stored API key as a SecureString.
#>
function Get-ClickUpAPIKey {
    [CmdletBinding()]
    [OutputType([System.Security.SecureString])]
    param ()

    begin {}

    process {
        Write-Verbose 'Retrieving ClickUp API Key...'
        if ($null -eq $ClickUpAPIKey) {
            Write-Error 'No API key exists. Please run Add-ClickUpAPIKey to add one.'
        } else {
            return $ClickUpAPIKey
        }
    }

    end {}
}