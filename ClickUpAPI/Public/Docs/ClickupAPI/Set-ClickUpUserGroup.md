---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/updategroup
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Set-ClickUpUserGroup
---

# Set-ClickUpUserGroup

## SYNOPSIS

Update a user group.

## SYNTAX

### __AllParameterSets

```
Set-ClickUpUserGroup [-GroupID] <string> [[-Name] <string>] [[-Handle] <string>]
 [[-AddMembers] <ulong[]>] [[-RemoveMembers] <ulong[]>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Update a user group in a Workspace.

## EXAMPLES

### EXAMPLE 1

Set-ClickUpUserGroup -GroupID "123-456" -Name "Updated Group" -Handle "updated-handle"
Update user group with ID "123-456" to have name "Updated Group" and handle "updated-handle".

## PARAMETERS

### -AddMembers

{{ Fill AddMembers Description }}

```yaml
Type: System.UInt64[]
DefaultValue: '@()'
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

### -GroupID

{{ Fill GroupID Description }}

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

### -Handle

{{ Fill Handle Description }}

```yaml
Type: System.String
DefaultValue: ''
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

### -Name

{{ Fill Name Description }}

```yaml
Type: System.String
DefaultValue: ''
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

### -RemoveMembers

{{ Fill RemoveMembers Description }}

```yaml
Type: System.UInt64[]
DefaultValue: '@()'
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 4
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

### System.Object

{{ Fill in the Description }}

## NOTES

See the link for information.


## RELATED LINKS

- [](https://developer.clickup.com/reference/updategroup)
