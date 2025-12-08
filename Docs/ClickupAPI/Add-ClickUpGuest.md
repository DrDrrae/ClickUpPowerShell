---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/inviteguesttoworkspace
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: Add-ClickUpGuest
---

# Add-ClickUpGuest

## SYNOPSIS

Invite ClickUp guest to workspace.

## SYNTAX

### __AllParameterSets

```
Add-ClickUpGuest [-TeamID] <ulong> [-GuestEmail] <string> [[-CanEditTags] <bool>]
 [[-CanSeeTimeSpent] <bool>] [[-CanSeeTimeEstimated] <bool>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Invite ClickUp guest to workspace.

## EXAMPLES

### EXAMPLE 1

Add-ClickUpGuest -TeamID 333 -GuestEmail 'guest@example.com'
Add ClickUp guest user with email "guest@example.com" for team with ID "333".

### EXAMPLE 2

Add-ClickUpGuest -TeamID 333 -GuestEmail 'guest@example.com' -CanEditTags $true -CanSeeTimeSpent $true -CanSeeTimeEstimated $true
Add ClickUp guest user with email "guest@example.com" for team with ID "333" and give them access to edit tags, see time spent, and see time estimated.

## PARAMETERS

### -CanEditTags

{{ Fill CanEditTags Description }}

```yaml
Type: System.Boolean
DefaultValue: False
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

### -CanSeeTimeEstimated

{{ Fill CanSeeTimeEstimated Description }}

```yaml
Type: System.Boolean
DefaultValue: False
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

### -CanSeeTimeSpent

{{ Fill CanSeeTimeSpent Description }}

```yaml
Type: System.Boolean
DefaultValue: False
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

### -GuestEmail

{{ Fill GuestEmail Description }}

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
Aliases:
- team_id
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. This cmdlet does not accept any input.

{{ Fill in the Description }}

### System.UInt64. TeamID via pipeline by property name.

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

- [](https://developer.clickup.com/reference/inviteguesttoworkspace)
