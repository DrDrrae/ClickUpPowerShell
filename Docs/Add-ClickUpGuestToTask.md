---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/guests/add-guest-to-list.html
schema: 2.0.0
---

# Add-ClickUpGuestToTask

## SYNOPSIS
Add ClickUp guest to list.

## SYNTAX

```
Add-ClickUpGuestToTask [-ListID] <UInt32> [-GuestID] <UInt32> [[-PermissionLevel] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Add ClickUp guest to list.

## EXAMPLES

### EXAMPLE 1
```
Add-ClickUpGuestToList -ListID 1427 -GuestID 403
Add ClickUp guest user with ID "403" to list with ID "1427" with permission level "read".
```

### EXAMPLE 2
```
Add-ClickUpGuestToList -ListID 1427 -GuestID 403 -PermissionLevel edit
Add ClickUp guest user with ID "403" to list with ID "1427" with permission level "edit".
```

## PARAMETERS

### -ListID
{{ Fill ListID Description }}

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

### -GuestID
{{ Fill GuestID Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
Position: 3
Default value: Read
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/guests/add-guest-to-list.html](https://jsapi.apiary.io/apis/clickup20/reference/0/guests/add-guest-to-list.html)

