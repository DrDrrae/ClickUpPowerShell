---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/inviteusertoworkspace
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: New-ClickUpUser
---

# New-ClickUpUser

## SYNOPSIS

Invite user to ClickUp workspace.

## SYNTAX

### __AllParameterSets

```
New-ClickUpUser [-TeamID] <ulong> [-Email] <string> [-Admin] <bool> [[-CustomRoleID] <ulong>]
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Invite someone to join your Workspace as a member.
To invite someone as a guest, use the Invite Guest endpoint.

## EXAMPLES

### EXAMPLE 1

New-ClickUpUser -TeamID 123 -Email "user@example.com" -Admin $false
Invite user to ClickUp workspace with ID "123".

### EXAMPLE 2

New-ClickUpUser -TeamID 123 -Email "user@example.com" -Admin $true -CustomRoleID 456
Invite user to ClickUp workspace with ID "123".

## PARAMETERS

### -Admin

{{ Fill Admin Description }}

```yaml
Type: System.Boolean
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -CustomRoleID

{{ Fill CustomRoleID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 3
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Email

{{ Fill Email Description }}

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

## NOTES

This endpoint is only available to Workspaces on our Enterprise Plan.

See the link for information.

## RELATED LINKS

- [](https://developer.clickup.com/reference/inviteusertoworkspace)
