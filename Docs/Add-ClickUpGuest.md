---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/goals/invite-guest-to-workspace.html
schema: 2.0.0
---

# Add-ClickUpGuest

## SYNOPSIS
Invite ClickUp guest to workspace.

## SYNTAX

```
Add-ClickUpGuest [-TeamID] <UInt64> [-GuestEmail] <String> [[-CanEditTags] <Boolean>]
 [[-CanSeeTimeSpent] <Boolean>] [[-CanSeeTimeEstimated] <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Invite ClickUp guest to workspace.

## EXAMPLES

### EXAMPLE 1
```
Add-ClickUpGuest -TeamID 333 -GuestEmail 'guest@example.com'
Add ClickUp guest user with email "guest@example.com" for team with ID "333".
```

### EXAMPLE 2
```
Add-ClickUpGuest -TeamID 333 -GuestEmail 'guest@example.com' -CanEditTags $true -CanSeeTimeSpent $true -CanSeeTimeEstimated $true
Add ClickUp guest user with email "guest@example.com" for team with ID "333" and give them access to edit tags, see time spent, and see time estimated.
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

### -GuestEmail
The email address of the guest to invite.

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

### -CanEditTags
Whether the guest can edit tags.

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

### -CanSeeTimeSpent
Whether the guest can see time spent.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CanSeeTimeEstimated
Wheter the guest can see time estimated.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: False
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/goals/invite-guest-to-workspace.html](https://jsapi.apiary.io/apis/clickup20/reference/0/goals/invite-guest-to-workspace.html)

