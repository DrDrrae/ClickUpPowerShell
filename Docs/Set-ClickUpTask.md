---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/update-task.html
schema: 2.0.0
---

# Set-ClickUpTask

## SYNOPSIS
Update a ClickUp task.

## SYNTAX

### TaskID (Default)
```
Set-ClickUpTask -TaskID <String> -Body <Hashtable> [<CommonParameters>]
```

### CustomTaskIDs
```
Set-ClickUpTask -TaskID <String> -Body <Hashtable> -CustomTaskIDs <Boolean> -TeamID <UInt32>
 [<CommonParameters>]
```

## DESCRIPTION
Update a ClickUp task.

## EXAMPLES

### EXAMPLE 1
```
$Body = @{
>> name = "Updated Task Name"
>> description = "Updated Task Content"
>> status = "in progress"
>> }
PS C:\> Set-ClickUpTask -TaskID 9hx -Body $Body
Updated the task with ID "9hx".
```

### EXAMPLE 2
```
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
```

## PARAMETERS

### -TaskID
{{ Fill TaskID Description }}

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
{{ Fill Body Description }}

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
{{ Fill CustomTaskIDs Description }}

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
{{ Fill TeamID Description }}

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

[https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/update-task.html](https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/update-task.html)

