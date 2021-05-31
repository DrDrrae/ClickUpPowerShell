---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/guests/get-guest.html
schema: 2.0.0
---

# Get-ClickUpGuest

## SYNOPSIS
Get ClickUp guest.

## SYNTAX

```
Get-ClickUpGuest [-TeamID] <UInt64> [-GuestID] <UInt64> [<CommonParameters>]
```

## DESCRIPTION
Get ClickUp guest.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpGuest -TeamID 333 -GuestID 403
guest ClickUp guest user with ID "403" for team with ID "333".
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

### -GuestID
ClickUp guest ID.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/guests/get-guest.html](https://jsapi.apiary.io/apis/clickup20/reference/0/guests/get-guest.html)

