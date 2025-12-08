---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: https://developer.clickup.com/reference/updatespace
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: Set-ClickUpSpace
---

# Set-ClickUpSpace

## SYNOPSIS

Change settings of a ClickUp Space

## SYNTAX

### __AllParameterSets

```
Set-ClickUpSpace [-SpaceID] <ulong> [-Body] <hashtable> [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Change settings of a ClickUp Space.
Requires passing a hashtable of expected changes.

## EXAMPLES

### EXAMPLE 1

$Body = @{
>> name = 'New Name'
>> features = @{
>>     time_tracking = @{
>>         enabled = $true
>>     }
>> }
>> }
PS C:\> Set-ClickUpSpace -SpaceID 11111111 -Body $Body
Will change the name of space with ID "11111111" to "New Name" and enables the time tracking feature.

### EXAMPLE 2

$Body = @{
>> features = @{
>>     "due_dates" = @{
>>         "enabled" = $false
>>         "start_date" = $false
>>         "remap_due_dates" = $false
>>         "remap_closed_due_date" = $false
>>     }
>>     time_tracking = @{
>>         enabled = $false
>>     }
>>     "custom_fields" = @{
>>         "enabled" = $false
>>     }
>> }
>> }
PS C:\> Set-ClickUpSpace -SpaceID 11111111 -Body $Body
Will enable the due dates feature and disable the time tracking and custom fields features of space with ID "11111111".

## PARAMETERS

### -Body

{{ Fill Body Description }}

```yaml
Type: System.Collections.Hashtable
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SpaceID

{{ Fill SpaceID Description }}

```yaml
Type: System.UInt64
DefaultValue: 0
SupportsWildcards: false
Aliases:
- space_id
- id
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: true
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

### System.UInt64. SpaceID via pipeline by property name.

{{ Fill in the Description }}

### System.UInt64

{{ Fill in the Description }}

## OUTPUTS

### System.Object

{{ Fill in the Description }}

## NOTES

See the link for information on how to format the body.

Body format:
@{
    "name" = "Updated Space Name"
    "multiple_assignees" = $false
    "features" = @{
        "due_dates" = @{
            "enabled" = $false
            "start_date" = $false
            "remap_due_dates" = $false
            "remap_closed_due_date" = $false
        }
        "time_tracking" = @{
            "enabled" = $false
        }
        "tags" = @{
            "enabled" = $false
        }
        "time_estimates" = @{
            "enabled" = $false
        }
        "checklists" = @{
            "enabled" = $true
        }
        "custom_fields" = @{
            "enabled" = $true
        }
        "remap_dependencies" = @{
            "enabled" = $false
        }
        "dependency_warning": @{
            "enabled" = $false
        }
        "portfolios" = @{
            "enabled" = $false
        }
    }
}

## RELATED LINKS

- [](https://developer.clickup.com/reference/updatespace)
