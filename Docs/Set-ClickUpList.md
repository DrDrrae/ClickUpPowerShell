---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/lists/update-list.html
schema: 2.0.0
---

# Set-ClickUpList

## SYNOPSIS
Update a ClickUp list.

## SYNTAX

```
Set-ClickUpList [-ListID] <String> [[-Name] <String>] [[-Content] <String>] [[-DueDate] <DateTime>]
 [[-DueDateTime] <Boolean>] [[-Priorty] <UInt16>] [[-Assignee] <UInt32>] [[-UnsetStatus] <Boolean>]
 [<CommonParameters>]
```

## DESCRIPTION
Update a ClickUp list.

## EXAMPLES

### EXAMPLE 1
```
Set-ClickUpList -ListID 124 -Name "New ClickUp List Name"
Update a ClickUp list with ID "124" with new name "New ClickUp List Name".
```

### EXAMPLE 2
```
Set-ClickUpList -ListID 124 -Name "New ClickUp List Name" -DueDate "12/31/2021" -Prority 2
Update a ClickUp list with ID "124" with new name "New ClickUp List Name" with a due date and priority.
```

## PARAMETERS

### -ListID
{{ Fill ListID Description }}

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

### -Name
{{ Fill Name Description }}

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

### -Content
{{ Fill Content Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDate
{{ Fill DueDate Description }}

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDateTime
{{ Fill DueDateTime Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Priorty
{{ Fill Priorty Description }}

```yaml
Type: UInt16
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Assignee
{{ Fill Assignee Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -UnsetStatus
{{ Fill UnsetStatus Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: False
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/lists/update-list.html](https://jsapi.apiary.io/apis/clickup20/reference/0/lists/update-list.html)

