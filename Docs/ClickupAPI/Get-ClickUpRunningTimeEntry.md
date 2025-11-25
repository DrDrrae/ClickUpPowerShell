---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-running-time-entry.html
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpRunningTimeEntry
---

# Get-ClickUpRunningTimeEntry

## SYNOPSIS

Get running ClickUp time entries.

## SYNTAX

### __AllParameterSets

```
Get-ClickUpRunningTimeEntry [-TeamID] <ulong> [[-Assignee] <ulong>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Get running ClickUp time entries.

## EXAMPLES

### EXAMPLE 1

Get-ClickUpRunningTimeEntry -TeamID 512
Get running time entries for ClickUp team with ID "512".

### EXAMPLE 2

Get-ClickUpRunningTimeEntry -TeamID 512 -Assignee 1234
Get running time entries for ClickUp team with ID "512" assigned to assingee with ID "1234"

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
  Position: 1
  IsRequired: false
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

### System.Management.Automation.PSCustomObject

{{ Fill in the Description }}

## NOTES

See the link for information.

## RELATED LINKS

- [](https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-running-time-entry.html)
