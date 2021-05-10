function Invoke-ClickUpAPIRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Default', 'Get', 'Head', 'Post', 'Put', 'Delete', 'Trace', 'Options', 'Merge', 'Patch')]
        [string]$Method,
        [Parameter(Mandatory = $true)]
        [string]$URI,
        [hashtable]$Body
    )
    try {
        $InvokeParams = @{
            Body           = if ($Body) { ConvertTo-Json -InputObject $Body -Depth $ClickUpJSONConversionDepth } else { '' }
            ContentType    = 'application/json'
            Headers     = @{
                Authorization = Get-ClickUpAPIKeyInsecure -APIKey $ClickUpAPIKey
            }
            Method         = $Method
            Uri            = $URI
        }
        $Response = Invoke-RestMethod @InvokeParams
        if ($Response) {
            Return $Response
        }
    } catch {
        $_
    }
}

function Invoke-ClickUpAPIGet {
    [CmdletBinding()]
    param (
        [hashtable]$Arguments = @{},
        [Parameter(Mandatory = $true)]
        [string]$Endpoint
    )
    if ($Arguments.Count) {
        $URI = New-HTTPQueryString -Uri "https://api.clickup.com/api/v2/$Endpoint" -QueryParameter $Arguments
    } else {
        $URI = "https://api.clickup.com/api/v2/$Endpoint"
    }
    $Response = Invoke-ClickUpAPIRequest -Uri $URI -Method 'Get'
    return $Response
}

function Invoke-ClickUpAPIPost {
    [CmdletBinding()]
    param (
        [hashtable]$Arguments = @{},
        [Parameter(Mandatory = $true)]
        [string]$Endpoint,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )
    if ($Arguments.Count) {
        $URI = New-HTTPQueryString -Uri "https://api.clickup.com/api/v2/$Endpoint" -QueryParameter $Arguments
    } else {
        $URI = "https://api.clickup.com/api/v2/$Endpoint"
    }
    $Response = Invoke-ClickUpAPIRequest -Uri $URI -Method 'Post' -Body $Body
    return $Response
}

function Invoke-ClickUpAPIPut {
    [CmdletBinding()]
    param (
        [hashtable]$Arguments = @{},
        [Parameter(Mandatory = $true)]
        [string]$Endpoint,
        [Parameter(Mandatory = $true)]
        [hashtable]$Body
    )
    if ($Arguments.Count) {
        $URI = New-HTTPQueryString -Uri "https://api.clickup.com/api/v2/$Endpoint" -QueryParameter $Arguments
    } else {
        $URI = "https://api.clickup.com/api/v2/$Endpoint"
    }
    $Response = Invoke-ClickUpAPIRequest -Uri $URI -Method 'Put' -Body $Body
    return $Response
}

function Invoke-ClickUpAPIDelete {
    [CmdletBinding()]
    param (
        [hashtable]$Arguments = @{},
        [Parameter(Mandatory = $true)]
        [string]$Endpoint
    )
    if ($Arguments.Count) {
        $URI = New-HTTPQueryString -Uri "https://api.clickup.com/api/v2/$Endpoint" -QueryParameter $Arguments
    } else {
        $URI = "https://api.clickup.com/api/v2/$Endpoint"
    }
    $Response = Invoke-ClickUpAPIRequest -Uri $URI -Method 'Delete' -Body $Body
    return $Response
}