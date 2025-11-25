---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/editchecklistitem
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Set-ClickUpChecklistItem
---

# Set-ClickUpChecklistItem

## SYNOPSIS

Update a ClickUp checklist item.

## SYNTAX

### __AllParameterSets

```
Set-ClickUpChecklistItem [-ChecklistID] <string> [-ChecklistItemId] <string> [[-Name] <string>]
 [[-Assignee] <ulong>] [[-Resolved] <bool>] [[-Parent] <string>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Update a ClickUp checklist item.

## EXAMPLES

### EXAMPLE 1

Set-ClickUpChecklist -ChecklistID b955c4dc -ChecklistItemId 21e08dc8 -Name "New checklist item name."
Update ClickUp checklist item with ID "21e08dc8" under checklist with ID "b955c4dc" to new name "New checklist item name."

### EXAMPLE 2

Set-ClickUpChecklist -ChecklistID b955c4dc -ChecklistItemId 21e08dc8 -Name "Update Checklist item." -Assignee 183
Update ClickUp checklist item with ID "21e08dc8" under checklist with ID "b955c4dc" to new name "Update Checklist item." and assign it to member with ID "183."

## PARAMETERS

### -Assignee

{{ Fill Assignee Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 3
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ChecklistID

{{ Fill ChecklistID Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ChecklistItemId

{{ Fill ChecklistItemId Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Name

{{ Fill Name Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Parent

{{ Fill Parent Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 5
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Resolved

{{ Fill Resolved Description }}

```yaml
Type: System.Boolean
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 4
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. This cmdlet does not accept any input.

{{ Fill in the Description }}

## OUTPUTS

### System.Object

{{ Fill in the Description }}

## NOTES

See the link for information.

## RELATED LINKS

- [](https://developer.clickup.com/reference/editchecklistitem)
