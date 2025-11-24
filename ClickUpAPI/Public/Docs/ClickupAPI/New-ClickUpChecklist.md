---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/createchecklist
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: New-ClickUpChecklist
---

# New-ClickUpChecklist

## SYNOPSIS

Create a new ClickUp checklist.

## SYNTAX

### TaskID (Default)

```
New-ClickUpChecklist -TaskID <string> -Name <string> [<CommonParameters>]
```

### CustomTaskIDs

```
New-ClickUpChecklist -TaskID <string> -Name <string> -CustomTaskIDs <bool> -TeamID <ulong>
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Create a new ClickUp checklist.

## EXAMPLES

### EXAMPLE 1

New-ClickUpChecklist -TaskID 9hz -Name "Checklist"
Create a new checklist on ClickUp task with ID "9hz" with name "Checklist".

### EXAMPLE 2

New-ClickUpChecklist -TaskID CustomID -CustomTaskIDs $true -TeamID 123 -Name "Checklist"
Create a new checklist on ClickUp task with custom ID "CustomID" with name "Checklist".

## PARAMETERS

### -CustomTaskIDs

{{ Fill CustomTaskIDs Description }}

```yaml
Type: System.Boolean
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: CustomTaskIDs
  Position: Named
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
- Name: CustomTaskIDs
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: TaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -TaskID

{{ Fill TaskID Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: CustomTaskIDs
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: TaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -TeamID

{{ Fill TeamID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: CustomTaskIDs
  Position: Named
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

- [](https://developer.clickup.com/reference/createchecklist)
