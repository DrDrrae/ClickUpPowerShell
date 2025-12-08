<#
.SYNOPSIS
    Get all ClickUp webhooks.
.DESCRIPTION
    View the webhooks created via the API for a Workspace. This endpoint returns webhooks created by the authenticated user.
.EXAMPLE
    PS C:\> Get-ClickUpWebhooks -TeamID 123
    Get all ClickUp webhooks for team with ID "123".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
    System.Array
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://developer.clickup.com/reference/getwebhooks
#>
function Get-ClickUpWebhooks {
    [CmdletBinding()]
    [OutputType([System.Object], [System.Array])]
    param (
        [Parameter(Mandatory = $true)]
        [uint64]$TeamID
    )

    Write-Verbose 'Entering Get-ClickUpWebhooks'
    try {
        Write-Verbose "Getting webhooks for team ID: $TeamID"
        $Webhooks = Invoke-ClickUpAPIGet -Endpoint "team/$TeamID/webhook"
        Write-Verbose 'Successfully retrieved webhooks'
        return $Webhooks.webhooks
    } catch {
        Write-Error "Error in Get-ClickUpWebhooks: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Create a new ClickUp webhook.
.DESCRIPTION
    Set up a webhook to monitor for events.
.EXAMPLE
    PS C:\> New-ClickUpWebhook -Endpoint 'https://www.example.com/webhook'
    Create a new ClickUp webhook that subscribes to all resources and events. Posts information to the URL "https://www.example.com/webhook".
.EXAMPLE
    PS C:\> New-ClickUpWebhook -Endpoint 'https://www.example.com/webhook' -Events 'taskCreated','taskUpdated','taskDeleted' -FilterToTaskID 9hx
    Create a new ClickUp webhook that subscribes to task with ID "9hx" task creation, update, and deletion events. Posts information to the URL "https://www.example.com/webhook".
.INPUTS
    None. This cmdlet does not accept any input.
.OUTPUTS
    System.Object
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.

    We do not have a dedicated IP address for webhooks. We use our domain name and dynamic addressing.

    You may filter the location of resources that get sent to a webhook by passing an optional space_id, folder_id, list_id, or task_id in the body of the request. Without specifying any events, all event types will be sent to the webhook. However, you can filter for specific actions by sending an events array. To subscribe to specific events, pass an array of events that you want to subscribe to, otherwise pass "*" to subscribe to everything.
.LINK
    https://developer.clickup.com/reference/createwebhook
#>
function New-ClickUpWebhook {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $true)]
        [uint64]$TeamID,
        [Parameter(Mandatory = $True)]
        [string]$Endpoint,
        [Parameter()]
        [string[]]$Events = '*',
        [Parameter()]
        [uint64]$FilterToSpaceID,
        [Parameter()]
        [uint64]$FilterToFolderID,
        [Parameter()]
        [string]$FilterToListID,
        [Parameter()]
        [string]$FilterToTaskID
    )

    $Body = @{
        endpoint = $Endpoint
        events   = $Events
    }

    if ($PSBoundParameters.ContainsKey('FilterToSpaceID')) {
        $Body.Add('space_id', $FilterToSpaceID)
    }
    if ($PSBoundParameters.ContainsKey('FilterToFolderID')) {
        $Body.Add('folder_id', $FilterToFolderID)
    }
    if ($PSBoundParameters.ContainsKey('FilterToListID')) {
        $Body.Add('list_id', $FilterToListID)
    }
    if ($PSBoundParameters.ContainsKey('FilterToTaskID')) {
        $Body.Add('task_id', $FilterToTaskID)
    }

    Write-Verbose 'Entering New-ClickUpWebhook'
    try {
        Write-Verbose "Creating new webhook for team ID: $TeamID"
        $Webhook = Invoke-ClickUpAPIPost -Endpoint "team/$TeamID/webhook" -Body $Body
        Write-Verbose 'Successfully created webhook'
        return $Webhook
    } catch {
        Write-Error "Error in New-ClickUpWebhook: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Update a ClickUp webhook.
.DESCRIPTION
    Update a webhook to change the events to be monitored. The WebhookID can be provided via pipeline.
.EXAMPLE
    PS C:\> Set-ClickUpWebhook -WebhookID 4b67ac88 -Endpoint 'https://www.example.com/webhook'
    Updates a ClickUp webhook with ID "4b67ac88" that subscribes to all resources and events. Posts information to the URL "https://www.example.com/webhook".
.EXAMPLE
    PS C:\> Set-ClickUpWebhook -WebhookID 4b67ac88 -Endpoint 'https://www.example.com/webhook' -Events 'taskCreated','taskUpdated','taskDeleted' -FilterToTaskID 9hx
    Updates a ClickUp webhook with ID "4b67ac88" that subscribes to task with ID "9hx" task creation, update, and deletion events. Posts information to the URL "https://www.example.com/webhook".
.EXAMPLE
    PS C:\> Get-ClickUpWebhooks -TeamID 123 | Set-ClickUpWebhook -Endpoint 'https://www.example.com/webhook'
    Pipe webhook IDs and update them.
.INPUTS
    System.String. You can pipe a webhook ID to this cmdlet.
.OUTPUTS
    System.Object Hashtable.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.

    You may filter the location of resources that get sent to a webhook by passing an optional space_id, folder_id, list_id, or task_id in the body of the request. Without specifying any events, all event types will be sent to the webhook. However, you can filter for specific actions by sending an events array. To subscribe to specific events, pass an array of events that you want to subscribe to, otherwise pass "*" to subscribe to everything.
.LINK
    https://developer.clickup.com/reference/updatewebhook
#>
function Set-ClickUpWebhook {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory = $True, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('webhook_id','id')]
        [string]$WebhookID,
        [Parameter()]
        [string]$Endpoint,
        [Parameter()]
        [string[]]$Events,
        [Parameter()]
        [ValidateSet('active')]
        [string]$Status,
        [Parameter()]
        [uint64]$FilterToSpaceID,
        [Parameter()]
        [uint64]$FilterToFolderID,
        [Parameter()]
        [string]$FilterToListID,
        [Parameter()]
        [string]$FilterToTaskID
    )

    $Body = @{}

    if ($PSBoundParameters.ContainsKey('Endpoint')) {
        $Body.Add('endpoint', $Endpoint)
    }
    if ($PSBoundParameters.ContainsKey('Events')) {
        $Body.Add('events', $Events)
    }
    if ($PSBoundParameters.ContainsKey('Status')) {
        $Body.Add('status', $Status)
    }
    if ($PSBoundParameters.ContainsKey('FilterToSpaceID')) {
        $Body.Add('space_id', $FilterToSpaceID)
    }
    if ($PSBoundParameters.ContainsKey('FilterToFolderID')) {
        $Body.Add('folder_id', $FilterToFolderID)
    }
    if ($PSBoundParameters.ContainsKey('FilterToListID')) {
        $Body.Add('list_id', $FilterToListID)
    }
    if ($PSBoundParameters.ContainsKey('FilterToTaskID')) {
        $Body.Add('task_id', $FilterToTaskID)
    }

    Write-Verbose 'Entering Set-ClickUpWebhook'
    try {
        Write-Verbose "Updating webhook with ID: $WebhookID"
        $Webhook = Invoke-ClickUpAPIPut -Endpoint "webhook/$WebhookID" -Body $Body
        Write-Verbose 'Successfully updated webhook'
        return $Webhook
    } catch {
        Write-Error "Error in Set-ClickUpWebhook: $($_.Exception.Message)"
        throw $_
    }
}

<#
.SYNOPSIS
    Remove a ClickUp webhook.
.DESCRIPTION
    Remove a ClickUp webhook. The WebhookID can be provided via pipeline.
.EXAMPLE
    PS C:\> Remove-ClickUpWebhook -WebhookID 4b67ac88
    Remove a ClickUp webhook with ID "4b67ac88".
.EXAMPLE
    PS C:\> Get-ClickUpWebhooks -TeamID 123 | Remove-ClickUpWebhook
    Pipe webhook IDs and remove multiple webhooks.
.INPUTS
    System.String. You can pipe a webhook ID to this cmdlet.
.OUTPUTS
    None. This cmdlet does not return any output.
.NOTES
    See the link for information.

    Only webhooks that were created by the authenticated user will be returned on this endpoint.
.LINK
    https://developer.clickup.com/reference/deletewebhook
#>
function Remove-ClickUpWebhook {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias('webhook_id','id')]
        [string]$WebhookID
    )

    Write-Verbose 'Entering Remove-ClickUpWebhook'
    if ($PSCmdlet.ShouldProcess($WebhookID)) {
        try {
            Write-Verbose "Removing webhook with ID: $WebhookID"
            $null = Invoke-ClickUpAPIDelete -Endpoint "webhook/$WebhookID"
            Write-Verbose 'Successfully removed webhook'
        } catch {
            Write-Error "Error in Remove-ClickUpWebhook: $($_.Exception.Message)"
            throw $_
        }
    }
}