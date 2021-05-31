---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
https://jsapi.apiary.io/apis/clickup20/reference/0/views/update-view.html
schema: 2.0.0
---

# Set-ClickUpView

## SYNOPSIS
Update ClickUp view.

## SYNTAX

```
Set-ClickUpView [-ViewID] <String> [-Body] <Hashtable> [<CommonParameters>]
```

## DESCRIPTION
Update ClickUp view.

## EXAMPLES

### EXAMPLE 1
```
$body = @{
>> name = "new list name"
>> type = "list"
>> grouping = @{
>> field = 'status'
>> dir = 1
>> }
>> }
PS C:\> Set-ClickUpView -ViewID 3c -Body $Body
Update aClickUp view with ID "124".
```

## PARAMETERS

### -ViewID
{{ Fill ViewID Description }}

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
https://jsapi.apiary.io/apis/clickup20/reference/0/views/update-view.html](https://jsapi.apiary.io/apis/clickup20/reference/0/views.html
https://jsapi.apiary.io/apis/clickup20/reference/0/views/update-view.html)

