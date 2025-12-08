---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/addguesttofolder
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: Add-ClickUpGuestToFolder
---

# Add-ClickUpGuestToFolder

## SYNOPSIS

Add ClickUp guest to folder.

## SYNTAX

### TaskID (Default)

```
Add-ClickUpGuestToFolder [-FolderID] <uint64> [-GuestID] <uint64> [[-PermissionLevel] <string>]
 [<CommonParameters>]
```

### __AllParameterSets

```
Add-ClickUpGuestToFolder [-FolderID] <ulong> [-GuestID] <ulong> [[-PermissionLevel] <string>]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Add ClickUp guest to folder.

## EXAMPLES

### EXAMPLE 1

Add-ClickUpGuestToFolder -FolderID 1057 -GuestID 403
Add ClickUp guest user with ID "403" to folder with ID "1057" with permission level "read".

### EXAMPLE 2

Add-ClickUpGuestToList -FolderID 1057 -GuestID 403 -PermissionLevel edit
Add ClickUp guest user with ID "403" to folder with ID "1057" with permission level "edit".

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
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -GuestID

{{ Fill GuestID Description }}

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

### -PermissionLevel

{{ Fill PermissionLevel Description }}

```yaml
Type: System.String
DefaultValue: read
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. This cmdlet does not accept any input.

{{ Fill in the Description }}

### System.UInt64. FolderID via pipeline by property name.

{{ Fill in the Description }}

### System.UInt64

{{ Fill in the Description }}

## OUTPUTS

### System.Object.

{{ Fill in the Description }}

### System.Object

{{ Fill in the Description }}

## NOTES

See the link for information.

## RELATED LINKS

- [](https://developer.clickup.com/reference/addguesttofolder)
