---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/createthreadedcomment
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: New-ClickUpThreadedComment
---

# New-ClickUpThreadedComment

## SYNOPSIS

Create ClickUp threaded comment.

## SYNTAX

### __AllParameterSets

```
New-ClickUpThreadedComment [-CommentID] <ulong> [-Body] <hashtable> [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Create ClickUp threaded comment.

## EXAMPLES

### EXAMPLE 1

$Body = @{
>>     comment_text = "Threaded comment content"
>>     assignee = 183
>>     notify_all = $true
>> }
PS C:\> New-ClickUpThreadedComment -CommentID 124 -Body $Body
Create new ClickUp threaded comment on comment with ID "124".

### EXAMPLE 2

$Body = @{
>>     comment_text = "Threaded comment content"
>>     assignee = 183
>>     notify_all = $true
>> }
PS C:\> New-ClickUpThreadedComment -CommentID 124 -Body $Body
Create new ClickUp threaded comment on comment with ID "124".

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

### -CommentID

{{ Fill CommentID Description }}

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

See the link for information.

## RELATED LINKS

- [](https://developer.clickup.com/reference/createthreadedcomment)
