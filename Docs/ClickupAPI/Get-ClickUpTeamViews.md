---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/getview
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpTeamViews
---

# Get-ClickUpTeamViews

## SYNOPSIS

Get ClickUp team views.

## SYNTAX

### __AllParameterSets

```
Get-ClickUpTeamViews [-TeamID] <ulong> [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

View the task and page views available at the Everything Level of a Workspace.

## EXAMPLES

### EXAMPLE 1

Get-ClickUpTeamViews -TeamID 512
Get ClickUp team views with team ID "512".

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

### System.Array

{{ Fill in the Description }}

### System.Object
System.Array

{{ Fill in the Description }}

## NOTES

See the link for information.

## RELATED LINKS

- [](https://developer.clickup.com/reference/getview)
