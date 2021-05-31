---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/guests/remove-guest-from-task.html
schema: 2.0.0
---

# Remove-ClickUpGuestFromTask

## SYNOPSIS
Remove ClickUp guest from task.

## SYNTAX

### TaskID (Default)
```
Remove-ClickUpGuestFromTask -TaskID <String> -GuestID <UInt32> [-PermissionLevel <String>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### CustomTaskIDs
```
Remove-ClickUpGuestFromTask -TaskID <String> -GuestID <UInt32> [-PermissionLevel <String>]
 -CustomTaskIDs <Boolean> -TeamID <UInt32> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Remove ClickUp guest from task.

## EXAMPLES

### EXAMPLE 1
```
Remove-ClickUpGuestFromTask -TaskID 1427 -GuestID 403
Remove ClickUp guest with Id "403" from task with ID "1427".
```

## PARAMETERS

### -TaskID
{{ Fill TaskID Description }}

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

### -GuestID
{{ Fill GuestID Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PermissionLevel
{{ Fill PermissionLevel Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Read
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

### System.Management.Automation.PSCustomObject.
## NOTES
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/guests/remove-guest-from-task.html](https://jsapi.apiary.io/apis/clickup20/reference/0/guests/remove-guest-from-task.html)

