---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks.html
https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks/delete-webhook.html
schema: 2.0.0
---

# Remove-ClickUpWebhook

## SYNOPSIS
Remove a ClickUp webhook.

## SYNTAX

```
Remove-ClickUpWebhook [-WebhookID] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Remove a ClickUp webhook.

## EXAMPLES

### EXAMPLE 1
```
Remove-ClickUpWebhook -WebhookID 4b67ac88
Remove a ClickUp webhook with ID "4b67ac88".
```

## PARAMETERS

### -WebhookID
{{ Fill WebhookID Description }}

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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
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

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks.html
https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks/delete-webhook.html](https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks.html
https://jsapi.apiary.io/apis/clickup20/reference/0/webhooks/delete-webhook.html)

