---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/create-a-time-entry.html
schema: 2.0.0
---

# New-ClickUpTimeEntry

## SYNOPSIS
Create a new ClickUp time entry.

## SYNTAX

```
New-ClickUpTimeEntry [-TeamID] <UInt64> [[-CustomTaskIDs] <Boolean>] [[-Description] <String>]
 [[-Tags] <Hashtable[]>] [-StartDate] <DateTime> [[-Billable] <Boolean>] [-Duration] <UInt64>
 [[-Assignee] <UInt64>] [[-TaskID] <String>] [<CommonParameters>]
```

## DESCRIPTION
Create a new ClickUp time entry.

## EXAMPLES

### EXAMPLE 1
```
New-ClickUpTimeEntry -TeamID 1111111 -Description 'this is a test time entry' -StartDate '12/31/2021 08:25' -Duration '600'
Create a new ClickUp time entry starting December 31, 2021 8:25 AM with a duration of 10 minutes.
```

## PARAMETERS

### -TeamID
ClickUp team ID.

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

### -CustomTaskIDs
If you want to reference a task by its custom task ID, this value must be true.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Description of the new ClickUp time entry.

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

### -Tags
Tags to add to the new ClickUp time entry.

```yaml
Type: Hashtable[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartDate
Start date and time of the new ClickUp time entry.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Billable
Set to true to make the new time entry billable.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Duration
Duration of the new ClickUp time entry in seconds.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: True
Position: 7
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Assignee
ClickUp member assigned to the new ClickUp time entry.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TaskID
ClickUp task ID to assign the time entry to.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/create-a-time-entry.html](https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/create-a-time-entry.html)

