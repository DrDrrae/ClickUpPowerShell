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
Set-ClickUpGoal [-GoalID] <UInt32> [[-Name] <String>] [[-DueDate] <DateTime>] [[-Description] <String>]
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
{{ Fill GoalID Description }}

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

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDate
{{ Fill DueDate Description }}

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
{{ Fill Description Description }}

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
{{ Fill MultipleOwners Description }}

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
{{ Fill Owners Description }}

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
{{ Fill Color Description }}

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

