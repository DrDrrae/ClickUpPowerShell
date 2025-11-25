---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/createchecklistitem
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: New-ClickUpChecklistItem
---

# New-ClickUpChecklistItem

## SYNOPSIS

Create a new ClickUp checklist item.

## SYNTAX

### __AllParameterSets

```
New-ClickUpChecklistItem [-CheckListID] <string> [-Name] <string> [[-Assignee] <ulong>]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Create a new ClickUp checklist item.

## EXAMPLES

### EXAMPLE 1

New-ClickUpChecklist -CheckListID b955c4dc -Name "Checklist item"
Create a new checklist item on ClickUp Checklist with ID "b955c4dc" with name "Checklist item".

### EXAMPLE 2

New-ClickUpChecklist -CheckListID b955c4dc -Name "Checklist item" -Assignee 183
Create a new checklist item on ClickUp Checklist with ID "b955c4dc" with name "Checklist item" and assign it to member with ID "183."

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
  Position: 2
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -CheckListID

{{ Fill CheckListID Description }}

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

### -Name

{{ Fill Name Description }}

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

- [](https://developer.clickup.com/reference/createchecklistitem)
