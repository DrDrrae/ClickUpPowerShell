function Get-ClickUpUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [uint64]$TeamID,
        [Parameter(Mandatory = $true)]
        [uint64]$UserID
    )

    Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/user/$UserID"
}