---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/task-templates/get-task-templates.html
schema: 2.0.0
---

# Get-ClickUpTaskTemplates

## SYNOPSIS
Get all ClickUp task templates.

## SYNTAX

```
Get-ClickUpTaskTemplates [-TeamID] <UInt32> [[-Page] <UInt32>] [<CommonParameters>]
```

## DESCRIPTION
Get all ClickUp task templates.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpTaskTemplates -TeamID 512
Get all ClickUp team goals for team with ID "123".
```

### EXAMPLE 2
```
Get-ClickUpTaskTemplates -TeamID 512 -Page 1
Get all ClickUp team goals for team with ID "123" starting on page 2.
```

## PARAMETERS

### -TeamID
{{ Fill TeamID Description }}

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

### -Page
{{ Fill Page Description }}

```yaml
Type: UInt32
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

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/task-templates/get-task-templates.html](https://jsapi.apiary.io/apis/clickup20/reference/0/task-templates/get-task-templates.html)

