---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/updatetask
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: Set-ClickUpTask
---

# Set-ClickUpTask

## SYNOPSIS

Update a ClickUp task.

## SYNTAX

### TaskID (Default)

```
Set-ClickUpTask -TaskID <string> -Body <hashtable> [<CommonParameters>]
```

### CustomTaskIDs

```
Set-ClickUpTask -TaskID <string> -Body <hashtable> -CustomTaskIDs <bool> -TeamID <ulong>
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Update a ClickUp task.

## EXAMPLES

### EXAMPLE 1

$Body = @{
>> name = "Updated Task Name"
>> description = "Updated Task Content"
>> status = "in progress"
>> }
PS C:\> Set-ClickUpTask -TaskID 9hx -Body $Body
Updated the task with ID "9hx".

### EXAMPLE 2

$Body = @{
>> name = "Updated Task Name"
>> description = "Updated Task Content"
>> status = "in progress"
>> priority = 1
>> time_estimate = 8640000
>> assignees = @{
>>     "add = @(
>>         182
>>     )
>>     "rem = @(
>>        183
>>     )
>> }
>> "archived = false
>> }
PS C:\> Set-ClickUpTask -TaskID 9hx -Body $Body
Updated the task with ID "9hx".

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
Aliases:
- task_id
- id
ParameterSets:
- Name: CustomTaskIDs
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: TaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
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

### System.String. You can pipe a task ID to this cmdlet.

{{ Fill in the Description }}

### System.String

{{ Fill in the Description }}

## OUTPUTS

### System.Object

{{ Fill in the Description }}

## NOTES

See the link for information on how to format the body.

Body format:
@{
    name = "Updated Task Name"
    description = "Updated Task Content"
    status = "in progress"
    priority = 1
    time_estimate = 8640000
    assignees = @{
        "add = @(
            182
        )
        "rem = @(
            183
        )
    }
    "archived = false
}

## RELATED LINKS

- [](https://developer.clickup.com/reference/updatetask)
