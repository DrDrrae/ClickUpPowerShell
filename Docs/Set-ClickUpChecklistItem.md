---
external help file: ClickUpAPI-help.xml
Module Name: ClickupAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/edit-checklist-item.html
schema: 2.0.0
---

# Set-ClickUpChecklistItem

## SYNOPSIS
Update a ClickUp checklist item.

## SYNTAX

```
Set-ClickUpChecklistItem [-ChecklistID] <String> [-ChecklistItemId] <String> [[-Name] <String>]
 [[-Assignee] <UInt64>] [[-Resolved] <Boolean>] [[-Parent] <String>] [<CommonParameters>]
```

## DESCRIPTION
Update a ClickUp checklist item.

## EXAMPLES

### EXAMPLE 1
```
Set-ClickUpChecklist -ChecklistID b955c4dc -ChecklistItemId 21e08dc8 -Name "New checklist item name."
Update ClickUp checklist item with ID "21e08dc8" under checklist with ID "b955c4dc" to new name "New checklist item name."
```

### EXAMPLE 2
```
Set-ClickUpChecklist -ChecklistID b955c4dc -ChecklistItemId 21e08dc8 -Name "Update Checklist item." -Assignee 183
Update ClickUp checklist item with ID "21e08dc8" under checklist with ID "b955c4dc" to new name "Update Checklist item." and assign it to member with ID "183."
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

### -ChecklistItemId
The ClickUp checklist item ID.

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

### -Name
The new name of the ClickUp checklist item.

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

### -Assignee
The ClickUp user ID of the user to assign the checklist item to.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Resolved
If the checklist item is resolved or not.

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

### -Parent
Another checklist item that you want to nest the target checklist item underneath.

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

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/edit-checklist-item.html](https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/edit-checklist-item.html)

