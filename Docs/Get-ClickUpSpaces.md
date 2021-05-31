---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/get-spaces.html
schema: 2.0.0
---

# Get-ClickUpSpaces

## SYNOPSIS
Get the details on all ClickUp Spaces in a team.

## SYNTAX

```
Get-ClickUpSpaces [-TeamID] <UInt64> [[-Archived] <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Get the details on all ClickUp Spaces in a team.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpSpaces TeamID 11111111
Returns the data on all the ClickUp Spaces with the Team ID "11111111"
```

### EXAMPLE 2
```
Get-ClickUpSpaces TeamID 11111111 -Archived $true
Returns the data on all the ClickUp Spaces with the Team ID "11111111" including archived
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

### -Archived
If set to true, will returned archived spaces in addition to non-archived spaces.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/get-spaces.html](https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/get-spaces.html)

