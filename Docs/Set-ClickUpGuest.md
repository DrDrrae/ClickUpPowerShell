---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/guests/edit-guest-on-workspace.html
schema: 2.0.0
---

# Set-ClickUpGuest

## SYNOPSIS
Update ClickUp guest on workspace.

## SYNTAX

```
Set-ClickUpGuest [-TeamID] <UInt32> [[-Username] <String>] [[-CanEditTags] <Boolean>]
 [[-CanSeeTimeSpent] <Boolean>] [[-CanSeeTimeEstimated] <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Update ClickUp guest on workspace.

## EXAMPLES

### EXAMPLE 1
```
Set-ClickUpGuest -TeamID 333 -GuestID 403 -Username 'Guest User'
Update ClickUp guest's username to "Guest User"  for guest with ID "403".
```

### EXAMPLE 2
```
Set-ClickUpGuest -TeamID 333 -GuestID 403 -CanEditTags $true -CanSeeTimeSpent $true -CanSeeTimeEstimated $true
Update ClickUp guest user's permissions to edit tags, see time spent, and see time estimated for guest with ID "403".
```

## PARAMETERS

### -TeamID
{{ Fill TeamID Description }}

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

### -Username
{{ Fill Username Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CanEditTags
{{ Fill CanEditTags Description }}

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
{{ Fill CanSeeTimeSpent Description }}

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
{{ Fill CanSeeTimeEstimated Description }}

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

[https://jsapi.apiary.io/apis/clickup20/reference/0/guests/edit-guest-on-workspace.html](https://jsapi.apiary.io/apis/clickup20/reference/0/guests/edit-guest-on-workspace.html)

