---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/create-checklist.html
schema: 2.0.0
---

# New-ClickUpChecklist

## SYNOPSIS
Create a new ClickUp checklist.

## SYNTAX

### TaskID (Default)
```
New-ClickUpChecklist -TaskID <String> -Name <String> [<CommonParameters>]
```

### CustomTaskIDs
```
New-ClickUpChecklist -TaskID <String> -Name <String> -CustomTaskIDs <Boolean> -TeamID <UInt32>
 [<CommonParameters>]
```

## DESCRIPTION
Create a new ClickUp checklist.

## EXAMPLES

### EXAMPLE 1
```
New-ClickUpChecklist -TaskID 9hz -Name "Checklist"
Create a new checklist on ClickUp task with ID "9hz" with name "Checklist".
```

### EXAMPLE 2
```
New-ClickUpChecklist -TaskID CustomID -CustomTaskIDs $true -TeamID 123 -Name "Checklist"
Create a new checklist on ClickUp task with custom ID "CustomID" with name "Checklist".
```

## PARAMETERS

### -TaskID
The ClickUp task ID.
Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.

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

### -Name
The name of the new ClickUp checklist.

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
Set to $true if the task ID provided is a custom ID.

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
Required ClickUp team ID if -CustomTaskIDs is set to $true.

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

[https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/create-checklist.html](https://jsapi.apiary.io/apis/clickup20/reference/0/checklists/create-checklist.html)

