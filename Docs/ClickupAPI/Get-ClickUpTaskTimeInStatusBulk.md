---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/getbulktaskstimeinstatus
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpTaskTimeInStatusBulk
---

# Get-ClickUpTaskTimeInStatusBulk

## SYNOPSIS

Get a ClickUp bulk task's time in status.

## SYNTAX

### TaskID (Default)

```
Get-ClickUpTaskTimeInStatusBulk -TaskID <string[]> [<CommonParameters>]
```

### CustomTaskIDs

```
Get-ClickUpTaskTimeInStatusBulk -TaskID <string[]> -CustomTaskIDs <bool> -TeamID <ulong>
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

View how long two or more tasks have been in each status.
The Total time in Status ClickApp must first be enabled by the Workspace owner or an admin.

## EXAMPLES

### EXAMPLE 1

Get-ClickUpTaskTimeInStatusBulk -TaskID 9hz,3cuh,g4fs
Get a ClickUp task's time in status with ID "9hz".

### EXAMPLE 2

Get-ClickUpTaskTimeInStatusBulk -TaskID "CustomTaskID 1","CustomTaskID 2","CustomTaskID 3" -CustomTaskIDs $true -TeamID 123
Get multiple ClickUp task's time in status with custom IDs "CustomTaskID 1", "CustomTaskID 2", and "CustomTaskID 3".

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

### -TaskID

{{ Fill TaskID Description }}

```yaml
Type: System.String[]
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

### System.Object

{{ Fill in the Description }}

## NOTES

See the link for information.


## RELATED LINKS

- [](https://developer.clickup.com/reference/getbulktaskstimeinstatus)
