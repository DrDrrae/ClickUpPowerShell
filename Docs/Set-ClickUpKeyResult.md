---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/goals/edit-key-result.html
schema: 2.0.0
---

# Set-ClickUpKeyResult

## SYNOPSIS
Update a ClickUp key result.

## SYNTAX

```
Set-ClickUpKeyResult [-KeyResultID] <String> [[-Name] <String>] [[-Note] <String>] [[-Owners] <UInt32[]>]
 [[-Type] <String>] [[-StepsStart] <UInt64>] [[-StepsEnd] <UInt64>] [[-StepsCurrent] <UInt64>]
 [[-Unit] <String>] [[-TaskIDs] <String[]>] [[-ListIDs] <UInt32[]>] [<CommonParameters>]
```

## DESCRIPTION
Update a ClickUp key result.

## EXAMPLES

### EXAMPLE 1
```
Set-ClickUpKeyResult -KeyResultID 947d46ed -StepsCurrent 5 -Note 'Target achieved'
Update a ClickUp key result with ID "947d46ed".
```

## PARAMETERS

### -KeyResultID
ClickUp key result ID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
New name of the ClickUp key result.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Note
Note to add to the ClickUp key result.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Owners
The ClickUp team member ID for the owner(s) of the team goal.

```yaml
Type: UInt32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
Type of the key result.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StepsStart
Step number to start at.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -StepsEnd
Number of steps to reach the end.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -StepsCurrent
Current step.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unit
Unit of the key result.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TaskIDs
If specified, will attach the task resource to the goal.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ListIDs
If specified, will attach the list resource to the goal.

```yaml
Type: UInt32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
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
See the link for information.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/goals/edit-key-result.html](https://jsapi.apiary.io/apis/clickup20/reference/0/goals/edit-key-result.html)

