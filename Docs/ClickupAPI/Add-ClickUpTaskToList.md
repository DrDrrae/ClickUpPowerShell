---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/addtasktolist
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Add-ClickUpTaskToList
---

# Add-ClickUpTaskToList

## SYNOPSIS

Add a ClickUp task to a list.

## SYNTAX

### __AllParameterSets

```
Add-ClickUpTaskToList [-ListID] <ulong> [-TaskID] <string> [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Add a ClickUp task to a list.

## EXAMPLES

### EXAMPLE 1

Add-ClickUpTaskToList -ListID 123 -TaskID 9hz
Add ClickUp task with ID "9hz" to list with ID "123".

## PARAMETERS

### -ListID

{{ Fill ListID Description }}

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

### -TaskID

{{ Fill TaskID Description }}

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

### None. This cmdlet does not return any output.

{{ Fill in the Description }}

## NOTES

See the link for information.
Note: This endpoint requires the Tasks in Multiple List ClickApp to be enabled.

## RELATED LINKS

- [](https://developer.clickup.com/reference/addtasktolist)
- [](https://help.clickup.com/hc/en-us/articles/6309958824727-Tasks-in-Multiple-Lists)
