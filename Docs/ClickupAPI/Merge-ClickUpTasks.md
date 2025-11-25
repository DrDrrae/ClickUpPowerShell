---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/mergetasks
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Merge-ClickUpTasks
---

# Merge-ClickUpTasks

## SYNOPSIS

Merge ClickUp tasks.

## SYNTAX

### __AllParameterSets

```
Merge-ClickUpTasks [-TaskID] <string> [-SourceTaskIDs] <string[]> [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Merge multiple ClickUp tasks into a single task.
The source tasks will be merged into the target task.

## EXAMPLES

### EXAMPLE 1

Merge-ClickUpTasks -TaskID '9hz' -SourceTaskIDs '3cuh','g4fs'
Merges tasks with IDs "3cuh" and "g4fs" into the task with ID "9hz".

### EXAMPLE 2

Merge-ClickUpTasks -TaskID 'abc123' -SourceTaskIDs 'def456','ghi789','jkl012'
Merges three source tasks into the target task with ID "abc123".

## PARAMETERS

### -SourceTaskIDs

{{ Fill SourceTaskIDs Description }}

```yaml
Type: System.String[]
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

### -TaskID

{{ Fill TaskID Description }}

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

### None. This cmdlet does not return any output.

{{ Fill in the Description }}

## NOTES

See the link for information.


## RELATED LINKS

- [](https://developer.clickup.com/reference/mergetasks)
