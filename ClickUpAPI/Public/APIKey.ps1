function Add-ClickUpAPIKey {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('Api_Key')]
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
            Set-Variable -Name 'ClickUpAPIKey' -Value $SecureAPIKey -Option ReadOnly -Scope Global -Force
        } catch {
            Write-Error "Failed to set global variable 'ClickUpAPIKey'. Error: $_"
        }
    }

    end {
        Remove-Variable -Name ApiKey -ErrorAction SilentlyContinue
    }
}

function Remove-ClickUpAPIKey {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param ()

    begin {}

    process {
        if ($PSCmdlet.ShouldProcess('ClickUpAPIKey', 'Remove Global Variable')) {
            Write-Verbose "Removing global variable 'ClickUpAPIKey'..."
            try {
                Remove-Variable -Name 'ClickUpAPIKey' -Scope Global -Force -ErrorAction Stop
            } catch {
                Write-Error "Failed to remove global variable 'ClickUpAPIKey'. Error: $_"
            }
        }
    }

    end {}
}

function Get-ClickUpAPIKey {
    [CmdletBinding()]
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