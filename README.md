# ClickUpPowerShell

This PowerShell module wraps around and eases the use of the [ClickUp API](https://clickup.com/api) in PowerShell scripts and projects.

## Install

```powershell
Install-Module -Name ClickupAPI
```


[https://www.powershellgallery.com/packages/ClickupAPI/](https://www.powershellgallery.com/packages/ClickupAPI/)


## Usage

```powershell
# Imports the ClickUp module.
Import-Module ClickupAPI

# Adds a ClickUp API key to the current session.
Add-ClickUpAPIKey -Key "your_api_key"

# Exports the ClickUp module settings to a configuration file.
Export-ClickUpModuleSettings
```


```powershell
# Imports the ClickUp module.
Import-Module ClickupAPI

# Imports the ClickUp module settings from a configuration file.
Import-ClickUpModuleSettings
```




## Roadmap

### API endpoints

| API Reference | Code | Docs | Error Handling | Tested | Comments |
| ------------- | ---- | ---- | --- | ------ | -------- |
| Attachments   | ✅    | 🟡    |   |         |          |
| Authorization | ✅    | 🟡    |   |        |          |
| Checklists    | ✅    | 🟡    |   |         |          |
| Comments      | ✅    | 🟡    |   |         |          |
| Custom Fields | ✅    | 🟡    |   |        |          |
| Dependencies  | ✅    | 🟡    |   |        |          |
| Folders       | ✅    | 🟡    |   |         |          |
| Goals         | ✅    | 🟡    |   |        |          |
| Guests        | ✅    | 🟡    |   |        | Enterprise only |
| Lists         | ✅    | 🟡    |   |         |          |
| Members       | ✅    | 🟡    |   |        |          |
| Shared Hierarchy | ✅    | 🟡    |   |        |          |
| Spaces        | ✅    | 🟡    |   |         |          |
| Tags          | ✅    | 🟡    |   |        |          |
| Tasks         | ✅    | 🟡    |   |         |          |
| Task Templates |✅    | 🟡    |   |        |          |
| Teams         | ✅    | 🟡    |   |         |          |
| Time Tracking | ✅    | 🟡    |   |        | Partial implementation only. v2.0 will be implemented only. Legacy will not be implemented. |
| Users         | ✅    | 🟡    |   |         | Enterprise only |
| Views         | ✅    | 🟡    |   |        |          |
| Webhooks      | ✅    | 🟡    |   |        |          |

### Other

| API Reference | Code | Docs | Tested | Comments |
| ------------- | ---- | ---- | ------ | -------- |
| Authentication      |      |      |        |          |
| Rate Limit          |      |      |        |          |
| Error Handling      |      |      |        |          |
