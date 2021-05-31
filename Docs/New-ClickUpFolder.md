---
external help file: ClickUpAPI-help.xml
Module Name: ClickupAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/folders/create-folder.html
schema: 2.0.0
---

# New-ClickUpFolder

## SYNOPSIS
Create a ClickUp folder in a particular space.

## SYNTAX

```
New-ClickUpFolder [-SpaceID] <UInt64> [-Name] <UInt64> [<CommonParameters>]
```

## DESCRIPTION
Create a ClickUp folder in a particular space.

## EXAMPLES

### EXAMPLE 1
```
New-ClickUpFolder -SpaceID 11111111 -Name 'New Folder Name'
Create a ClickUp folder with name "New Folder Name" under the ClickUp Space with ID "11111111".
```

## PARAMETERS

### -SpaceID
The ClickUp space ID.

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

### -Name
The name of the ClickUp folder to be created.

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

### System.Management.Automation.PSCustomObject
## NOTES
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/folders/create-folder.html](https://jsapi.apiary.io/apis/clickup20/reference/0/folders/create-folder.html)

