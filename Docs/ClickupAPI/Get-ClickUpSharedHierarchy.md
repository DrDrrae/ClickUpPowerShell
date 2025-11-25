---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/sharedhierarchy
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpSharedHierarchy
---

# Get-ClickUpSharedHierarchy

## SYNOPSIS

Get ClickUp shared hierarchy.

## SYNTAX

### __AllParameterSets

```
Get-ClickUpSharedHierarchy [-TeamID] <ulong> [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Get ClickUp shared hierarchy.
Returns all resources you have access to where you don't have access to its parent.
For example, if you have a access to a shared task, but don't have access to its parent list, it will come back in this request.

## EXAMPLES

### EXAMPLE 1

Get-ClickUpSharedHierarchy -TeamID 123
Returns all ClickUp resources you have access to where you don't have access to its parent.

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

## NOTES

See the link for information.

Returns all resources you have access to where you don't have access to its parent.
For example, if you have a access to a shared task, but don't have access to its parent list, it will come back in this request.

## RELATED LINKS

- [](https://developer.clickup.com/reference/sharedhierarchy)
