---
external help file: ClickUpAPI-help.xml
https: //jsapi.apiary.io/apis/clickup20/reference/0/custom-fields/set-custom-field-value.html
Module Name: ClickupAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields.html
schema: 2.0.0
---

# Set-ClickUpCustomFieldValue

## SYNOPSIS
Set ClickUp custom field value.

## SYNTAX

### TaskID (Default)
```
Set-ClickUpCustomFieldValue -TaskID <String> -FieldID <String> -Value <String> [<CommonParameters>]
```

### CustomTaskIDs
```
Set-ClickUpCustomFieldValue -TaskID <String> -CustomTaskIDs <Boolean> -TeamID <UInt32> [<CommonParameters>]
```

### CustomTaskID
```
Set-ClickUpCustomFieldValue -FieldID <String> -Value <String> [<CommonParameters>]
```

## DESCRIPTION
Set ClickUp custom field value.

## EXAMPLES

### EXAMPLE 1
```
Set-ClickUpCustomFieldValue -TaskID 9hz -FieldID b955c4dc -Value 80
Set the ClickUp custom field under task with ID "9hz" and field with ID "b955c4dc" to value "80".
```

### EXAMPLE 2
```
Set-ClickUpCustomFieldValue -TaskID CustomID -FieldID b955c4dc -Value 80 -CustomTaskIDs $true -TeamID 123
Set the ClickUp custom field under task with custom ID "CustomID" and field with ID "b955c4dc" to value "80".
```

## PARAMETERS

### -TaskID
The ClickUp task ID.
Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.

```yaml
Type: String
Parameter Sets: TaskID, CustomTaskIDs
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
Parameter Sets: TaskID, CustomTaskID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Value
Value to set to the custom field.

```yaml
Type: String
Parameter Sets: TaskID, CustomTaskID
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
Required ClickUp team ID if -CustomTaskIDs is set to $true.

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

### System.Management.Automation.PSCustomObject.
## NOTES
See the link for information.

The accessible fields can be found on the task object from the get task route.
This is where you can retrieve the field_id.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields.html
https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields/set-custom-field-value.html](https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields.html
https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields/set-custom-field-value.html)

