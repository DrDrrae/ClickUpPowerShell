---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/create-checklist-item.html
schema: 2.0.0
---

# New-ClickUpChecklistItem

## SYNOPSIS
Create a new ClickUp checklist item.

## SYNTAX

```
New-ClickUpChecklistItem [-CheckListID] <String> [-Name] <String> [[-Assignee] <UInt32>] [<CommonParameters>]
```

## DESCRIPTION
Create a new ClickUp checklist item.

## EXAMPLES

### EXAMPLE 1
```
New-ClickUpChecklist -CheckListID b955c4dc -Name "Checklist item"
Create a new checklist item on ClickUp Checklist with ID "b955c4dc" with name "Checklist item".
```

### EXAMPLE 2
```
New-ClickUpChecklist -CheckListID b955c4dc -Name "Checklist item" -Assignee 183
Create a new checklist item on ClickUp Checklist with ID "b955c4dc" with name "Checklist item" and assign it to member with ID "183."
```

## PARAMETERS

### -CheckListID
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
The name of the new ClickUp checklist item.

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

### -Assignee
The ClickUp user ID of the user to assign the checklist item to.

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

[https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/create-checklist-item.html](https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/create-checklist-item.html)

