---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/tags/create-space-tag.html
schema: 2.0.0
---

# New-ClickUpTag

## SYNOPSIS
Create a new ClickUp space tag.

## SYNTAX

```
New-ClickUpTag [-SpaceID] <UInt32> [-TagName] <String> [[-ForegroundColor] <String>]
 [[-BackgroundColor] <String>] [<CommonParameters>]
```

## DESCRIPTION
Create a new ClickUp space tag.

## EXAMPLES

### EXAMPLE 1
```
New-ClickUpTag -SpaceID 512 -Name "Tag Name" -ForegroundColor "#ffffff" -BackgroundColor "#000000"
Create a new ClickUp tag for space with ID "512" with the name "Tag Name", foreground color white, and background color black.
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

### -ForegroundColor
{{ Fill ForegroundColor Description }}

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

### -BackgroundColor
{{ Fill BackgroundColor Description }}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Management.Automation.PSCustomObject
## NOTES
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/tags/create-space-tag.html](https://jsapi.apiary.io/apis/clickup20/reference/0/tags/create-space-tag.html)

