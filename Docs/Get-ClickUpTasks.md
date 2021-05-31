---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/tasks/get-tasks.html
https://jsapi.apiary.io/apis/clickup20/reference/0/time-tracking-legacy/get-filtered-team-tasks.html
schema: 2.0.0
---

# Get-ClickUpTasks

## SYNOPSIS
Get all ClickUp tasks under a particular list.

## SYNTAX

### ListID (Default)
```
Get-ClickUpTasks -ListID <String> [-Archived <Boolean>] [-Page <UInt64>] [-OrderBy <String>]
 [-Reverse <Boolean>] [-Subtasks <Boolean>] [-Statuses <String[]>] [-IncludeClosed <Boolean>]
 [-Assignees <String[]>] [-DueDateGreaterThan <DateTime>] [-DueDateLessThan <DateTime>]
 [-DateCreatedGreaterThan <DateTime>] [-DateCreatedLessThan <DateTime>] [-DateUpdatedGreaterThan <DateTime>]
 [-DateUpdatedLessThan <DateTime>] [-CustomFields <Array>] [<CommonParameters>]
```

### TeamID
```
Get-ClickUpTasks -TeamID <String> [-Page <UInt64>] [-OrderBy <String>] [-Reverse <Boolean>]
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
ClickUp list ID.

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
ClickUp team ID.

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
If set to true, will return archived ClickUp tasks in addition to non-archived tasks.

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
The page number to return.

```yaml
Type: UInt64
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -OrderBy
The property of the task to order the returned results by.

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
Set to true to order the list in reverse order.

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
Set to true to return subtasks.

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
Array of ClickUp space IDs to return the tasks of.

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
Array of ClickUp project IDs to return the tasks of.

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
Array of ClickUp list IDs to return the tasks of.

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
Array of the statuses to return the tasks of.

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
Set to true to return closed tasks in addition to open tasks.

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
Return tasks which are assigned to an array of ClickUp team member IDs.

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
Return tasks with due date greater than this date and time.

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
Return tasks with due date less than this date and time.

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
Return tasks with date created greater than this date and time.

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
Return tasks with date created less than this date and time.

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
Return tasks with date updated greater than this date and time.

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
Return tasks with date updated less than this date and time.

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
Return tasks with these custom fields.

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
If you want to reference a task by its custom task ID, this value must be true

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

