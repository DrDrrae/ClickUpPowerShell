---
external help file: ClickUpAPI-help.xml
https: //jsapi.apiary.io/apis/clickup20/reference/0/views/create-space-view.html
Module Name: ClickupAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
schema: 2.0.0
---

# New-ClickUpSpaceView

## SYNOPSIS
Create new ClickUp space view.

## SYNTAX

```
New-ClickUpSpaceView [-SpaceID] <UInt32> [-Body] <Hashtable> [<CommonParameters>]
```

## DESCRIPTION
Create new ClickUp space view.

## EXAMPLES

### EXAMPLE 1
```
$body = @{
>> name = "new space view name"
>> type = "list"
>> grouping = @{
>> field = 'status'
>> dir = 1
>> }
>> }
PS C:\> New-ClickUpSpaceView -SpaceID 790 -Body $Body
Create new ClickUp space view for space with ID "790".
```

## PARAMETERS

### -SpaceID
{{ Fill SpaceID Description }}

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

### -Body
{{ Fill Body Description }}

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
See the link for information.

Only webhooks that were created by the authenticated user will be returned on this endpoint.

## RELATED LINKS

[https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
https://jsapi.apiary.io/apis/clickup20/reference/0/views/create-space-view.html](https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
https://jsapi.apiary.io/apis/clickup20/reference/0/views/create-space-view.html)

