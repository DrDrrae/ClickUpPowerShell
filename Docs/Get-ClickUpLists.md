---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/lists/get-lists.html
https://jsapi.apiary.io/apis/clickup20/reference/0/lists/get-folderless-lists.html
schema: 2.0.0
---

# Get-ClickUpLists

## SYNOPSIS
Get all ClickUp lists.

## SYNTAX

### FolderID (Default)
```
Get-ClickUpLists -FolderID <UInt64> [-Archived <Boolean>] [<CommonParameters>]
```

### SpaceID
```
Get-ClickUpLists -SpaceID <UInt64> [-Archived <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Get all ClickUp lists.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpLists -FolderID 456
Get ClickUp lists under folder with ID "456".
```

### EXAMPLE 2
```
Get-ClickUpLists -FolderID 456 -Archived $true
Get ClickUp lists under folder with ID "456" including archived lists.
```

## PARAMETERS

### -FolderID
ClickUp folder ID.

```yaml
Type: UInt64
Parameter Sets: FolderID
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SpaceID
Clickup space ID.

```yaml
Type: UInt64
Parameter Sets: SpaceID
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Archived
If set to true, will returned archived lists in addition to non-archived lists.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/lists/get-lists.html
https://jsapi.apiary.io/apis/clickup20/reference/0/lists/get-folderless-lists.html](https://jsapi.apiary.io/apis/clickup20/reference/0/lists/get-lists.html
https://jsapi.apiary.io/apis/clickup20/reference/0/lists/get-folderless-lists.html)

