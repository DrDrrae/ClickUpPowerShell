---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/attachments/create-task-attachment.html
schema: 2.0.0
---

# New-ClickUpTaskAttachment

## SYNOPSIS
Upload an attachment to a ClickUp task.

## SYNTAX

### TaskID (Default)
```
New-ClickUpTaskAttachment [<CommonParameters>]
```

### CustomTaskIDs
```
New-ClickUpTaskAttachment -TaskID <String> -AttachmentPath <String> -CustomTaskIDs <Boolean> -TeamID <UInt64>
 [<CommonParameters>]
```

### TaskIDs
```
New-ClickUpTaskAttachment -TaskID <String> -AttachmentPath <String> [<CommonParameters>]
```

## DESCRIPTION
Upload an attachment to a ClickUp task.

## EXAMPLES

### EXAMPLE 1
```
New-ClickUpTaskAttachment -TaskID 9hv -AttachmentPath "C:\Path\To\File.txt"
Upload file "File.txt" as an attachment to ClickUp task with ID "9hv".
```

### EXAMPLE 2
```
New-ClickUpTaskAttachment -TaskID CustomTaskID -AttachmentPath "C:\Path\To\File.txt" -CustomTaskIDs $true -TeamID 123
Upload file "File.txt" as an attachment to ClickUp task with custom ID "CustomTaskID".
```

## PARAMETERS

### -TaskID
The ClickUp task ID.
Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.

```yaml
Type: String
Parameter Sets: CustomTaskIDs, TaskIDs
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AttachmentPath
The path to the attachment to upload.

```yaml
Type: String
Parameter Sets: CustomTaskIDs, TaskIDs
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

### System.Management.Automation.PSCustomObject.
## NOTES
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/attachments/create-task-attachment.html](https://jsapi.apiary.io/apis/clickup20/reference/0/attachments/create-task-attachment.html)

