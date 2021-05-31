---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/edit-checklist.html
schema: 2.0.0
---

# Set-ClickUpChecklist

## SYNOPSIS
Update a ClickUp checklist.

## SYNTAX

```
Set-ClickUpChecklist [-ChecklistID] <String> [[-Name] <String>] [[-Position] <UInt32>] [<CommonParameters>]
```

## DESCRIPTION
Update a ClickUp checklist.

## EXAMPLES

### EXAMPLE 1
```
Set-ClickUpChecklist -ChecklistID b955c4dc -Name "New checklist name."
Update ClickUp checklist with ID "b955c4dc" to new name "New checklist name."
```

### EXAMPLE 2
```
Set-ClickUpChecklist -ChecklistID b955c4dc -Name "Update Checklist." -Position 3
Update ClickUp checklist with ID "b955c4dc" to new name "Update Checklist." and position 3.
```

## PARAMETERS

### -ChecklistID
The ClickUp checklist ID.

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
The new name of the ClickUp checklist.

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

### -Position
The position of the checklist.

Zero-based index of the order you want the checklist to exist on the task.
If you want the checklist to be in the first position, pass 0.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Management.Automation.PSCustomObject
## NOTES
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/edit-checklist.html](https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/edit-checklist.html)

