---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/comments/create-chat-view-comment.html
schema: 2.0.0
---

# New-ClickUpChatViewComment

## SYNOPSIS
Create ClickUp chat view comment.

## SYNTAX

```
New-ClickUpChatViewComment [-ViewID] <String> [-Body] <Hashtable> [<CommonParameters>]
```

## DESCRIPTION
Create ClickUp chat view comment.

## EXAMPLES

### EXAMPLE 1
```
$Body = @{
>> comment_text = "Task comment content"
>> assignee = 183
>> notify_all = $true
>> }
PS C:\> New-ClickUpChatViewComment -TaskID 3c -Body $Body
Create new ClickUp chat view comment on chat view with ID "3c".
```

### EXAMPLE 2
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
PS C:\> New-ClickUpChatViewComment -ViewID 3c -Body $Body
Create new ClickUp chat view comment with formatting on chat view with ID "3c".
```

## PARAMETERS

### -ViewID
The ClickUp view ID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
A hashtable containing the contents and parameters of the ClickUp comment to be created on a view.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/comments/create-chat-view-comment.html](https://jsapi.apiary.io/apis/clickup20/reference/0/comments/create-chat-view-comment.html)

