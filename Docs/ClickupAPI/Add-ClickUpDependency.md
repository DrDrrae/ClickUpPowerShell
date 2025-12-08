---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/adddependency
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: Add-ClickUpDependency
---

# Add-ClickUpDependency

## SYNOPSIS

Add ClickUp dependency.

## SYNTAX

### DependsOnTaskID (Default)

```
Add-ClickUpDependency -TaskID <string> -DependsOn <string> [<CommonParameters>]
```

### DependendencyOfCustomTaskID

```
Add-ClickUpDependency -TaskID <string> -DependendencyOf <string> -CustomTaskID <bool>
 -TeamID <ulong> [<CommonParameters>]
```

### DependendencyOfTaskID

```
Add-ClickUpDependency -TaskID <string> -DependendencyOf <string> [<CommonParameters>]
```

### DependsOnCustomTaskID

```
Add-ClickUpDependency -TaskID <string> -DependsOn <string> -CustomTaskID <bool> -TeamID <ulong>
 [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Add ClickUp dependency.

## EXAMPLES

### EXAMPLE 1

Add-ClickUpDependency -TaskID 9hv -DependsOn 9hz
Add ClickUp task with ID "9hz" as a dependency of ClickUp task with ID "9hv".

### EXAMPLE 2

Add-ClickUpDependency -TaskID 9hv -DependencyOf 9hz
Add ClickUp task with ID "9hv" as a dependency of ClickUp task with ID "9hz".

### EXAMPLE 3

Add-ClickUpDependency -TaskID "CustomTaskID 1" -DependsOn "CustomTaskID 2" -CustomTaskID $true -TeamID 123
Add ClickUp task with ID "CustomTaskID 2" as a dependency of ClickUp task with ID "CustomTaskID 1".

### EXAMPLE 4

Add-ClickUpDependency -TaskID "CustomTaskID 1" -DependencyOf "CustomTaskID 2" -CustomTaskID $true -TeamID 123
Add ClickUp task with ID "CustomTaskID 1" as a dependency of ClickUp task with ID "CustomTaskID 2".

## PARAMETERS

### -CustomTaskID

{{ Fill CustomTaskID Description }}

```yaml
Type: System.Boolean
DefaultValue: False
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: DependendencyOfCustomTaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: DependsOnCustomTaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DependendencyOf

{{ Fill DependendencyOf Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: DependendencyOfCustomTaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: DependendencyOfTaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -DependsOn

{{ Fill DependsOn Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: DependsOnCustomTaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: DependsOnTaskID
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

{{ Fill TaskID Description }}

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases:
- task_id
- id
ParameterSets:
- Name: DependendencyOfCustomTaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: DependendencyOfTaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: DependsOnCustomTaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: true
  ValueFromRemainingArguments: false
- Name: DependsOnTaskID
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

{{ Fill TeamID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: DependendencyOfCustomTaskID
  Position: Named
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: DependsOnCustomTaskID
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

### None. This cmdlet does not accept any input.

{{ Fill in the Description }}

### System.String. You can pipe a task ID to this cmdlet.

{{ Fill in the Description }}

### System.String

{{ Fill in the Description }}

## OUTPUTS

### None. This cmdlet does not return any output.

{{ Fill in the Description }}

## NOTES

See the link for information.

To create a waiting on dependency, pass the property depends_on in the body.
To create a blocking dependency, pass the property dependency_of.
Both can not be passed in the same request.

## RELATED LINKS

- [](https://developer.clickup.com/reference/adddependency)
