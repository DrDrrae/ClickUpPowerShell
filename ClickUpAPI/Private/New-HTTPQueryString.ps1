function New-HttpQueryString {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $Uri,

        [Parameter(Mandatory = $true)]
        [hashtable]
        $QueryParameter
    )
    # Add System.Web
    Add-Type -AssemblyName System.Web

    # Create a http name value collection from an empty string
    $nvCollection = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)

    foreach ($key in $QueryParameter.Keys) {
        if ($QueryParameter.$key -is [array]) {
            foreach ($QP in $QueryParameter.$key) {
                $nvCollection.Add($key, $QP)
            }
        } else {
            $nvCollection.Add($key, $QueryParameter.$key)
        }
    }

    # Build the uri
    $uriRequest = [System.UriBuilder]$Uri
    $uriRequest.Query = $nvCollection.ToString()

    Write-Verbose -Message $uriRequest.Uri.OriginalString

    return $uriRequest.Uri.OriginalString
}