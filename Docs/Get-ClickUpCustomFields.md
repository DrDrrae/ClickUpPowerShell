---
external help file: ClickUpAPI-help.xml
https: //jsapi.apiary.io/apis/clickup20/reference/0/custom-fields/get-accessible-custom-fields.html
Module Name: ClickupAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields.html
schema: 2.0.0
---

# Get-ClickUpCustomFields

## SYNOPSIS
Get ClickUp custom fields.

## SYNTAX

```
Get-ClickUpCustomFields [-ListID] <String> [<CommonParameters>]
```

## DESCRIPTION
Get ClickUp custom fields.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpCustomFields -TaskID 9hz
Get all ClickUp custom field under task with ID "9hz"
```

### EXAMPLE 2
```
Get-ClickUpCustomFields -TaskID CustomID -CustomTaskIDs $true -TeamID 123
Get all ClickUp custom field under task with custom ID "CustomID".
```

## PARAMETERS

### -ListID
The ClickUp list ID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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
https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields/get-accessible-custom-fields.html](https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields.html
https://jsapi.apiary.io/apis/clickup20/reference/0/custom-fields/get-accessible-custom-fields.html)

