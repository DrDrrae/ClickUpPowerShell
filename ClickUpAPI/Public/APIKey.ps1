<#
.SYNOPSIS
    Add a ClickUp API key to the current session.
.DESCRIPTION
    Add a ClickUp API key to the current session.
.PARAMETER APIKey
    The ClickUP API key to store.
.EXAMPLE
    PS C:\> Add-ClickUpAPIKey -APIKey pk_11111111_AAAAAAAAAAAAAAAAAAA1111111111111
    Add the ClickUp API key "pk_11111111_AAAAAAAAAAAAAAAAAAA1111111111111" to the current session.
.INPUTS
    None
.OUTPUTS
    None
#>
function Add-ClickUpAPIKey {
    [CmdletBinding()]
    [OutputType([System.Void])]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, HelpMessage = 'The ClickUP API key to store.')]
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

<#
.SYNOPSIS
    Remove the ClickUP API key from the current session.
.DESCRIPTION
    Remove the ClickUP API key from the current session.
.EXAMPLE
    PS C:\> Remove-ClickUpAPIKey
    Remove the ClickUP API key from the current session.
.INPUTS
    None
.OUTPUTS
    None
#>
function Remove-ClickUpAPIKey {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    [OutputType([System.Void])]
    param ()
    if ($PSCmdlet.ShouldProcess($ClickUpAPIKey)) {
        Remove-Variable -Name 'ClickUpAPIKey' -Scope Global -Force
    }
}

<#
.SYNOPSIS
    Return the secure ClickUp API Key from the current session.
.DESCRIPTION
    Return the secure ClickUp API Key from the current session.
.EXAMPLE
    PS C:\> Get-ClickUpAPIKey
    Return the secure ClickUp API Key from the current session.
.INPUTS
    None
.OUTPUTS
    System.Security.SecureString
#>
function Get-ClickUpAPIKey {
    [CmdletBinding()]
    [OutputType([System.Security.SecureString])]
    param ()
    if ($null -eq $ClickUpAPIKey) {
        Write-Error 'No API key exists. Please run Add-ClickUpAPIKey to add one.'
    } else {
        $ClickUpAPIKey
    }
}