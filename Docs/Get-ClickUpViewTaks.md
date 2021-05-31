---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-view-tasks.html
schema: 2.0.0
---

# Get-ClickUpViewTaks

## SYNOPSIS
Get ClickUp view tasks.

## SYNTAX

```
Get-ClickUpViewTaks [-ViewID] <String> [[-Page] <UInt64>] [<CommonParameters>]
```

## DESCRIPTION
Get ClickUp view tasks.

This request will always return paged responses.
If you do not include the page parameter, it will return page 0.
Each page includes 30 tasks.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpViewTasks -ViewID 3c
Get a ClickUp view tasks with ID "3c".
```

### EXAMPLE 2
```
Get-ClickUpViewTasks -ViewID 3c -Page 2
Get ClickUp view tasks with ID "3c" staring on page "2".
```

## PARAMETERS

### -ViewID
ClickUp view ID.

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

### -Page
Page number to return.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

This request will always return paged responses.
If you do not include the page parameter, it will return page 0.
Each page includes 30 tasks.

Only webhooks that were created by the authenticated user will be returned on this endpoint.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-view-tasks.html](https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
https://jsapi.apiary.io/apis/clickup20/reference/0/views/get-view-tasks.html)

