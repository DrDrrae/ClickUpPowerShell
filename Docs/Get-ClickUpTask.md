---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-task.html
schema: 2.0.0
---

# Get-ClickUpTask

## SYNOPSIS
Get a ClickUp task.

## SYNTAX

### TaskID (Default)
```
Get-ClickUpTask -TaskID <String> [-IncludeSubtasks <Boolean>] [<CommonParameters>]
```

### CustomTaskIDs
```
Get-ClickUpTask -TaskID <String> -CustomTaskIDs <Boolean> -TeamID <UInt64> [-IncludeSubtasks <Boolean>]
 [<CommonParameters>]
```

## DESCRIPTION
Get a ClickUp task.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpTask -TaskID 9hz
Get a ClickUp task under List with ID "11111111".
```

### EXAMPLE 2
```
Get-ClickUpTask -TaskID 9hz -CustomTaskIDs $true -TeamID 123
Get a ClickUp task under List with ID "22222222" and various other options.
```

## PARAMETERS

### -TaskID
ClickUp task ID.
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

### -CustomTaskIDs
Set to true if the task ID provided is a custom ID.

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
Required ClickUp team ID if -CustomTaskIDs is set to true.

```yaml
Type: UInt64
Parameter Sets: CustomTaskIDs
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeSubtasks
Set to true to include sub-tasks.

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

[https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-task.html](https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-task.html)

