---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/goals/create-key-result.html
schema: 2.0.0
---

# New-ClickUpKeyResult

## SYNOPSIS
Create a ClickUp key result.

## SYNTAX

```
New-ClickUpKeyResult [-GoalID] <String> [-Name] <String> [[-Owners] <UInt32[]>] [[-Type] <String>]
 [[-StepsStart] <UInt32>] [[-StepsEnd] <UInt32>] [[-Unit] <String>] [[-TaskIDs] <String[]>]
 [[-ListIDs] <UInt32[]>] [<CommonParameters>]
```

## DESCRIPTION
Create a ClickUp key result.

## EXAMPLES

### EXAMPLE 1
```
New-ClickUpKeyResult -GoalID e53a033c -Name 'New Key Result Name' -Owners 183 -Type number -StepsStart 0 -StepsEnd 10 -Unit km
Create a new ClickUp key result for goal with ID "e53a033c".
```

## PARAMETERS

### -GoalID
{{ Fill GoalID Description }}

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

### -Owners
{{ Fill Owners Description }}

```yaml
Type: UInt32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
{{ Fill Type Description }}

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

### -StepsStart
{{ Fill StepsStart Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -StepsEnd
{{ Fill StepsEnd Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Unit
{{ Fill Unit Description }}

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

### -TaskIDs
{{ Fill TaskIDs Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ListIDs
{{ Fill ListIDs Description }}

```yaml
Type: UInt32[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/goals/create-key-result.html](https://jsapi.apiary.io/apis/clickup20/reference/0/goals/create-key-result.html)

