---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/add-tags-from-time-entries.html
schema: 2.0.0
---

# Add-ClickUpTimeEntryTags

## SYNOPSIS
Add tags to a ClickUp time entry.

## SYNTAX

```
Add-ClickUpTimeEntryTags [-TeamID] <String> [-TimeEntryIDs] <UInt64[]> [-Tags] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Add tags to a ClickUp time entry.

## EXAMPLES

### EXAMPLE 1
```
Add-ClickUpTimeEntryTags -TeamID 1111111 -TimeEntryIDs 2222222222222222222 -Tags "name of tag"
Add the tag with name "name of tag" to ClickUp time entry with ID "2222222222222222222".
```

### EXAMPLE 2
```
Add-ClickUpTimeEntryTags -TeamID 1111111 -TimeEntryIDs 2222222222222222222,3333333333333333333 -Tags "name of tag","second tag name"
Add the tag with name "name of tag" and "second tag name" to ClickUp time entries with IDs "2222222222222222222" and "3333333333333333333".
```

## PARAMETERS

### -TeamID
{{ Fill TeamID Description }}

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

### -TimeEntryIDs
{{ Fill TimeEntryIDs Description }}

```yaml
Type: UInt64[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tags
{{ Fill Tags Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/add-tags-from-time-entries.html](https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-20/add-tags-from-time-entries.html)

