---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/changetagnamesfromtimeentries
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: Set-ClickUpTimeEntryTags
---

# Set-ClickUpTimeEntryTags

## SYNOPSIS

Update tag names from ClickUp time entries.

## SYNTAX

### __AllParameterSets

```
Set-ClickUpTimeEntryTags [-TeamID] <string> [-OldTagName] <string> [-NewTagName] <string>
 [[-TagBackgroundColor] <string>] [[-TagForegroundColor] <string>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Update tag names from ClickUp time entries.

## EXAMPLES

### EXAMPLE 1

Set-ClickUpTimeEntryTags -TeamID 1111111 -OldTagName "old tag" -NewTagName "new tag"
Rename the tag "old tag" to "new tag" for team with ID "1111111".

### EXAMPLE 2

Set-ClickUpTimeEntryTags -TeamID 1111111 -OldTagName "old tag" -NewTagName "new tag" -TagBackgroundColor "#FF0000" -TagForegroundColor "#FFFFFF"
Rename the tag "old tag" to "new tag" with custom colors for team with ID "1111111".

## PARAMETERS

### -NewTagName

{{ Fill NewTagName Description }}

```yaml
Type: System.String
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

### -OldTagName

{{ Fill OldTagName Description }}

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

### -TagBackgroundColor

{{ Fill TagBackgroundColor Description }}

```yaml
Type: System.String
DefaultValue: ''
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

### -TagForegroundColor

{{ Fill TagForegroundColor Description }}

```yaml
Type: System.String
DefaultValue: ''
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

### -TeamID

{{ Fill TeamID Description }}

```yaml
Type: System.String
DefaultValue: ''
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

### System.String. TeamID via pipeline by property name.

{{ Fill in the Description }}

### System.String

{{ Fill in the Description }}

## OUTPUTS

### None. This cmdlet does not return any output.

{{ Fill in the Description }}

### System.Management.Automation.PSCustomObject

{{ Fill in the Description }}

## NOTES

See the link for information.

## RELATED LINKS

- [](https://developer.clickup.com/reference/changetagnamesfromtimeentries)
