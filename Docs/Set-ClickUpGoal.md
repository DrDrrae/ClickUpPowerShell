---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/goals/update-goal.html
schema: 2.0.0
---

# Set-ClickUpGoal

## SYNOPSIS
Create a ClickUp team goal.

## SYNTAX

```
Set-ClickUpGoal [-GoalID] <UInt64> [[-Name] <String>] [[-DueDate] <DateTime>] [[-Description] <String>]
 [[-MultipleOwners] <Boolean>] [[-Owners] <UInt32[]>] [[-Color] <String>] [<CommonParameters>]
```

## DESCRIPTION
Create a ClickUp team goal.

## EXAMPLES

### EXAMPLE 1
```
Set-ClickUpGoal -GoalID e53a033c -Name "Updated Goal Name"
Update ClickUp goal with ID "e53a033c" name to "Updated Goal Name".
```

## PARAMETERS

### -GoalID
ClickUp goal ID.

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
New name of the ClickUp team goal being updated.

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

### -DueDate
The due-date of the ClickUp team goal.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Description of the ClickUp team goal.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MultipleOwners
If set to true, allows multiple owners.

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

### -Owners
The ClickUp team member ID for the owner(s) of the team goal.

```yaml
Type: UInt32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Color
The color of the team goal in hex notation.
i.e.
"#32a852"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/goals/update-goal.html](https://jsapi.apiary.io/apis/clickup20/reference/0/goals/update-goal.html)

