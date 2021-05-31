---
external help file: ClickUpAPI-help.xml
https: //jsapi.apiary.io/apis/clickup20/reference/0/webhooks/create-webhook.html
Module Name: ClickupAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks.html
schema: 2.0.0
---

# New-ClickUpWebhook

## SYNOPSIS
Create a new ClickUp webhook.

## SYNTAX

```
New-ClickUpWebhook [-Endpoint] <String> [[-Events] <String[]>] [[-FilterToSpaceID] <UInt32>]
 [[-FilterToFolderID] <UInt32>] [[-FilterToListID] <String>] [[-FilterToTaskID] <String>] [<CommonParameters>]
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
New-ClickUpWebhook -Endpoint 'https://www.example.com/webhook'
Create a new ClickUp webhook that subscribes to all resources and events. Posts information to the URL "https://www.example.com/webhook".
```

### EXAMPLE 2
```
New-ClickUpWebhook -Endpoint 'https://www.example.com/webhook' -Events 'taskCreated','taskUpdated','taskDeleted' -FilterToTaskID 9hx
Create a new ClickUp webhook that subscribes to task with ID "9hx" task creation, update, and deletion events. Posts information to the URL "https://www.example.com/webhook".
```

## PARAMETERS

### -Endpoint
{{ Fill Endpoint Description }}

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

### -Events
{{ Fill Events Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterToSpaceID
{{ Fill FilterToSpaceID Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterToFolderID
{{ Fill FilterToFolderID Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterToListID
{{ Fill FilterToListID Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FilterToTaskID
{{ Fill FilterToTaskID Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
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
https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks/create-webhook.html](https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks.html
https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks/create-webhook.html)

