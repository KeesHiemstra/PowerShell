#
# Module manifest for module 'CHiTools'
#
# Version History
# ---------------
# Version 2.02.00 (2018-11-28, Kees Hiemstra)
# - Added Get-AutomaticVariables.
# - Added Convert-VariablesToObject.
#
# Version 2.01.00 (2018-11-09, Kees Hiemstra)
# - Added Convert-UnixIntToDateTime.
# - Added Convert-KelvinToCelisus.
# - Added Convert-MeterPerSecondToKilometerPerHour.
# - Added Convert-WindSpeedToBeaufort.
# - Added Convert-WindDirectionToDirectionName.
# Version 2.00.01 (2018-11-08, Kees Hiemstra)
# - Split the module into separate files.
# Version 2.00.00 (2018-11-07, Kees Hiemstra)
# - Added Get-TypeName.
# - Removed Get-PowerShell.
# - Added Get-ShortString.
# Version 1.02.01 (2018-11-06, Kees Hiemstra)
# - Updates Send-ObjectAsHTMLTableMessage
# Version 1.02.00 (2017-04-24, Kees Hiemstra)
# - Added Write-Speech.
# Version 1.01.01 (2017-03-20, Kees Hiemstra)
# - Updates Send-ObjectAsHTMLTableMessage
# Version 1.01.00 (2017-01-06, Kees Hiemstra)
# - Added Convert-ObjectToList.
# - Added Send-ObjectAsHTMLTableMessage.
# Version 1.00.00 (2015-11-10, Kees Hiemstra)
# - Added Get-Password.
#
# Generated by: Kees Hiemstra
#

@{

# Script module or binary module file associated with this manifest.
# RootModule = 'CHiTools.psm1'

# Version number of this module.
ModuleVersion = '2.01.00'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '83aecc6b-5f10-4a66-8e4c-27e8e3d28635'

# Author of this module
Author = 'Kees Hiemstra'

# Company or vendor of this module
CompanyName = 'CHi'

# Copyright statement for this module
Copyright = '(c) 2018 Kees Hiemstra. All rights reserved.'

# Description of the functionality provided by this module
# Description = ''

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

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
NestedModules = @('CHiTools.psm1'
                  'Convert-KelvinToCelisus.ps1'
                  'Convert-MeterPerSecondToKilometerPerHour.ps1'
                  'Convert-ObjectToList.ps1'
                  'Convert-UnixIntToDateTime.ps1'
                  'Convert-VariablesToObject.ps1'
                  'Convert-WindDirectionToDirectionName.ps1'
                  'Convert-WindSpeedToBeaufort.ps1'
                  'Get-AutomaticVariables.ps1'
                  'Get-ShortString.ps1'
                  'Get-TypeName.ps1'
                  'Get-WeekOfYear.ps1'
                  'Send-ObjectAsHTMLTableMessage.ps1'
                  'Test-IsElevated.ps1'
                  'Write-Speech.ps1'
                 )

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @('Convert-KelvinToCelisus'
                      'Convert-MeterPerSecondToKilometerPerHour'
                      'Convert-ObjectToList'
                      'Convert-UnixIntToDateTime'
                      'Convert-VariablesToObject'
                      'Convert-WindDirectionToDirectionName'
                      'Convert-WindSpeedToBeaufort'
                      'Get-AutomaticVariables'
                      'Get-ShortString'
                      'Get-TypeName'
                      'Get-WeekOfYear'
                      'Send-ObjectAsHTMLTableMessage'
                      'Test-IsElevated'
                      'Write-Speech'
                     )

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @('GT')

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

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
