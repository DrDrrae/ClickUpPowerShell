---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-space-views.html
schema: 2.0.0
---

# Get-ClickUpSpaceViews

## SYNOPSIS
Get ClickUp space views.

## SYNTAX

```
Get-ClickUpSpaceViews [-SpaceID] <UInt32> [<CommonParameters>]
```

## DESCRIPTION
Get ClickUp space views.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpSpaceViews -SpaceID 790
Get ClickUp space views with space ID "790".
```

## PARAMETERS

### -SpaceID
{{ Fill SpaceID Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-space-views.html](https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-space-views.html)

