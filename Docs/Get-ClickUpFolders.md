---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/folders/get-folders.html
schema: 2.0.0
---

# Get-ClickUpFolders

## SYNOPSIS
Get all ClickUp Folders.

## SYNTAX

```
Get-ClickUpFolders [-SpaceID] <UInt32> [[-Archived] <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Get all ClickUp Folders.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpFolders -SpaceID 11111111
Get all ClickUp folders under ClickUp Space with ID "11111111".
```

### EXAMPLE 2
```
Get-ClickUpFolders -SpaceID 11111111 -Archived $true
Get all ClickUp folders under ClickUp Space with ID "11111111" including archived.
```

## PARAMETERS

### -SpaceID
The ClickUp space ID.

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

### -Archived
If set to $true, will return archived spaces in addition to non-archived spaced.

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

[https://jsapi.apiary.io/apis/clickup20/reference/0/folders/get-folders.html](https://jsapi.apiary.io/apis/clickup20/reference/0/folders/get-folders.html)

