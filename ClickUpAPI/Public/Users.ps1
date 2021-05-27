function Get-ClickUpUser {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param (
        [Parameter(Mandatory = $true)]
        [int]$TeamID,
        [Parameter(Mandatory = $true)]
        [int]$UserID
    )

    Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/user/$UserID"
}