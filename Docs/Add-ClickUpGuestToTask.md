---
external help file: ClickUpAPI-help.xml
Module Name: ClickupAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/guests/add-guest-to-list.html
schema: 2.0.0
---

# Add-ClickUpGuestToTask

## SYNOPSIS
Add ClickUp guest to list.

## SYNTAX

### TaskID (Default)
```
Add-ClickUpGuestToTask -TaskID <String> -GuestID <UInt32> [-PermissionLevel <String>] [<CommonParameters>]
```

### CustomTaskIDs
```
Add-ClickUpGuestToTask -TaskID <String> -GuestID <UInt32> [-PermissionLevel <String>] -CustomTaskIDs <Boolean>
 -TeamID <UInt32> [<CommonParameters>]
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

### -TaskID
The ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.

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

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/guests/add-guest-to-list.html](https://jsapi.apiary.io/apis/clickup20/reference/0/guests/add-guest-to-list.html)

