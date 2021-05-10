function Get-ClickUpAPIKeyInsecure {
    [CmdletBinding()]

    Param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias('Api_Key')]
        [securestring]$ApiKey
    )

    Begin {}

    Process {
        $InsecureAPIKey = (New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList 'N/A', $ApiKey).GetNetworkCredential().Password
    }

    End {
        Return $InsecureAPIKey
    }
}

