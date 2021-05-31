---
external help file: ClickUpAPI-help.xml
https: //jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-legacy/get-filtered-team-tasks.html
Module Name: ClickupAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-tasks.html
schema: 2.0.0
---

# Get-ClickUpTasks

## SYNOPSIS
Get all ClickUp tasks under a particular list.

## SYNTAX

### ListID (Default)
```
Get-ClickUpTasks -ListID <String> [-Archived <Boolean>] [-Page <UInt32>] [-OrderBy <String>]
 [-Reverse <Boolean>] [-Subtasks <Boolean>] [-Statuses <String[]>] [-IncludeClosed <Boolean>]
 [-Assignees <String[]>] [-DueDateGreaterThan <DateTime>] [-DueDateLessThan <DateTime>]
 [-DateCreatedGreaterThan <DateTime>] [-DateCreatedLessThan <DateTime>] [-DateUpdatedGreaterThan <DateTime>]
 [-DateUpdatedLessThan <DateTime>] [-CustomFields <Array>] [<CommonParameters>]
```

### TeamID
```
Get-ClickUpTasks -TeamID <String> [-Page <UInt32>] [-OrderBy <String>] [-Reverse <Boolean>]
 [-Subtasks <Boolean>] [-SpaceIDs <Int32[]>] [-ProjectIDs <Int32[]>] [-ListIDs <Int32[]>]
 [-Statuses <String[]>] [-IncludeClosed <Boolean>] [-Assignees <String[]>] [-DueDateGreaterThan <DateTime>]
 [-DueDateLessThan <DateTime>] [-DateCreatedGreaterThan <DateTime>] [-DateCreatedLessThan <DateTime>]
 [-DateUpdatedGreaterThan <DateTime>] [-DateUpdatedLessThan <DateTime>] [-CustomFields <Array>]
 [-CustomTaskIDs <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Get all ClickUp tasks under a particular list.

## EXAMPLES

### EXAMPLE 1
```
Get-ClickUpTasks -ListID 11111111
Get all ClickUp task under List with ID "11111111".
```

### EXAMPLE 2
```
Get-ClickUpTasks -ListID 22222222 -Archived $true -Page 1 -OrderBy 'updated' -Statuses 'New','In Progress'
Get all ClickUp task under List with ID "22222222" and various other options.
```

## PARAMETERS

### -ListID
{{ Fill ListID Description }}

```yaml
Type: String
Parameter Sets: ListID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TeamID
{{ Fill TeamID Description }}

```yaml
Type: String
Parameter Sets: TeamID
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Archived
{{ Fill Archived Description }}

```yaml
Type: Boolean
Parameter Sets: ListID
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Page
{{ Fill Page Description }}

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -OrderBy
{{ Fill OrderBy Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Created
Accept pipeline input: False
Accept wildcard characters: False
```

### -Reverse
{{ Fill Reverse Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Subtasks
{{ Fill Subtasks Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SpaceIDs
{{ Fill SpaceIDs Description }}

```yaml
Type: Int32[]
Parameter Sets: TeamID
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProjectIDs
{{ Fill ProjectIDs Description }}

```yaml
Type: Int32[]
Parameter Sets: TeamID
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ListIDs
{{ Fill ListIDs Description }}

```yaml
Type: Int32[]
Parameter Sets: TeamID
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Statuses
{{ Fill Statuses Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeClosed
{{ Fill IncludeClosed Description }}

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Assignees
{{ Fill Assignees Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDateGreaterThan
{{ Fill DueDateGreaterThan Description }}

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DueDateLessThan
{{ Fill DueDateLessThan Description }}

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DateCreatedGreaterThan
{{ Fill DateCreatedGreaterThan Description }}

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DateCreatedLessThan
{{ Fill DateCreatedLessThan Description }}

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DateUpdatedGreaterThan
{{ Fill DateUpdatedGreaterThan Description }}

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DateUpdatedLessThan
{{ Fill DateUpdatedLessThan Description }}

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomFields
{{ Fill CustomFields Description }}

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomTaskIDs
{{ Fill CustomTaskIDs Description }}

```yaml
Type: Boolean
Parameter Sets: TeamID
Aliases:

Required: False
Position: Named
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-tasks.html
https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-legacy/get-filtered-team-tasks.html](https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-tasks.html
https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-legacy/get-filtered-team-tasks.html)

