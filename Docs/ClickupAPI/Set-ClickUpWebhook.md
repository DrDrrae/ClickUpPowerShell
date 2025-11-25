---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/updatewebhook
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Set-ClickUpWebhook
---

# Set-ClickUpWebhook

## SYNOPSIS

Update a ClickUp webhook.

## SYNTAX

### __AllParameterSets

```
Set-ClickUpWebhook [-WebhookID] <string> [[-Endpoint] <string>] [[-Events] <string[]>]
 [[-Status] <string>] [[-FilterToSpaceID] <ulong>] [[-FilterToFolderID] <ulong>]
 [[-FilterToListID] <string>] [[-FilterToTaskID] <string>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Update a webhook to change the events to be monitored.

## EXAMPLES

### EXAMPLE 1

Set-ClickUpWebhook -WebhookID 4b67ac88 -Endpoint 'https://www.example.com/webhook'
Updates a ClickUp webhook with ID "4b67ac88" that subscribes to all resources and events. Posts information to the URL "https://www.example.com/webhook".

### EXAMPLE 2

Set-ClickUpWebhook -WebhookID 4b67ac88 -Endpoint 'https://www.example.com/webhook' -Events 'taskCreated','taskUpdated','taskDeleted' -FilterToTaskID 9hx
Updates a ClickUp webhook with ID "4b67ac88" that subscribes to task with ID "9hx" task creation, update, and deletion events. Posts information to the URL "https://www.example.com/webhook".

## PARAMETERS

### -Endpoint

{{ Fill Endpoint Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Events

{{ Fill Events Description }}

```yaml
Type: System.String[]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -FilterToFolderID

{{ Fill FilterToFolderID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 5
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -FilterToListID

{{ Fill FilterToListID Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 6
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -FilterToSpaceID

{{ Fill FilterToSpaceID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 4
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -FilterToTaskID

{{ Fill FilterToTaskID Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 7
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Status

{{ Fill Status Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 3
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -WebhookID

{{ Fill WebhookID Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. This cmdlet does not accept any input.

{{ Fill in the Description }}

## OUTPUTS

### System.Object Hashtable.

{{ Fill in the Description }}

### System.Object

{{ Fill in the Description }}

## NOTES

See the link for information.

Only webhooks that were created by the authenticated user will be returned on this endpoint.

You may filter the location of resources that get sent to a webhook by passing an optional space_id, folder_id, list_id, or task_id in the body of the request.
Without specifying any events, all event types will be sent to the webhook.
However, you can filter for specific actions by sending an events array.
To subscribe to specific events, pass an array of events that you want to subscribe to, otherwise pass "*" to subscribe to everything.

## RELATED LINKS

- [](https://developer.clickup.com/reference/updatewebhook)
