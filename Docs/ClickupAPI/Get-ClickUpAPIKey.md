---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: ''
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: Get-ClickUpAPIKey
---

# Get-ClickUpAPIKey

## SYNOPSIS

Retrieves the stored ClickUp API key.

## SYNTAX

### __AllParameterSets

```
Get-ClickUpAPIKey [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The Get-ClickUpAPIKey cmdlet retrieves the SecureString containing the ClickUp API key from the global variable.
If no key is stored, it throws an error.

## EXAMPLES

### EXAMPLE 1

$Key = Get-ClickUpAPIKey

Retrieves the stored API key and assigns it to the $Key variable.

## PARAMETERS

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None. This cmdlet does not accept any input.

{{ Fill in the Description }}

## OUTPUTS

### System.Security.SecureString. Returns the stored API key as a SecureString.

{{ Fill in the Description }}

### System.Security.SecureString

{{ Fill in the Description }}

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

