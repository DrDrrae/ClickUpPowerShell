---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/create-task.html
schema: 2.0.0
---

# New-ClickUpTask

## SYNOPSIS
Create a new ClickUp task.

## SYNTAX

```
New-ClickUpTask [-ListID] <UInt64> [-Name] <String> [[-Description] <String>] [[-Assignees] <Int32[]>]
 [[-Tags] <String[]>] [[-Status] <String>] [[-Priority] <UInt64>] [[-DueDate] <DateTime>]
 [[-DueDateTime] <Boolean>] [[-TimeEstimate] <UInt64>] [[-StartDate] <DateTime>] [[-StartDateTime] <Boolean>]
 [[-NotifyAll] <Boolean>] [[-Parent] <String>] [[-LinksTo] <String>] [[-CheckRequiredCustomFields] <Boolean>]
 [[-CustomFields] <Hashtable[]>] [<CommonParameters>]
```

## DESCRIPTION
Create a new ClickUp task.

## EXAMPLES

### EXAMPLE 1
```
New-ClickUpTask -ListID 11111111 -Name 'This is a new task'
Creates a new ClickUp Task called "This is a new task" under the list with ID "11111111".
```

### EXAMPLE 2
```
New-ClickUpTask -ListID 22222222 -Name 'This is another new task' -Description "Description of the other new task" -Assignees 33333333 -Status 'Review' -Priority 1
Creates a new ClickUp Task called "This is another new task" under the list with ID "22222222" with various other parameters.
```

### EXAMPLE 3
```
$CustomFields = @(
>> @{
>> id = "0a52c486-5f05-403b-b4fd-c512ff05131c"
>> value = 23
>> },
>> @{
>> id = "03efda77-c7a0-42d3-8afd-fd546353c2f5"
>> value = "Text field input"
>> }
>> )
PS C:\> New-ClickUpTask -ListID 11111111 -Name 'This is a new task' -CheckRequiredCustomFields $true -CustomFields $CustomFields
Creates a new ClickUp Task called "This is a new task" under the list with ID "11111111" with two custom fields set.
```

## PARAMETERS

### -ListID
ClickUp list ID.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the new ClickUp task.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Description of the new ClickUp task.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Assignees
ClickUp member IDs of the users to be assigned to the new ClickUp task.

```yaml
Type: Int32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tags
Tags to add to the new ClickUp task.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Status
Status to set to the new ClickUp task.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Priority
Priority to set to the new ClickUp task.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDate
Due date to set to the new ClickUp task.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDateTime
Set to true to include a time for the due date instead of just a date.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -TimeEstimate
The time estimate in minutes.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartDate
Start date to set to the new ClickUp task.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartDateTime
Set to true to include a time for the start date instead of just a date.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -NotifyAll
If set to true, creation notifications will be sent to everyone including the creator of the task.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Parent
ClickUp task ID to set as the parent of the new ClickUp task.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LinksTo
A ClickUp task ID to create a linked dependency on the new task.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CheckRequiredCustomFields
If required custom fields are checked when creating the new ClickUp task.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomFields
A hashtable array containing the custom fields and their properties to set.

```yaml
Type: Hashtable[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/create-task.html](https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/create-task.html)

