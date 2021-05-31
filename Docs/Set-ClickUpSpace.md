---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/update-space.html
schema: 2.0.0
---

# Set-ClickUpSpace

## SYNOPSIS
Change settings of a ClickUp Space

## SYNTAX

```
Set-ClickUpSpace [-SpaceID] <UInt64> [-Body] <Hashtable> [<CommonParameters>]
```

## DESCRIPTION
Change settings of a ClickUp Space.
Requires passing a hashtable of expected changes.

## EXAMPLES

### EXAMPLE 1
```
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
```

### EXAMPLE 2
```
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
```

## PARAMETERS

### -SpaceID
ClickUp space ID.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
Hashtable containing the settings and/or properties to change on the ClickUp space.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/update-space.html](https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/update-space.html)

