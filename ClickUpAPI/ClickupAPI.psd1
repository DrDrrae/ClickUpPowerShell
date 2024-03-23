#
# Module manifest for module 'ClickupAPI'
#
# Generated by: Andrea Mastellone
#
# Generated on: 2021-05-05
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule           = '.\ClickUpAPI.psm1'

    # Version number of this module.
    ModuleVersion        = '0.1.1.1'

    # Supported PSEditions
    CompatiblePSEditions = 'Desktop', 'Core'

    # ID used to uniquely identify this module
    GUID                 = '8511f61f-0ff9-4c6d-8903-5ca262e1c120'

    # Author of this module
    Author               = 'Andrea Mastellone'

    # Company or vendor of this module
    CompanyName          = 'Andrea Mastellone'

    # Copyright statement for this module
    Copyright            = '(c) 2021 Andrea Mastellone. All rights reserved.'

    # Description of the functionality provided by this module
    Description          = 'ClickUp API Wrapper'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion    = '6.0.0'

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    NestedModules        = @(
        'Private/ClickUpAPI.ps1'
        'Private/DateConversion.ps1',
        'Private/New-HTTPQueryString.ps1',
        'Private/SecureAPIKey.ps1',
        'Public/APIKey.ps1',
        'Public/Attachments.ps1',
        'Public/Authorization.ps1',
        'Public/Checklists.ps1',
        'Public/Comments.ps1',
        'Public/CustomFields.ps1',
        'Public/Dependencies.ps1',
        'Public/Goals.ps1',
        'Public/Guests.ps1',
        'Public/Folders.ps1',
        'Public/Lists.ps1',
        'Public/Members.ps1',
        'Public/ModuleSettings.ps1'
        'Public/SharedHierarchy.ps1',
        'Public/Spaces.ps1',
        'Public/Tags.ps1',
        'Public/Tasks.ps1',
        'Public/TaskTemplates.ps1',
        'Public/Team.ps1',
        'Public/TimeTracking.ps1',
        'Public/Users.ps1',
        'Public/Views.ps1',
        'Public/Webhooks.ps1'
    )

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport    = @(
        'Add-ClickUpAPIKey',
        'Remove-ClickUpAPIKey',
        'Get-ClickUpAPIKey',

        'Export-ClickUpModuleSettings',
        'Import-ClickUpModuleSettings',

        'Get-ClickUpAuthorizedUser',
        'Get-ClickUpAuthorizedTeams',
        'New-ClickUpAccessToken',

        'New-ClickUpTaskAttachment',

        'New-ClickUpChecklist',
        'Set-ClickUpChecklist',
        'Remove-ClickUpChecklist',
        'New-ClickUpChecklistItem',
        'Set-ClickUpChecklistItem',
        'Remove-ClickUpCheckListItem',

        'Get-ClickUpCustomFields',
        'Set-ClickUpCustomFieldValue',
        'Remove-ClickUpCustomFieldValue',

        'Add-ClickUpDependency',
        'Remove-ClickUpDependency ',
        'Add-ClickUpTaskLink',
        'Remove-ClickUpTaskLink',

        'Get-ClickUpFolders',
        'Get-ClickUpFolder',
        'New-ClickUpFolder',
        'Set-ClickUpFolder',
        'Remove-ClickUpFolder',

        'Get-ClickUpGoals',
        'Get-ClickUpGoal',
        'New-ClickUpGoal',
        'Set-ClickUpGoal',
        'Remove-ClickUpGoal',
        'New-ClickUpKeyResult',
        'Set-ClickUpKeyResult',
        'Remove-ClickUpKeyResult',

        'Get-ClickUpGuest',
        'Add-ClickUpGuest',
        'Set-ClickUpGuest',
        'Add-ClickUpGuestToTask',
        'Add-ClickUpGuestToTask',
        'Add-ClickUpGuestToFolder',
        'Remove-ClickUpGuest',
        'Remove-ClickUpGuestFromTask',
        'Remove-ClickUpGuestFromList',
        'Remove-ClickUpGuestFromFolder',

        'Get-ClickUpSharedHierarchy',

        'Get-ClickUpLists',
        'Get-ClickUpList',
        'New-ClickUpList',
        'Set-ClickUpList',
        'Remove-ClickUpList',
        'Add-ClickUpTaskToList',
        'Remove-ClickUpTaskFromList',

        'Get-ClickUpTags',
        'New-ClickUpTag',
        'Set-ClickUpTag',
        'Remove-ClickUpTag',
        'Add-ClickUpTagToTask',
        'Remove-ClickUpTagFromTask',

        'Get-ClickUpTaskMembers',
        'Get-ClickUpListMembers',

        'Get-ClickUpTaskComments',
        'Get-ClickUpChatViewComments',
        'Get-ClickUpListComments',
        'Set-ClickUpListComments',
        'Remove-ClickUpListComments',
        'New-ClickUpTaskComment',
        'New-ClickUpChatViewComment',
        'New-ClickUpListComment',

        'Get-ClickUpTasks',
        'Get-ClickUpTask',
        'Get-ClickUpTaskTimeInStatus',
        'Get-ClickUpTaskTimeInStatusBulk',
        'New-ClickUpTask',
        'Remove-ClickUpTask',
        'Set-ClickUpTask',

        'Get-ClickUpTaskTemplates',
        'New-ClickUpTaskFromTemplate '

        'Get-ClickUpTimeEntries',
        'Get-ClickUpTimeEntry',
        'Get-ClickUpTimeEntryHistory',
        'Get-ClickUpRunningTimeEntry ',
        'Get-ClickUpTimeEntryTags',
        'New-ClickUpTimeEntry',
        'Add-ClickUpTimeEntryTags',
        'Set-ClickUpTimeEntryTags',
        'Start-ClickUpTimeEntry',
        'Stop-ClickUpTimeEntry',
        'Set-ClickUpTimeEntry',
        'Remove-ClickUpTimeEntry',

        'Get-ClickUpSpaces',
        'Get-ClickUpSpace',
        'New-ClickUpSpace',
        'Remove-ClickUpSpace',
        'Set-ClickUpSpace',

        'Get-ClickUpTeam',

        'Get-ClickUpUser',

        'Get-ClickUpView',
        'Get-ClickUpTeamViews',
        'Get-ClickUpSpaceViews',
        'Get-ClickUpFolderViews',
        'Get-ClickUpListViews',
        'Get-ClickUpViewTasks',
        'New-ClickUpTeamView',
        'New-ClickUpSpaceView',
        'New-ClickUpFolderView',
        'New-ClickUpListView',
        'Set-ClickUpView',
        'Remove-ClickUpView',

        'Get-ClickUpWebhooks',
        'New-ClickUpWebhook',
        'Set-ClickUpWebhook',
        'Remove-ClickUpWebhook'
    )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport      = @()

    # Variables to export from this module
    VariablesToExport    = @()

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport      = @()

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData          = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            # Tags = @()

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            # ProjectUri = ''

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}

