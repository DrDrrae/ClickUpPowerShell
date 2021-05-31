---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-time-entries-within-a-date-range.html
schema: 2.0.0
---

# Get-ClickUpTimeEntries

## SYNOPSIS
Get ClickUp time entries.

## SYNTAX

```
Get-ClickUpTimeEntries [-TeamID] <UInt64> [[-StartDate] <DateTime>] [[-EndDate] <DateTime>]
 [[-Assignees] <UInt32[]>] [<CommonParameters>]
```

## DESCRIPTION
Get ClickUp time entries.
Optional within a date range.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpTimeEntries -TeamID 512
Get ClickUp Time Entries for ClickUp team with ID "512".
```

### EXAMPLE 2
```
Get-ClickUpTimeEntries -TeamID 512 -StartDate "12/01/2021 00:00" -EndDate "12/31/2021 23:59"
Get ClickUp Time Entries for ClickUp team with ID "512" between December 1st, 2021 12:00 AM and December 31, 2021 11:59 PM.
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

### -StartDate
Start date and time of the time entries range.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EndDate
End date and time of the time entries range.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Assignees
ClickUp member IDs to return the time entries of.

```yaml
Type: UInt32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Management.Automation.PSCustomObject.
## NOTES
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-time-entries-within-a-date-range.html](https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-time-entries-within-a-date-range.html)

