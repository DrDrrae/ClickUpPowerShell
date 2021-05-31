---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/users/invite-user-to-workspace.html
schema: 2.0.0
---

# Add-ClickUpUser

## SYNOPSIS
Add ClickUp user to a workspace.

## SYNTAX

```
Add-ClickUpUser [-TeamID] <UInt64> [-EmailAddress] <String> [[-Admin] <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Add ClickUp user to a workspace.

The following user routes are only available to enterprise teams.

## EXAMPLES

### EXAMPLE 1
```
Add-ClickUpUser -TeamID 333 -EmailAddress 'user@example.com'
Invite user with email address "user@example.com" to ClickUp team with ID "333".
```

### EXAMPLE 2
```
Add-ClickUpUser -TeamID 333 -EmailAddress 'user@example.com' -Admin $true
Invite user with email address "user@example.com" to ClickUp team with ID "333" and make them an administrator.
```

## PARAMETERS

### -TeamID
ClickUp team ID.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -EmailAddress
Email address of the user to invite.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Admin
Set to true to make the invited user an admin.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: False
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

The following user routes are only available to enterprise teams.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/users/invite-user-to-workspace.html](https://jsapi.apiary.io/apis/clickup20/reference/0/users/invite-user-to-workspace.html)

