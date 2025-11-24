---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/addguesttotask
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Add-ClickUpGuestToTask
---

# Add-ClickUpGuestToTask

## SYNOPSIS

Add ClickUp guest to task.

## SYNTAX

### TaskID (Default)

```
Add-ClickUpGuestToTask -TaskID <string> -GuestID <ulong> [-PermissionLevel <string>]
 [<CommonParameters>]
```

### CustomTaskIDs

```
Add-ClickUpGuestToTask -TaskID <string> -GuestID <ulong> -CustomTaskIDs <bool> -TeamID <ulong>
 [-PermissionLevel <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Add ClickUp guest to task.

## EXAMPLES

### EXAMPLE 1

Add-ClickUpGuestToTask -TaskID c04 -GuestID 403
Add ClickUp guest user with ID "403" to task with ID "c04" with permission level "read".

### EXAMPLE 2

Add-ClickUpGuestToTask -TaskID c04 -GuestID 403 -PermissionLevel edit
Add ClickUp guest user with ID "403" to task with ID "c04" with permission level "edit".

### EXAMPLE 3

Add-ClickUpGuestToTask -TaskID CustomID -GuestID 403 -CustomTaskIDs $true -TeamID 123 -PermissionLevel edit.
Add ClickUp guest user with  custom ID "CustomID" to task with ID "c04" with permission level "edit".

## PARAMETERS

### -CustomTaskIDs

{{ Fill CustomTaskIDs Description }}

```yaml
Type: System.Boolean
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: CustomTaskIDs
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
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
- Name: CustomTaskIDs
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: TaskID
  Position: Named
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
- Name: CustomTaskIDs
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: TaskID
  Position: Named
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -TaskID

{{ Fill TaskID Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: CustomTaskIDs
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: TaskID
  Position: Named
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
- Name: CustomTaskIDs
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

### System.Object.

{{ Fill in the Description }}

### System.Object

{{ Fill in the Description }}

## NOTES

See the link for information.


## RELATED LINKS

- [](https://developer.clickup.com/reference/addguesttotask)
