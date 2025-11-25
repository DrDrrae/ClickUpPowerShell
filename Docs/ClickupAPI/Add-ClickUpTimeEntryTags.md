---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/add-tags-from-time-entries.html
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Add-ClickUpTimeEntryTags
---

# Add-ClickUpTimeEntryTags

## SYNOPSIS

Add tags to a ClickUp time entry.

## SYNTAX

### __AllParameterSets

```
Add-ClickUpTimeEntryTags [-TeamID] <string> [-TimeEntryIDs] <ulong[]> [-Tags] <string[]>
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Add tags to a ClickUp time entry.

## EXAMPLES

### EXAMPLE 1

Add-ClickUpTimeEntryTags -TeamID 1111111 -TimeEntryIDs 2222222222222222222 -Tags "name of tag"
Add the tag with name "name of tag" to ClickUp time entry with ID "2222222222222222222".

### EXAMPLE 2

Add-ClickUpTimeEntryTags -TeamID 1111111 -TimeEntryIDs 2222222222222222222,3333333333333333333 -Tags "name of tag","second tag name"
Add the tag with name "name of tag" and "second tag name" to ClickUp time entries with IDs "2222222222222222222" and "3333333333333333333".

## PARAMETERS

### -Tags

{{ Fill Tags Description }}

```yaml
Type: System.String[]
DefaultValue: ''
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

### -TeamID

{{ Fill TeamID Description }}

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

### -TimeEntryIDs

{{ Fill TimeEntryIDs Description }}

```yaml
Type: System.UInt64[]
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. This cmdlet does not accept any input.

{{ Fill in the Description }}

## OUTPUTS

### System.Management.Automation.PSCustomObject

{{ Fill in the Description }}

## NOTES

See the link for information.

## RELATED LINKS

- [](https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/add-tags-from-time-entries.html)
