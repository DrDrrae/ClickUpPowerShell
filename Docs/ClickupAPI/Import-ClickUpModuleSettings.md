---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: ''
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Import-ClickUpModuleSettings
---

# Import-ClickUpModuleSettings

## SYNOPSIS

Imports the ClickUp module settings from a configuration file.

## SYNTAX

### __AllParameterSets

```
Import-ClickUpModuleSettings [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Imports the ClickUp API key and JSON conversion depth settings from the secure XML configuration file.
Sets the global variables 'ClickUpAPIKey' and 'ClickUpJSONConversionDepth'.

## EXAMPLES

### EXAMPLE 1

Import-ClickUpModuleSettings
Imports the settings from the configuration file.

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

If the configuration file is not found, it sets a default JSON conversion depth and prompts the user to run Add-ClickUpAPIKey.

## RELATED LINKS

{{ Fill in the related links here }}

