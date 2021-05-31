---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/dependencies/delete-task-link.html
schema: 2.0.0
---

# Remove-ClickUpTaskLink

## SYNOPSIS
Remove ClickUp task link.

## SYNTAX

### TaskID (Default)
```
Remove-ClickUpTaskLink -TaskID <String> -LinksTo <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### CustomTaskID
```
Remove-ClickUpTaskLink -TaskID <String> -LinksTo <String> -CustomTaskID <Boolean> -TeamID <UInt32> [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Remove ClickUp task link.

## EXAMPLES

### EXAMPLE 1
```
Remove-ClickUpTaskLink -TaskID 9hv -LinksTo 9hz
Remove ClickUp task with ID "9hz" as a link to ClickUp task with ID "9hv".
```

### EXAMPLE 2
```
Remove-ClickUpTaskLink -TaskID 9hv -LinksTo 9hz
Remove ClickUp task with ID "CustomTaskID 2" as a link to ClickUp task with ID "CustomTaskID 1".
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

### -LinksTo
The ClickUp task ID that the task ID referenced by "TaskID" should be removed from linked to.

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

### -CustomTaskID
{{ Fill CustomTaskID Description }}

```yaml
Type: Boolean
Parameter Sets: CustomTaskID
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -TeamID
Required ClickUp team ID if -CustomTaskIDs is set to $true.

```yaml
Type: UInt32
Parameter Sets: CustomTaskID
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

### System.Management.Automation.PSCustomObject.
## NOTES
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/dependencies/delete-task-link.html](https://jsapi.apiary.io/apis/clickup20/reference/0/dependencies/delete-task-link.html)

