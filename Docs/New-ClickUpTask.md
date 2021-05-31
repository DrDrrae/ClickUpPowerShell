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
New-ClickUpTask [-ListID] <UInt32> [-Name] <String> [[-Description] <String>] [[-Assignees] <Int32[]>]
 [[-Tags] <String[]>] [[-Status] <String>] [[-Priority] <UInt32>] [[-DueDate] <DateTime>]
 [[-DueDateTime] <Boolean>] [[-TimeEstimate] <UInt32>] [[-StartDate] <DateTime>] [[-StartDateTime] <Boolean>]
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

## PARAMETERS

### -ListID
{{ Fill ListID Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
{{ Fill Name Description }}

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
{{ Fill Description Description }}

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
{{ Fill Assignees Description }}

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
{{ Fill Tags Description }}

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
{{ Fill Status Description }}

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
{{ Fill Priority Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDate
{{ Fill DueDate Description }}

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
{{ Fill DueDateTime Description }}

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
{{ Fill TimeEstimate Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartDate
{{ Fill StartDate Description }}

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
{{ Fill StartDateTime Description }}

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
{{ Fill NotifyAll Description }}

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
{{ Fill Parent Description }}

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
{{ Fill LinksTo Description }}

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
{{ Fill CheckRequiredCustomFields Description }}

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
{{ Fill CustomFields Description }}

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

