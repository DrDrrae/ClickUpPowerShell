---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/getaccessiblecustomfields
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpCustomFields
---

# Get-ClickUpCustomFields

## SYNOPSIS

Get ClickUp custom fields.

## SYNTAX

### ListID

```
Get-ClickUpCustomFields -ListID <ulong> [<CommonParameters>]
```

### FolderID

```
Get-ClickUpCustomFields -FolderID <ulong> [<CommonParameters>]
```

### SpaceID

```
Get-ClickUpCustomFields -SpaceID <ulong> [<CommonParameters>]
```

### WorkspaceID

```
Get-ClickUpCustomFields -WorkspaceID <ulong> [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Get ClickUp custom fields.

## EXAMPLES

### EXAMPLE 1

Get-ClickUpCustomFields -ListID 123
Get all ClickUp custom fields for list with ID "123".

### EXAMPLE 2

Get-ClickUpCustomFields -FolderID 456
Get all ClickUp custom fields for folder with ID "456".

## PARAMETERS

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

### -ListID

{{ Fill ListID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: ListID
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

### -WorkspaceID

{{ Fill WorkspaceID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: WorkspaceID
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

- [](https://developer.clickup.com/reference/getaccessiblecustomfields)
