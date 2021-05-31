---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/guests/add-guest-to-task.html
schema: 2.0.0
---

# Add-ClickUpGuestToTask

## SYNOPSIS
Add ClickUp guest to task.

## SYNTAX

### TaskID (Default)
```
Add-ClickUpGuestToTask -TaskID <String> -GuestID <UInt64> [-PermissionLevel <String>] [<CommonParameters>]
```

### CustomTaskIDs
```
Add-ClickUpGuestToTask -TaskID <String> -GuestID <UInt64> [-PermissionLevel <String>] -CustomTaskIDs <Boolean>
 -TeamID <UInt64> [<CommonParameters>]
```

## DESCRIPTION
Add ClickUp guest to task.

## EXAMPLES

### EXAMPLE 1
```
Add-ClickUpGuestToTask -TaskID c04 -GuestID 403
Add ClickUp guest user with ID "403" to task with ID "c04" with permission level "read".
```

### EXAMPLE 2
```
Add-ClickUpGuestToTask -TaskID c04 -GuestID 403 -PermissionLevel edit
Add ClickUp guest user with ID "403" to task with ID "c04" with permission level "edit".
```

### EXAMPLE 3
```
Add-ClickUpGuestToTask -TaskID CustomID -GuestID 403 -CustomTaskIDs $true -TeamID 123 -PermissionLevel edit.
Add ClickUp guest user with  custom ID "CustomID" to task with ID "c04" with permission level "edit".
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

### -GuestID
ClickUp guest ID.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PermissionLevel
Permission level of the guest added to the task.

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
Type: UInt64
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/guests/add-guest-to-task.html](https://jsapi.apiary.io/apis/clickup20/reference/0/guests/add-guest-to-task.html)

