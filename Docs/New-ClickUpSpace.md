---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/create-space.html
schema: 2.0.0
---

# New-ClickUpSpace

## SYNOPSIS
Create a new ClickUp Space.

## SYNTAX

```
New-ClickUpSpace [-TeamID] <UInt64> [-Name] <String> [[-MultipleAssignees] <Boolean>]
 [[-FeatureDueDates] <Boolean>] [[-FeatureStartDate] <Boolean>] [[-FeatureRemapDueDates] <Boolean>]
 [[-FeatureRemapClosedDueDate] <Boolean>] [[-FeatureTimeTracking] <Boolean>] [[-FeatureTags] <Boolean>]
 [[-FeatureTimeEstimates] <Boolean>] [[-FeatureChecklist] <Boolean>] [[-FeatureCustomFields] <Boolean>]
 [[-FeatureRemapDependencies] <Boolean>] [[-FeatureDependencyWarning] <Boolean>]
 [[-FeaturePortfolios] <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Create a new ClickUp Space.

## EXAMPLES

### EXAMPLE 1
```
New-ClickUpSpace -TeamID 11111111 -Name 'New ClickUp Space' -Multiple_Assignees
Creates a new ClickUp Space with the name "New Clickup Space" and the Multiple Assignees feature enabled.
```

## PARAMETERS

### -TeamID
ClickUp team ID.

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

### -Name
Name of the new ClickUp space.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MultipleAssignees
Set to true to enable the multiple assignees ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureDueDates
Set to true to enable the due dates ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureStartDate
Set to true to enable the start dates ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureRemapDueDates
Set to true to enable the remap due dates ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureRemapClosedDueDate
Set to true to enable the remap closed due date ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureTimeTracking
Set to true to enable the time tracking ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureTags
Set to true to enable the tags ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureTimeEstimates
Set to true to enable the time estimates ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureChecklist
Set to true to enable the checklist ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureCustomFields
Set to true to enable the custom fields ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureRemapDependencies
Set to true to enable the remap dependencies ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureDependencyWarning
Set to true to enable the dependency warning ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeaturePortfolios
Set to true to enable the portfolios ClickUp app.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/create-space.html](https://jsapi.apiary.io/apis/clickup20/reference/0/spaces/create-space.html)

