
#region Get-AutomaticVariables

<#
.SYNOPSIS
    Gets the automatic variables in the current console.

.DESCRIPTION
    The Get-AutomaticVariables cmdlet gets the Windows PowerShell automatic created variables in a console. 

.EXAMPLE
    Get-AutomaticVariables

    Returns the list names of Automatic created variables.

.INPUTS
    None

.OUTPUTS
    [string[]]

.NOTES
   --- Version history
   Version 1.00 (2018-11-28, Kees Hiemstra)
   - Initial version.

.COMPONENT
.ROLE
.FUNCTIONALITY
.LINK
    Export-SettingsJson

.LINK
    Import-SettingsJson

.LINK
    Convert-VariablesToObject

#>
function Get-AutomaticVariables
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                   SupportsShouldProcess=$False, 
                   PositionalBinding=$False,
                   ConfirmImpact='Low')]
    [Alias('GAV')]
    [OutputType([String[]])]
    Param
    (
    )

    Process
    {
        Write-Output (@('?', 
                        'args', 
                        'ConfirmPreference', 
                        'ConsoleFileName', 
                        'DebugPreference', 
                        'Error', 
                        'ErrorActionPreference',
                        'ErrorView', 
                        'ExecutionContext', 
                        'LASTEXITCODE', 
                        'false', 
                        'foreach', 
                        'FormatEnumerationLimit', 
                        'HOME', 
                        'Host', `
                        'InformationPreference',
                        'input', 
                        'MaximumAliasCount', 
                        'MaximumDriveCount', 
                        'MaximumErrorCount', 
                        'MaximumFunctionCount', 
                        'MaximumHistoryCount', 
                        'MaximumVariableCount', 
                        'Matches', 
                        'MyInvocation',
                        'NestedPromptLevel', 
                        'null', 
                        'OutputEncoding', 
                        'PID', 
                        'profile', 
                        'ProgressPreference', 
                        'PSBoundParameters', 
                        'PSCmdlet', 
                        'PSCommandPath', 
                        'PSCulture', 
                        'PSDefaultParameterValues', 
                        'PSEdition', 
                        'psISE', 
                        'PSItem', 
                        'PSEmailServer', 
                        'PSHOME', 
                        'PSSessionApplicationName', 
                        'PSSessionConfigurationName', 
                        'PSSessionOption', 
                        'PSUICulture', 
                        'PSScriptRoot', 
                        'psUnsupportedConsoleApplications', 
                        'PSVersionTable', 
                        'PWD', 
                        'ShellId',
                        'StackTrace', 
                        'true', 
                        'VerbosePreference', 
                        'WarningPreference', 
                        'WhatIfPreference'
                     ))
    }
}

#endregion

