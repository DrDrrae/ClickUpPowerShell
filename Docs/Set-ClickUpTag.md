---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/tags/edit-space-tag.html
schema: 2.0.0
---

# Set-ClickUpTag

## SYNOPSIS
Update a ClickUp space tag.

## SYNTAX

```
Set-ClickUpTag [-SpaceID] <UInt32> [-TagName] <String> [[-NewName] <String>] [[-ForegroundColor] <String>]
 [[-BackgroundColor] <String>] [<CommonParameters>]
```

## DESCRIPTION
Update a ClickUp space tag.

## EXAMPLES

### EXAMPLE 1
```
Set-ClickUpTag -SpaceID 512 -TagName "Tag Name" -NewName "Updated Tag" -ForegroundColor "#ffffff" -BackgroundColor "#000000"
Update a ClickUp tag with name "Tag Name" for space with ID "512" to the name "Updated Tag", foreground color to white, and background color to black.
```

## PARAMETERS

### -SpaceID
{{ Fill SpaceID Description }}

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

### -TagName
{{ Fill TagName Description }}

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

### -NewName
{{ Fill NewName Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForegroundColor
{{ Fill ForegroundColor Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BackgroundColor
{{ Fill BackgroundColor Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/tags/edit-space-tag.html](https://jsapi.apiary.io/apis/clickup20/reference/0/tags/edit-space-tag.html)

