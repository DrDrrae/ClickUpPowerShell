---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/createtaskcomment
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: New-ClickUpTaskComment
---

# New-ClickUpTaskComment

## SYNOPSIS

Create ClickUp task comment.

## SYNTAX

### TaskID (Default)

```
New-ClickUpTaskComment -TaskID <string> -Body <hashtable> [<CommonParameters>]
```

### CustomTaskIDs

```
New-ClickUpTaskComment -TaskID <string> -Body <hashtable> -CustomTaskIDs <bool> -TeamID <ulong>
 [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

Create ClickUp task comment.

## EXAMPLES

### EXAMPLE 1

$Body = @{
>>     comment_text = "Task comment content"
>>     assignee = 183
>>     notify_all = $true
>> }
PS C:\> New-ClickUpTaskComment -TaskID 9hz -Body $Body
Create new ClickUp task comment on task with ID "9hz".

### EXAMPLE 2

$Body = @{
>>     comment_text = "Task comment content"
>>     assignee = 183
>>     notify_all = $true
>> }
PS C:\> New-ClickUpTaskComment -TaskID 'CustomTaskID' -Body $Body -CustomTaskIDs $true -TeamID 1111111
Create new ClickUp task comment on task with custom id "CustomTaskID".

### EXAMPLE 3

$Body = @{
>>     comment_text = "Task comment content"
>>     assignee = 183
>>     notify_all = $true
>> }
PS C:\> New-ClickUpTaskComment -TaskID 9hz -Body $Body
Create new ClickUp task comment on task with ID "9hz".

## PARAMETERS

### -Body

{{ Fill Body Description }}

```yaml
Type: System.Collections.Hashtable
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

### System.Object

{{ Fill in the Description }}

## NOTES

See the link for information.


## RELATED LINKS

- [](https://developer.clickup.com/reference/createtaskcomment)
