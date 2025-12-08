---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/getfolder
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpFolder
---

# Get-ClickUpFolder

## SYNOPSIS

Get properties on a particular ClickUp folder.

## SYNTAX

### __AllParameterSets

```
Get-ClickUpFolder [-FolderID] <ulong> [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Get properties on a particular ClickUp folder.

## EXAMPLES

### EXAMPLE 1

Get-ClickUpFolder -FolderID 11111111
Get ClickUp folder with ID "11111111".

## PARAMETERS

### -FolderID

{{ Fill FolderID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases:
- folder_id
- id
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
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

### System.UInt64. You can pipe a folder ID to this cmdlet.

{{ Fill in the Description }}

### System.UInt64

{{ Fill in the Description }}

## OUTPUTS

### System.Object Hashtable.

{{ Fill in the Description }}

### System.Object

{{ Fill in the Description }}

## NOTES

See the link for information.

## RELATED LINKS

- [](https://developer.clickup.com/reference/getfolder)
