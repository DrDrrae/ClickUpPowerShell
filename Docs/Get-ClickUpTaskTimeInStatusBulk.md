---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-bulk-tasks'-time-in-status.html
schema: 2.0.0
---

# Get-ClickUpTaskTimeInStatusBulk

## SYNOPSIS
Get a ClickUp bulk task's time in status.

## SYNTAX

### TaskID (Default)
```
Get-ClickUpTaskTimeInStatusBulk -TaskID <String[]> [<CommonParameters>]
```

### CustomTaskIDs
```
Get-ClickUpTaskTimeInStatusBulk -TaskID <String[]> -CustomTaskIDs <Boolean> -TeamID <UInt32>
 [<CommonParameters>]
```

## DESCRIPTION
Get a ClickUp bulk task's time in status.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpTaskTimeInStatusBulk -TaskID 9hz,3cuh,g4fs
Get a ClickUp task's time in status with ID "9hz".
```

### EXAMPLE 2
```
Get-ClickUpTaskTimeInStatusBulk -TaskID "CustomTaskID 1","CustomTaskID 2","CustomTaskID 3" -CustomTaskIDs $true -TeamID 123
Get multiple ClickUp task's time in status with custom IDs "CustomTaskID 1", "CustomTaskID 2", and "CustomTaskID 3".
```

## PARAMETERS

### -TaskID
{{ Fill TaskID Description }}

```yaml
Type: String[]
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
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-bulk-tasks'-time-in-status.html](https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-bulk-tasks'-time-in-status.html)

