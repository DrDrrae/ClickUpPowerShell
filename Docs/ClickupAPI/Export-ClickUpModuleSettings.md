---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: ''
Locale: en-US
Module Name: ClickupAPI
ms.date: 12-08-2025
PlatyPS schema version: 2024-05-01
title: Export-ClickUpModuleSettings
---

# Export-ClickUpModuleSettings

## SYNOPSIS

Exports the ClickUp module settings to a configuration file.

## SYNTAX

### __AllParameterSets

```
Export-ClickUpModuleSettings [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Exports the current ClickUp API key and JSON conversion depth settings to a secure XML configuration file.
The file is saved in the user's profile directory under 'ClickUpAPI'.

## EXAMPLES

### EXAMPLE 1

Export-ClickUpModuleSettings
Exports the current settings to the configuration file.

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

### None. This cmdlet does not return any output.

{{ Fill in the Description }}

## NOTES

The API key is saved as a secure string.

## RELATED LINKS

{{ Fill in the related links here }}

