---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/createtaskattachment
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: New-ClickUpTaskAttachment
---

# New-ClickUpTaskAttachment

## SYNOPSIS

Uploads an attachment to a specified ClickUp task.

## SYNTAX

### TaskID (Default)

```
New-ClickUpTaskAttachment -TaskID <string> -AttachmentPath <string> [<CommonParameters>]
```

### CustomTaskIDs

```
New-ClickUpTaskAttachment -TaskID <string> -AttachmentPath <string> -CustomTaskIDs <bool>
 -TeamID <ulong> [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The New-ClickUpTaskAttachment cmdlet uploads a file as an attachment to a ClickUp task.
You can specify the task by its ID or by using custom task IDs (requires Team ID).

## EXAMPLES

### EXAMPLE 1

New-ClickUpTaskAttachment -TaskID "8675309" -AttachmentPath "C:\Reports\Status.pdf"

Uploads the file "Status.pdf" to the task with ID "8675309".

### EXAMPLE 2

New-ClickUpTaskAttachment -TaskID "CUST-123" -AttachmentPath "C:\Images\Design.png" -CustomTaskIDs $true -TeamID 123456

Uploads the file "Design.png" to the task with custom ID "CUST-123" in team 123456.

## PARAMETERS

### -AttachmentPath

The local file path of the attachment to be uploaded.
This parameter is mandatory.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: CustomTaskIDs
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: TaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -CustomTaskIDs

Indicates that the provided TaskID is a custom task ID.
If set to $true, the TeamID parameter is also required.

```yaml
Type: System.Boolean
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: CustomTaskIDs
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -TaskID

The ID of the task to upload the attachment to.
This parameter is mandatory when not using Custom Task IDs.
The ID of the task to upload the attachment to.
This parameter is mandatory when not using Custom Task IDs and accepts pipeline input.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases:
- task_id
- id
ParameterSets:
- Name: CustomTaskIDs
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: TaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -TeamID

The ID of the team (workspace) where the custom task ID exists.
This parameter is mandatory when CustomTaskIDs is set to $true.

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: CustomTaskIDs
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. You cannot pipe objects to this cmdlet.

{{ Fill in the Description }}

### System.String. You can pipe a task ID to this cmdlet.

{{ Fill in the Description }}

### System.String

{{ Fill in the Description }}

## OUTPUTS

### None. The cmdlet does not return any output.

{{ Fill in the Description }}

### System.Management.Automation.PSCustomObject

{{ Fill in the Description }}

## NOTES

API Reference: https://developer.clickup.com/reference/createtaskattachment

## RELATED LINKS

- [](https://developer.clickup.com/reference/createtaskattachment)
