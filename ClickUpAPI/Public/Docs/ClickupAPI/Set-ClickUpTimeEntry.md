---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/update-a-time-entry.html
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Set-ClickUpTimeEntry
---

# Set-ClickUpTimeEntry

## SYNOPSIS

Update a ClickUp time entry.

## SYNTAX

### __AllParameterSets

```
Set-ClickUpTimeEntry [-TeamID] <ulong> [-TimerID] <ulong> [[-Description] <string>]
 [[-Tags] <hashtable[]>] [[-TagAction] <string>] [[-StartDate] <string>] [[-EndDate] <string>]
 [-TaskID] <string> [[-Billable] <bool>] [[-Duration] <ulong>] [[-CustomTaskIDs] <bool>]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Update a ClickUp time entry.

## EXAMPLES

### EXAMPLE 1

Set-ClickUpTimeEntry -TeamID 512 -TimerID 2004673344540003570 -Description 'Time entry description.' -Tags 'Time Entry Tag' -TagAction 'replace'
Sets ClickUp Time Entry with timer ID "2004673344540003570" description to "Time entry description." and removes the tag "Time Entry Tag".

### EXAMPLE 2

Set-ClickUpTimeEntry -TeamID 512 -TimerID 2004673344540003570 -Description 'Time entry description.' -Tags 'Time Entry Tag' -TagAction 'add'
Sets ClickUp Time Entry with timer ID "2004673344540003570" description to "Time entry description." and adds the tag "Time Entry Tag".

## PARAMETERS

### -Billable

{{ Fill Billable Description }}

```yaml
Type: System.Boolean
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 8
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -CustomTaskIDs

{{ Fill CustomTaskIDs Description }}

```yaml
Type: System.Boolean
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 10
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Description

{{ Fill Description Description }}

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

### -Duration

{{ Fill Duration Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 9
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -EndDate

{{ Fill EndDate Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 6
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -StartDate

{{ Fill StartDate Description }}

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

### -TagAction

{{ Fill TagAction Description }}

```yaml
Type: System.String
DefaultValue: ''
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

### -Tags

{{ Fill Tags Description }}

```yaml
Type: System.Collections.Hashtable[]
DefaultValue: ''
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

### -TaskID

{{ Fill TaskID Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 7
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

### -TimerID

{{ Fill TimerID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
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

### System.Management.Automation.PSCustomObject

{{ Fill in the Description }}

## NOTES

See the link for information.


## RELATED LINKS

- [](https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/update-a-time-entry.html)
