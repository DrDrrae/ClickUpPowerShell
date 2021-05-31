---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/comments/get-task-comments.html
schema: 2.0.0
---

# Get-ClickUpTaskComments

## SYNOPSIS
Get all comments on a ClickUp task.

## SYNTAX

### TaskID (Default)
```
Get-ClickUpTaskComments -TaskID <String> [<CommonParameters>]
```

### CustomTaskIDs
```
Get-ClickUpTaskComments -TaskID <String> -CustomTaskIDs <Boolean> -TeamID <UInt64> [<CommonParameters>]
```

## DESCRIPTION
Get all comments on a ClickUp task.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpTaskComments -TaskID 9hz
Get all ClickUp comments under task with ID "9hz"
```

### EXAMPLE 2
```
Get-ClickUpTaskComments -TaskID CustomID -CustomTaskIDs $true -TeamID 123
Get all ClickUp comments under task with custom ID "CustomID".
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Management.Automation.PSCustomObject
## NOTES
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/comments/get-task-comments.html](https://jsapi.apiary.io/apis/clickup20/reference/0/comments/get-task-comments.html)

