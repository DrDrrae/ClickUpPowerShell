---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/getworkspaceplan
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpTeamPlan
---

# Get-ClickUpTeamPlan

## SYNOPSIS

Get all ClickUp team plan.

## SYNTAX

### __AllParameterSets

```
Get-ClickUpTeamPlan [-TeamID] <ulong> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get all ClickUp team plan.

## EXAMPLES

### EXAMPLE 1

Get-ClickUpTeamPlan -TeamID 123
Get all ClickUp team plan for team with ID "123".

## PARAMETERS

### -TeamID

{{ Fill TeamID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
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

- [](https://developer.clickup.com/reference/getworkspaceplan)
