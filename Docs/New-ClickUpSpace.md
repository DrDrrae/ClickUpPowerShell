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
New-ClickUpSpace [-TeamID] <UInt32> [-Name] <String> [[-Multiple_Assignees] <Boolean>]
 [[-FeatureDueDates] <Boolean>] [[-FeatureStartDate] <Boolean>] [[-FeatureRemapDueDates] <Boolean>]
 [[-FeatureRemapClosedDueDate] <Boolean>] [[-FeatureTimeTracking] <Boolean>] [[-FeatureTags] <Boolean>]
 [[-FeatureTimeEstimates] <Boolean>] [[-FeatureChecklist] <Boolean>] [[-FeatureCustomFields] <Boolean>]
 [[-FeatureRemapdependencies] <Boolean>] [[-FeatureDependencyWarning] <Boolean>]
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
{{ Fill TeamID Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
{{ Fill Name Description }}

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

### -Multiple_Assignees
{{ Fill Multiple_Assignees Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureDueDates
{{ Fill FeatureDueDates Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureStartDate
{{ Fill FeatureStartDate Description }}

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
{{ Fill FeatureRemapDueDates Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureRemapClosedDueDate
{{ Fill FeatureRemapClosedDueDate Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureTimeTracking
{{ Fill FeatureTimeTracking Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureTags
{{ Fill FeatureTags Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureTimeEstimates
{{ Fill FeatureTimeEstimates Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureChecklist
{{ Fill FeatureChecklist Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureCustomFields
{{ Fill FeatureCustomFields Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureRemapdependencies
{{ Fill FeatureRemapdependencies Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeatureDependencyWarning
{{ Fill FeatureDependencyWarning Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### -FeaturePortfolios
{{ Fill FeaturePortfolios Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: True
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

