---
external help file: ClickUpAPI-help.xml
Module Name: ClickUpAPI
online version: https://jsapi.apiary.io/apis/clickup20/reference/0/authorization/get-access-token.html
schema: 2.0.0
---

# New-ClickUpAccessToken

## SYNOPSIS
Get a new ClickUp access token.

## SYNTAX

```
New-ClickUpAccessToken [-ClientID] <String> [-ClientSecret] <String> [-Code] <String> [<CommonParameters>]
```

## DESCRIPTION
Get a new ClickUp access token.

## EXAMPLES

### EXAMPLE 1
```
New-ClickUpAccessToken -ClientID "ClientID" -ClientSecret "ClientSecret" -Code "Code"
Get a new ClickUp access token.
```

## PARAMETERS

### -ClientID
ClickUp OAuth app client id.

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

### -ClientSecret
ClickUp OAuth app client secret.

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

### -Code
Code given in redirect url.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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

[https://jsapi.apiary.io/apis/clickup20/reference/0/authorization/get-access-token.html](https://jsapi.apiary.io/apis/clickup20/reference/0/authorization/get-access-token.html)

