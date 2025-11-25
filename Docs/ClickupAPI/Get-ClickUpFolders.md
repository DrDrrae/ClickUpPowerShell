---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/getfolders
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpFolders
---

# Get-ClickUpFolders

## SYNOPSIS

Get all ClickUp Folders.

## SYNTAX

### __AllParameterSets

```
Get-ClickUpFolders [-SpaceID] <ulong> [[-Archived] <bool>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Get all ClickUp Folders.

## EXAMPLES

### EXAMPLE 1

Get-ClickUpFolders -SpaceID 11111111
Get all ClickUp folders under ClickUp Space with ID "11111111".

### EXAMPLE 2

Get-ClickUpFolders -SpaceID 11111111 -Archived $true
Get all ClickUp folders under ClickUp Space with ID "11111111" including archived.

## PARAMETERS

### -Archived

{{ Fill Archived Description }}

```yaml
Type: System.Boolean
DefaultValue: False
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

### -SpaceID

{{ Fill SpaceID Description }}

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

### System.Object Hashtable.

{{ Fill in the Description }}

## NOTES

See the link for information.

## RELATED LINKS

- [](https://developer.clickup.com/reference/getfolders)
