function Get-ClickUpUser {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true)]
        [UInt32]$TeamID,
        [Parameter(Mandatory = $true)]
        [UInt32]$UserID
    )

    Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/user/$UserID"
}