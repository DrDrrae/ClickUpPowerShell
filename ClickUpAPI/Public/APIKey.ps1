function Add-ClickUpAPIKey {
    [CmdletBinding()]

    Param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('Api_Key')]
        [string]$APIKey
    )

    Begin {}

    Process {
        $SecureAPIKey = ConvertTo-SecureString $ApiKey -AsPlainText -Force

        Set-Variable -Name 'ClickUpAPIKey' -Value $SecureAPIKey -Option ReadOnly -Scope Global -Force
    }

    End {
        Remove-Variable -Name ApiKey
    }
}

function Remove-ClickUpAPIKey {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param ()
    if ($PSCmdlet.ShouldProcess($ClickUpAPIKey)) {
        Remove-Variable -Name 'ClickUpAPIKey' -Scope Global -Force
    }
}

function Get-ClickUpAPIKey {
    [CmdletBinding()]
    param ()
    if ($null -eq $ClickUpAPIKey) {
        Write-Error 'No API key exists. Please run Add-ClickUpAPIKey to add one.'
    } else {
        $ClickUpAPIKey
    }
}