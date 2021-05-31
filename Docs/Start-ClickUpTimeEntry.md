---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/start-a-time-entry.html
schema: 2.0.0
---

# Start-ClickUpTimeEntry

## SYNOPSIS
Start a ClickUp time entry.

## SYNTAX

### TaskID (Default)
```
Start-ClickUpTimeEntry -TeamID <UInt64> -TaskID <String> [-Description <String>] [-Tags <Hashtable[]>]
 [-Billable <Boolean>] [-CustomTaskIDs <Boolean>] [<CommonParameters>]
```

### TimerID
```
Start-ClickUpTimeEntry -TeamID <UInt64> -TimerID <UInt64> [-Description <String>] [-Tags <Hashtable[]>]
 [-Billable <Boolean>] [-CustomTaskIDs <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Start a ClickUp time entry.

## EXAMPLES

### EXAMPLE 1
```
Start-ClickUpTimeEntry -TeamID 512 -TimerID 2004673344540003570 -Description 'Time entry description'
Start time entry with ID "2004673344540003570" and set description to "Time entry description" for team with ID "512".
```

### EXAMPLE 2
```
Start-ClickUpTimeEntry -TeamID 512 -TaskID 9hx -Description 'Time entry description' -Billable $true
Start time entry for task with ID "9hx" and set description to "Time entry description" and billable set to true for team with ID "512".
```

## PARAMETERS

### -TeamID
ClickUp team Id.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TimerID
ClickUp time entry ID.

```yaml
Type: UInt64
Parameter Sets: TimerID
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TaskID
ClickUp task ID.

```yaml
Type: String
Parameter Sets: TaskID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Description to change the time entry to.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tags
ClickUp tags to add to the ClickUp time entry.

```yaml
Type: Hashtable[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Billable
Set to true to make the time entry billable.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomTaskIDs
Set to true if the task ID provided is a custom ID.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/start-a-time-entry.html](https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/start-a-time-entry.html)

