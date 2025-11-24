---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/addguesttolist
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Add-ClickUpGuestToList
---

# Add-ClickUpGuestToList

## SYNOPSIS

Add ClickUp guest to list.

## SYNTAX

### __AllParameterSets

```
Add-ClickUpGuestToList [-ListID] <ulong> [-GuestID] <ulong> [[-PermissionLevel] <string>]
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Add ClickUp guest to list.

## EXAMPLES

### EXAMPLE 1

Add-ClickUpGuestToList -ListID 1427 -GuestID 403
Add ClickUp guest user with ID "403" to list with ID "1427" with permission level "read".

### EXAMPLE 2

Add-ClickUpGuestToList -ListID 1427 -GuestID 403 -PermissionLevel edit
Add ClickUp guest user with ID "403" to list with ID "1427" with permission level "edit".

## PARAMETERS

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

## OUTPUTS

### System.Object.

{{ Fill in the Description }}

### System.Object

{{ Fill in the Description }}

## NOTES

See the link for information.


## RELATED LINKS

- [](https://developer.clickup.com/reference/addguesttolist)
