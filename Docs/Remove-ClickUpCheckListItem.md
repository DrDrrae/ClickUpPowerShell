---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/delete-checklist-item.html
schema: 2.0.0
---

# Remove-ClickUpCheckListItem

## SYNOPSIS
Delete a ClickUp checklist item.

## SYNTAX

```
Remove-ClickUpCheckListItem [-ChecklistID] <String> [-ChecklistItemId] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Delete a ClickUp checklist item.

## EXAMPLES

### EXAMPLE 1
```
Remove-ClickUpChecklist -ChecklistID b955c4dc -ChecklistItemId 21e08dc8
Remove ClickUp checklist with ID "b955c4dc".
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

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/delete-checklist-item.html](https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/delete-checklist-item.html)

