---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/shared-hierarchy/shared-hierarchy.html
schema: 2.0.0
---

# Get-ClickUpSharedHierarchy

## SYNOPSIS
Get ClickUp shared hierarchy.

## SYNTAX

```
Get-ClickUpSharedHierarchy [-TeamID] <UInt64> [<CommonParameters>]
```

## DESCRIPTION
Get ClickUp shared hierarchy.
Returns all resources you have access to where you don't have access to its parent.
For example, if you have a access to a shared task, but don't have access to its parent list, it will come back in this request.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpSharedHierarchy -TeamID 123
Returns all ClickUp resources you have access to where you don't have access to its parent.
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

Returns all resources you have access to where you don't have access to its parent.
For example, if you have a access to a shared task, but don't have access to its parent list, it will come back in this request.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/shared-hierarchy/shared-hierarchy.html](https://jsapi.apiary.io/apis/clickup20/reference/0/shared-hierarchy/shared-hierarchy.html)

