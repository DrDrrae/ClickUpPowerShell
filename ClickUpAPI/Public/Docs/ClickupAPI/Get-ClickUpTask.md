---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/gettask
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpTask
---

# Get-ClickUpTask

## SYNOPSIS

Get a ClickUp task.

## SYNTAX

### TaskID (Default)

```
Get-ClickUpTask -TaskID <string> [-IncludeSubtasks <Object>] [<CommonParameters>]
```

### CustomTaskIDs

```
Get-ClickUpTask -TaskID <string> -CustomTaskIDs <bool> -TeamID <ulong> [-IncludeSubtasks <Object>]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get a ClickUp task.

## EXAMPLES

### EXAMPLE 1

Get-ClickUpTask -TaskID 9hz
Get a ClickUp task under List with ID "11111111".

### EXAMPLE 2

Get-ClickUpTask -TaskID 9hz -CustomTaskIDs $true -TeamID 123
Get a ClickUp task under List with ID "22222222" and various other options.

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

### -IncludeSubtasks

{{ Fill IncludeSubtasks Description }}

```yaml
Type: System.Object
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: CustomTaskIDs
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: TaskID
  Position: Named
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

- [](https://developer.clickup.com/reference/gettask)
