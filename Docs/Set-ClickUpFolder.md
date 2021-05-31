---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/folders/create-folder.html
schema: 2.0.0
---

# Set-ClickUpFolder

## SYNOPSIS
Update the name of a ClickUp Folder.

## SYNTAX

```
Set-ClickUpFolder [-FolderID] <UInt32> [-Name] <UInt32> [<CommonParameters>]
```

## DESCRIPTION
Update the name of a ClickUp Folder.

## EXAMPLES

### EXAMPLE 1
```
Set-ClickUpFolder -FolderID 11111111 -Name 'Change Folder Name'
Change the name of the ClickUp folder with ID "11111111" to "Change Folder Name".
```

## PARAMETERS

### -FolderID
The ClickUp folder ID.

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

### -Name
The new name of the ClickUp folder.

```yaml
Type: UInt32
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

