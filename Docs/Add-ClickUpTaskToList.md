---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/lists/add-task-to-list.html
schema: 2.0.0
---

# Add-ClickUpTaskToList

## SYNOPSIS
Add a ClickUp task to a list.

## SYNTAX

```
Add-ClickUpTaskToList [-ListID] <UInt32> [-TaskID] <String> [<CommonParameters>]
```

## DESCRIPTION
Add a ClickUp task to a list.

## EXAMPLES

### EXAMPLE 1
```
Add-ClickUpTaskToList -ListID 123 -TaskID 9hz
Add ClickUp task with ID "9hz" to list with ID "123".
```

## PARAMETERS

### -ListID
{{ Fill ListID Description }}

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

### -TaskID
{{ Fill TaskID Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/lists/add-task-to-list.html](https://jsapi.apiary.io/apis/clickup20/reference/0/lists/add-task-to-list.html)

