---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-singular-time-entry.html
schema: 2.0.0
---

# Get-ClickUpTimeEntry

## SYNOPSIS
Get a single ClickUp time entry.

## SYNTAX

```
Get-ClickUpTimeEntry [-TeamID] <UInt64> [-TimerID] <UInt64> [<CommonParameters>]
```

## DESCRIPTION
Get a single ClickUp time entry.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpTimeEntry -TeamID 512 -TimerID 1963465985517105840
Get a ClickUp Time Entry with ID "1963465985517105840" for ClickUp team with ID "512".
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

### -TimerID
ClickUp time entry ID.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-singular-time-entry.html](https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/get-singular-time-entry.html)

