---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields.html
https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields/remove-custom-field-value.html
schema: 2.0.0
---

# Remove-ClickUpCustomFieldValue

## SYNOPSIS
Remove a ClickUp custom field value.

## SYNTAX

### CustomTaskID
```
Remove-ClickUpCustomFieldValue -TaskID <String> -FieldID <String> -CustomTaskID <Boolean> -TeamID <UInt32>
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

### TaskID
```
Remove-ClickUpCustomFieldValue -TaskID <String> -FieldID <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Remove a ClickUp custom field value.

## EXAMPLES

### EXAMPLE 1
```
Remove-ClickUpCustomFieldValue -TaskID 9hz -FieldID b955c4dc -Value 80
Remove the ClickUp custom field under task with ID "9hz" and field with ID "b955c4dc".
```

### EXAMPLE 2
```
Set-ClickUpCustomFieldValue -TaskID CustomID -FieldID b955c4dc -Value 80 -CustomTaskIDs $true -TeamID 123
Remove the ClickUp custom field under task with custom ID "CustomID" and field with ID "b955c4dc".
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

### -FieldID
ClickUp custom field ID.

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

[https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields.html
https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields/remove-custom-field-value.html](https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields.html
https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields/remove-custom-field-value.html)

