---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/getviewtasks
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpViewTasks
---

# Get-ClickUpViewTasks

## SYNOPSIS

Get ClickUp view tasks.

## SYNTAX

### __AllParameterSets

```
Get-ClickUpViewTasks [-ViewID] <string> [[-Page] <ulong>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Get ClickUp view tasks.

## EXAMPLES

### EXAMPLE 1

Get-ClickUpViewTasks -ViewID 3c
Get a ClickUp view tasks with ID "3c".

### EXAMPLE 2

Get-ClickUpViewTasks -ViewID 3c -Page 2
Get ClickUp view tasks with ID "3c" staring on page "2".

## PARAMETERS

### -Page

{{ Fill Page Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ViewID

{{ Fill ViewID Description }}

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

## NOTES

See the link for information.

## RELATED LINKS

- [](https://developer.clickup.com/reference/getviewtasks)
