---
external help file: ClickUpAPI-help.xml
Module Name: ClickupAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/tags/add-tag-to-task.html
schema: 2.0.0
---

# Add-ClickUpTagToTask

## SYNOPSIS
Add ClickUp tag to task.

## SYNTAX

### TaskIDs (Default)
```
Add-ClickUpTagToTask -TaskID <String> -TagName <String> [<CommonParameters>]
```

### CustomTaskIDs
```
Add-ClickUpTagToTask -TaskID <String> -TagName <String> -CustomTaskIDs <Boolean> -TeamID <UInt32>
 [<CommonParameters>]
```

## DESCRIPTION
Add ClickUp tag to task.

## EXAMPLES

### EXAMPLE 1
```
Add-ClickUpTagToTask -TaskID abc -TagName "name"
Add ClickUp tag with name "name" to task with ID "abc".
```

### EXAMPLE 2
```
Add-ClickUpTagToTask -TaskID "Custom Task ID" -TagName "name" -CustomTaskIDs $true -TeamID 123
Add ClickUp tag with name "name" to task with custom ID "Custom Task ID".
```

## PARAMETERS

### -TaskID
{{ Fill TaskID Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomTaskIDs
{{ Fill CustomTaskIDs Description }}

```yaml
Type: Boolean
Parameter Sets: CustomTaskIDs
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -TeamID
{{ Fill TeamID Description }}

```yaml
Type: UInt32
Parameter Sets: CustomTaskIDs
Aliases:

Required: True
Position: Named
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/tags/add-tag-to-task.html](https://jsapi.apiary.io/apis/clickup20/reference/0/tags/add-tag-to-task.html)

