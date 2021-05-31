---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/change-tag-names-from-time-entries.html
schema: 2.0.0
---

# Set-ClickUpTimeEntryTags

## SYNOPSIS
Update tag names from ClickUp time entries.

## SYNTAX

```
Set-ClickUpTimeEntryTags [-TeamID] <String> [-OldTagName] <String> [-NewTagName] <String>
 [[-TagBackgroundColor] <String>] [[-TagForegroundColor] <String>] [<CommonParameters>]
```

## DESCRIPTION
Update tag names from ClickUp time entries.

## EXAMPLES

### EXAMPLE 1
```
Set-ClickUpTimeEntryTags -TeamID 1111111 -OldTagName "old tag name" -NewTagName "new tag name"
Change the ClickUp tag with name "old tag name" to "new tag name".
```

### EXAMPLE 2
```
Set-ClickUpTimeEntryTags -TeamID 1111111 -OldTagName "old tag name" TagBackgroundColor "#000000" -TagForegroundColor "#ffffff"
Change the ClickUp tag with name "old tag name" foreground color to white and background color to black.
```

## PARAMETERS

### -TeamID
ClickUp team ID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OldTagName
Old name of the ClickUp tag to change.

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

### -NewTagName
New name of the ClickUp tag.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TagBackgroundColor
Background color of the ClickUp tag in hex format.

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

### -TagForegroundColor
Foreground color of the ClickUp tag in nex format.

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

[https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/change-tag-names-from-time-entries.html](https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/change-tag-names-from-time-entries.html)

