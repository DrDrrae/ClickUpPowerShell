---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/goals/get-goals.html
schema: 2.0.0
---

# Get-ClickUpGoals

## SYNOPSIS
Get all ClickUp team goals.

## SYNTAX

```
Get-ClickUpGoals [-TeamID] <UInt64> [<CommonParameters>]
```

## DESCRIPTION
Get all ClickUp team goals.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpGoals -TeamID 123
Get all ClickUp team goals for team with ID "123".
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Management.Automation.PSCustomObject
## NOTES
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/goals/get-goals.html](https://jsapi.apiary.io/apis/clickup20/reference/0/goals/get-goals.html)

