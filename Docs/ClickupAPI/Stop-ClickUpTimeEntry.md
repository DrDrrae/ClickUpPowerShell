---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/stop-a-time-entry.html
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Stop-ClickUpTimeEntry
---

# Stop-ClickUpTimeEntry

## SYNOPSIS

Stop ClickUp time entries.

## SYNTAX

### __AllParameterSets

```
Stop-ClickUpTimeEntry [-TeamID] <ulong> [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Stop ClickUp time entries.

## EXAMPLES

### EXAMPLE 1

Stop-ClickUpTimeEntry -TeamID 512
Stop ClickUp time entries for Team with ID "512".

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

### System.Management.Automation.PSCustomObject

{{ Fill in the Description }}

## NOTES

See the link for information.

## RELATED LINKS

- [](https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/stop-a-time-entry.html)
