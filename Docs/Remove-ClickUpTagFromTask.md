---
external help file: ClickUpAPI-help.xml
Module Name: ClickupAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/tags/remove-tag-from-task.html
schema: 2.0.0
---

# Remove-ClickUpTagFromTask

## SYNOPSIS
Remove ClickUp tag from task.

## SYNTAX

### TaskID (Default)
```
Remove-ClickUpTagFromTask [-WhatIf] [-Confirm] [<CommonParameters>]
```

### CustomTaskIDs
```
Remove-ClickUpTagFromTask -TaskID <String> -TagName <String> -CustomTaskIDs <Boolean> -TeamID <UInt32>
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### TaskIDs
```
Remove-ClickUpTagFromTask -TaskID <String> -TagName <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Remove ClickUp tag from task.

## EXAMPLES

### EXAMPLE 1
```
Remove-ClickUpTagToTask -TaskID abc -TagName "name"
Remove ClickUp tag with name "name" to task with ID "abc".
```

### EXAMPLE 2
```
Remove-ClickUpTagToTask -TaskID "Custom Task ID" -TagName "name" -CustomTaskIDs $true -TeamID 123
Remove ClickUp tag with name "name" to task with custom ID "Custom Task ID".
```

## PARAMETERS

### -TaskID
{{ Fill TaskID Description }}

```yaml
Type: String
Parameter Sets: CustomTaskIDs, TaskIDs
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TagName
{{ Fill TagName Description }}

```yaml
Type: String
Parameter Sets: CustomTaskIDs, TaskIDs
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/tags/remove-tag-from-task.html](https://jsapi.apiary.io/apis/clickup20/reference/0/tags/remove-tag-from-task.html)

