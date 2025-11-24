---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: >-
  https://developer.clickup.com/reference/getlists

  https://developer.clickup.com/reference/getfolderlesslists
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpLists
---

# Get-ClickUpLists

## SYNOPSIS

Get all ClickUp lists.

## SYNTAX

### FolderID (Default)

```
Get-ClickUpLists -FolderID <ulong> [-Archived <bool>] [<CommonParameters>]
```

### SpaceID

```
Get-ClickUpLists -SpaceID <ulong> [-Archived <bool>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Get all ClickUp lists.

## EXAMPLES

### EXAMPLE 1

Get-ClickUpLists -FolderID 456
Get ClickUp lists under folder with ID "456".

### EXAMPLE 2

Get-ClickUpLists -FolderID 456 -Archived $true
Get ClickUp lists under folder with ID "456" including archived lists.

### EXAMPLE 3

Get-ClickUpLists -SpaceID 789
Get ClickUp lists under space with ID "789".

### EXAMPLE 4

Get-ClickUpLists -SpaceID 789 -Archived $true
Get ClickUp lists under space with ID "789" including archived lists.

## PARAMETERS

### -Archived

{{ Fill Archived Description }}

```yaml
Type: System.Boolean
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: SpaceID
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: FolderID
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -FolderID

{{ Fill FolderID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: FolderID
  Position: Named
  IsRequired: true
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
- Name: SpaceID
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

### System.Array

{{ Fill in the Description }}

## NOTES

See the link for information.


## RELATED LINKS

- [](https://developer.clickup.com/reference/getlists
https://developer.clickup.com/reference/getfolderlesslists)
- [https://developer.clickup.com/reference/getlists
https://developer.clickup.com/reference/getfolderlesslists]()
