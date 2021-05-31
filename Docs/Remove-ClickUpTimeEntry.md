---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/delete-a-time-entry.html
schema: 2.0.0
---

# Remove-ClickUpTimeEntry

## SYNOPSIS
Remove a ClickUp time entry.

## SYNTAX

```
Remove-ClickUpTimeEntry [-TeamID] <UInt32> [-TimerID] <UInt64> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Remove a ClickUp time entry.

## EXAMPLES

### EXAMPLE 1
```
Remove-ClickUpTimeEntry -TeamID 1111111 -TimerID 2222222222222222222
Remove a ClickUp time entry with ID "2222222222222222222".
```

## PARAMETERS

### -TeamID
{{ Fill TeamID Description }}

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

### -TimerID
{{ Fill TimerID Description }}

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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/delete-a-time-entry.html](https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/delete-a-time-entry.html)

