---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/comments/create-task-comment.html
schema: 2.0.0
---

# New-ClickUpTaskComment

## SYNOPSIS
Create ClickUp task comment.

## SYNTAX

### TaskID (Default)
```
New-ClickUpTaskComment -TaskID <String> -Body <Hashtable> [<CommonParameters>]
```

### CustomTaskIDs
```
New-ClickUpTaskComment -TaskID <String> -Body <Hashtable> -CustomTaskIDs <Boolean> -TeamID <UInt32>
 [<CommonParameters>]
```

## DESCRIPTION
Create ClickUp task comment.

## EXAMPLES

### EXAMPLE 1
```
$Body = @{
>> comment_text = "Task comment content"
>> assignee = 183
>> notify_all = $true
>> }
PS C:\> New-ClickUpTaskComment -TaskID 9hz -Body $Body
Create new ClickUp task comment on task with ID "9hz".
```

### EXAMPLE 2
```
$Body = @{
>> comment_text = "Task comment content"
>> assignee = 183
>> notify_all = $true
>> }
PS C:\> New-ClickUpTaskComment -TaskID 'CustomTaskID' -Body $Body -CustomTaskIDs $true -TeamID 1111111
Create new ClickUp task comment on task with custom id "CustomTaskID".
```

### EXAMPLE 3
```
$Body = @{
>> comment = @(
>> @{
>> text = "bold text",
>> attributes = @{
>>     bold = $true
>>     }
>> },
>> @{
>> text = "italic text",
>>  attributes = @{
>>     italic = $true
>>     }
>> }
>> )
>> assignee = 183
>> notify_all = $true
>> }
PS C:\> New-ClickUpTaskComment -TaskID 9hz -Body $Body
Create new ClickUp task comment with formatting on task with ID "9hz".
```

## PARAMETERS

### -TaskID
The ClickUp task ID.
Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
A hashtable containing the contents and parameters of the ClickUp comment to be created on a task.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomTaskIDs
Set to $true if the task ID provided is a custom ID.

```yaml
Type: Boolean
Parameter Sets: CustomTaskIDs
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -TeamID
Required ClickUp team ID if -CustomTaskIDs is set to $true.

```yaml
Type: UInt32
Parameter Sets: CustomTaskIDs
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Management.Automation.PSCustomObject
## NOTES
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/comments/create-task-comment.html](https://jsapi.apiary.io/apis/clickup20/reference/0/comments/create-task-comment.html)

