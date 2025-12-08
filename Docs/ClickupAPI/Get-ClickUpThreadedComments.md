---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/getthreadedcomments
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpThreadedComments
---

# Get-ClickUpThreadedComments

## SYNOPSIS

Get all threaded comments.

## SYNTAX

### __AllParameterSets

```
Get-ClickUpThreadedComments [-CommentID] <ulong> [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Get all threaded comments.

## EXAMPLES

### EXAMPLE 1

Get-ClickUpThreadedComments -CommentID 123
Get ClickUp threaded comments for comment with ID "123".

## PARAMETERS

### -CommentID

{{ Fill CommentID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases:
- comment_id
- id
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
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

### System.UInt64. You can pipe a comment ID to this cmdlet.

{{ Fill in the Description }}

### System.UInt64

{{ Fill in the Description }}

## OUTPUTS

### System.Object

{{ Fill in the Description }}

### System.Array

{{ Fill in the Description }}

### System.Object
System.Array

{{ Fill in the Description }}

## NOTES

See the link for information.

## RELATED LINKS

- [](https://developer.clickup.com/reference/getthreadedcomments)
