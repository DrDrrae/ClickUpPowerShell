---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/createchatviewcomment
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: New-ClickUpChatViewComment
---

# New-ClickUpChatViewComment

## SYNOPSIS

Create ClickUp chat view comment.

## SYNTAX

### __AllParameterSets

```
New-ClickUpChatViewComment [-ViewID] <string> [-Body] <hashtable> [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Create ClickUp chat view comment.

## EXAMPLES

### EXAMPLE 1

$Body = @{
>>     comment_text = "Chat view comment content"
>>     assignee = 183
>>     notify_all = $true
>> }
PS C:\> New-ClickUpChatViewComment -TaskID 3c -Body $Body
Create new ClickUp chat view comment on chat view with ID "3c".

### EXAMPLE 2

$Body = @{
>>     comment_text = "Chat view comment content"
>>     assignee = 183
>>     notify_all = $true
>> }
PS C:\> New-ClickUpChatViewComment -ViewID 3c -Body $Body
Create new ClickUp chat view comment on chat view with ID "3c".

## PARAMETERS

### -Body

{{ Fill Body Description }}

```yaml
Type: System.Collections.Hashtable
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

### -ViewID

{{ Fill ViewID Description }}

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

- [](https://developer.clickup.com/reference/createchatviewcomment)
