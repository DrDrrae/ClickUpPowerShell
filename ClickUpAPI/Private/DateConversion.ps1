function Get-DatePosixMilliseconds {
    [CmdletBinding()]
    param(
        [parameter()]
        [DateTime]$DateTime = (Get-Date)
    )
    $UTCDateTime = Get-Date($DateTime).ToUniversalTime()
    $unixEpochStart = New-Object DateTime 1970, 1, 1, 0, 0, 0, ([DateTimeKind]::Utc)
    [int64](($UTCDateTime) - $unixEpochStart).TotalMilliseconds
}
function ConvertTo-WindowsTime {
    [OutputType([DateTime])]
    Param(
        # Date in UNIX time
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, HelpMessage = 'Milliseconds.')]
        [int64]$ticks
    )
    [DateTime]::new(1970, 1, 1, 0, 0, 0, 0, [System.DateTimeKind]::Utc).AddMilliseconds($ticks).ToLocalTime()
}