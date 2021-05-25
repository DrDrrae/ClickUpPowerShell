function Get-ClickUpUser {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [int]$TeamID,
        [Parameter(Mandatory = $true)]
        [int]$UserID
    )

    Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/user/$UserID"
}