---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/dependencies/add-dependency.html
schema: 2.0.0
---

# Add-ClickUpDependency

## SYNOPSIS
Add ClickUp dependency.

## SYNTAX

### DependsOnTaskID (Default)
```
Add-ClickUpDependency -TaskID <String> -DependsOn <String> [<CommonParameters>]
```

### DependendencyOfCustomTaskID
```
Add-ClickUpDependency -TaskID <String> -DependendencyOf <String> -CustomTaskID <Boolean> -TeamID <UInt32>
 [<CommonParameters>]
```

### DependendencyOfTaskID
```
Add-ClickUpDependency -TaskID <String> -DependendencyOf <String> [<CommonParameters>]
```

### DependsOnCustomTaskID
```
Add-ClickUpDependency -TaskID <String> -DependsOn <String> -CustomTaskID <Boolean> -TeamID <UInt32>
 [<CommonParameters>]
```

## DESCRIPTION
Add ClickUp dependency.

## EXAMPLES

### EXAMPLE 1
```
Add-ClickUpDependency -TaskID 9hv -DependsOn 9hz
Add ClickUp task with ID "9hz" as a dependency of ClickUp task with ID "9hv".
```

### EXAMPLE 2
```
Add-ClickUpDependency -TaskID 9hv -DependencyOf 9hz
Add ClickUp task with ID "9hv" as a dependency of ClickUp task with ID "9hz".
```

### EXAMPLE 3
```
Add-ClickUpDependency -TaskID "CustomTaskID 1" -DependsOn "CustomTaskID 2" -CustomTaskID $true -TeamID 123
Add ClickUp task with ID "CustomTaskID 2" as a dependency of ClickUp task with ID "CustomTaskID 1".
```

### EXAMPLE 4
```
Add-ClickUpDependency -TaskID "CustomTaskID 1" -DependencyOf "CustomTaskID 2" -CustomTaskID $true -TeamID 123
Add ClickUp task with ID "CustomTaskID 1" as a dependency of ClickUp task with ID "CustomTaskID 2".
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

### -DependsOn
The ClickUp task ID that the task ID referenced by "TaskID" depends on.

```yaml
Type: String
Parameter Sets: DependsOnTaskID, DependsOnCustomTaskID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DependendencyOf
The ClickUp task ID that the task ID referenced by "TaskID" is a dependency of.

```yaml
Type: String
Parameter Sets: DependendencyOfCustomTaskID, DependendencyOfTaskID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomTaskID
{{ Fill CustomTaskID Description }}

```yaml
Type: Boolean
Parameter Sets: DependendencyOfCustomTaskID, DependsOnCustomTaskID
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
Parameter Sets: DependendencyOfCustomTaskID, DependsOnCustomTaskID
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

To create a waiting on dependency, pass the property depends_on in the body.
To create a blocking dependency, pass the property dependency_of.
Both can not be passed in the same request.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/dependencies/add-dependency.html](https://jsapi.apiary.io/apis/clickup20/reference/0/dependencies/add-dependency.html)

