
#region Get-AutomaticVariables

<#
.SYNOPSIS
    Gets the automatic variables in the current console.

.DESCRIPTION
    The Get-AutomaticVariables cmdlet gets the Windows PowerShell automatic created variables in a console. 

.EXAMPLE
    Get-AutomaticVariables

    Returns the list names of Automatic created variables.

.EXAMPLE
    Get-AutomaticVariables -Include *

    Returns a emply list.

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
        # Specifies an array of items that this cmdlet excludes from the automatic variables. Wildcards are permitted.
        [Parameter(Mandatory=$False,
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [string[]]
        $Include
    )

    Process
    {
        $AllExclude = (@('$'
                         '?',
                         '^', 
                         'args', 
                         'ConfirmPreference', 
                         'ConsoleFileName', 
                         'DebugPreference', 
                         'Error', 
                         'ErrorActionPreference',
                         'ErrorView',
                         'Event',
                         'EventArgs',
                         'EventSubscriber',
                         'ExecutionContext', 
                         'false', 
                         'foreach', 
                         'FormatEnumerationLimit', 
                         'HOME', 
                         'Host', `
                         'InformationPreference',
                         'input',
                         'IsCoreCLR',
                         'IsLinux',
                         'IsMacOS',
                         'IsWindows'
                         'LASTEXITCODE', 
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
                         'PsDebugContext',
                         'PSDefaultParameterValues', 
                         'PSEdition', 
                         'psISE', 
                         'PSItem', 
                         'PSEmailServer', 
                         'PSHOME',
                         'PSSenderInfo',
                         'PSSessionApplicationName', 
                         'PSSessionConfigurationName', 
                         'PSSessionOption', 
                         'PSUICulture', 
                         'PSScriptRoot', 
                         'psUnsupportedConsoleApplications', 
                         'PSVersionTable', 
                         'PWD',
                         'Sender', 
                         'ShellId',
                         'StackTrace',
                         'This', 
                         'true', 
                         'VerbosePreference', 
                         'WarningPreference', 
                         'WhatIfPreference'
                      ))

        [array]$AllInclude = @()
        foreach ($Exclude in $Include)
        {
            foreach ($ExcludeName in ($AllExclude -like $Exclude))
            {
                $AllInclude += @($ExcludeName)
            }
        }

        Write-Output ($AllExclude | Where-Object { $_ -notin $AllInclude })
    }
}

#endregion

