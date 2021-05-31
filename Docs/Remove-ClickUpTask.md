---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/update-task.html
schema: 2.0.0
---

# Remove-ClickUpTask

## SYNOPSIS
Remove a ClickUp task.

## SYNTAX

### TaskID (Default)
```
Remove-ClickUpTask -TaskID <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### CustomTaskIDs
```
Remove-ClickUpTask -TaskID <String> -CustomTaskIDs <Boolean> -TeamID <UInt64> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Remove a ClickUp task.

## EXAMPLES

### EXAMPLE 1
```
Remove-ClickUpTask -TaskID 9hx
Remove the task with ID "9hx".
```

### EXAMPLE 2
```
Remove-ClickUpTask -TaskID 'CustomTaskID' -CustomTaskIDs $True -TeamID 1111111
Remove the task with custom ID "CustomTaskID".
```

## PARAMETERS

### -TaskID
The ClickUp task ID.
Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.

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

### -CustomTaskIDs
Set to true if the task ID provided is a custom ID.

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
Required ClickUp team ID if -CustomTaskIDs is set to true.

```yaml
Type: UInt64
Parameter Sets: CustomTaskIDs
Aliases:

Required: True
Position: Named
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
See the link for more information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/update-task.html](https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/update-task.html)

