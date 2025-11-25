---
document type: cmdlet
external help file: ClickupAPI-Help.xml
HelpUri: ''
Locale: en-US
Module Name: ClickupAPI
ms.date: 11-24-2025
PlatyPS schema version: 2024-05-01
title: Add-ClickUpAPIKey
---

# Add-ClickUpAPIKey

## SYNOPSIS

Adds a ClickUp API key to the current session.

## SYNTAX

### __AllParameterSets

```
Add-ClickUpAPIKey [-APIKey] <string> [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

The Add-ClickUpAPIKey cmdlet securely stores the provided ClickUp API key in a global variable for use by other cmdlets in this module.
The key is converted to a SecureString and stored in a read-only global variable named 'ClickUpAPIKey'.

## EXAMPLES

### EXAMPLE 1

Add-ClickUpAPIKey -APIKey "pk_12345678_ABCDEF1234567890"

Stores the provided API key in the session.

## PARAMETERS

### -APIKey

The ClickUp API key to be stored.
This parameter is mandatory and can be piped.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String. You can pipe a string containing the API key to this cmdlet.

{{ Fill in the Description }}

### System.String

{{ Fill in the Description }}

## OUTPUTS

### None. This cmdlet does not return any output.

{{ Fill in the Description }}

## NOTES

## RELATED LINKS

{{ Fill in the related links here }}

