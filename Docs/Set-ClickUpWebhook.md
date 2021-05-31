---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks.html
https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks/update-webhook.html
schema: 2.0.0
---

# Set-ClickUpWebhook

## SYNOPSIS
Create a new ClickUp webhook.

## SYNTAX

```
Set-ClickUpWebhook [-WebhookID] <String> [[-Endpoint] <String>] [[-Events] <String[]>] [[-Status] <String>]
 [[-FilterToSpaceID] <UInt64>] [[-FilterToFolderID] <UInt64>] [[-FilterToListID] <String>]
 [[-FilterToTaskID] <String>] [<CommonParameters>]
```

## DESCRIPTION
Create a new ClickUp webhook.

You may filter the location of resources that get sent to a webhook by passing an optional space_id, folder_id, list_id, or task_id in the body of the request.
Without specifying any events, all event types will be sent to the webhook.
However, you can filter for specific actions by sending an events array.
To subscribe to specific events, pass an array of events that you want to subscribe to, otherwise pass "*" to subscribe to everything.

## EXAMPLES

### EXAMPLE 1
```
Set-ClickUpWebhook -WebhookID 4b67ac88 -Endpoint 'https://www.example.com/webhook'
Updates a ClickUp webhook with ID "4b67ac88" that subscribes to all resources and events. Posts information to the URL "https://www.example.com/webhook".
```

### EXAMPLE 2
```
Set-ClickUpWebhook -WebhookID 4b67ac88 -Endpoint 'https://www.example.com/webhook' -Events 'taskCreated','taskUpdated','taskDeleted' -FilterToTaskID 9hx
Updates a ClickUp webhook with ID "4b67ac88" that subscribes to task with ID "9hx" task creation, update, and deletion events. Posts information to the URL "https://www.example.com/webhook".
```

## PARAMETERS

### -WebhookID
ClickUp webhook ID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Endpoint
URL to send the webhook to.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Events
Array of events to subscribe to.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
Set to "active" to re-activate the webhook.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterToSpaceID
Filter subscribed events to one or more ClickUp spaces.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterToFolderID
Filter subscribed events to one or more ClickUp folders.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterToListID
Filter subscribed events to one or more ClickUp lists.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterToTaskID
Filter subscribed events to one or more ClickUp tasks.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Management.Automation.PSCustomObject
## NOTES
See the link for information.

Only webhooks that were created by the authenticated user will be returned on this endpoint.

You may filter the location of resources that get sent to a webhook by passing an optional space_id, folder_id, list_id, or task_id in the body of the request.
Without specifying any events, all event types will be sent to the webhook.
However, you can filter for specific actions by sending an events array.
To subscribe to specific events, pass an array of events that you want to subscribe to, otherwise pass "*" to subscribe to everything.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks.html
https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks/update-webhook.html](https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks.html
https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks/update-webhook.html)

