
#region Convert-VariablesToObject

<#
.SYNOPSIS
    Create an object with the provided variables.

.DESCRIPTION
    The Convert-VariablesToObject cmdlet creates an object in the pipeline. The properties are the provided variables.

.EXAMPLE
    PS> $Test1 = "Test1"
    PS> $test2 = "Test2"
    PS> $Testing = Get-Process
    PS> Convert-VariablesToObject -Variable Test* | Format-List

    ---
    Test1   : Test1
    test2   : Test2
    Testing : {System.Diagnostics.Process (ApplicationFrameHost), System.Diagnostics.Process (audiodg)...}


.EXAMPLE
    PS> $Test1 = "Test1"
    PS> $test2 = "Test2"
    PS> $Testing = Get-Process
    PS> Convert-VariablesToObject -Variable Test*, WarningPreference -Exclude Testing -Include *Preference -Verbose | Format-List

    ---
    Test1             : Test1
    test2             : Test2
    WarningPreference : Continue

.INPUTS
    None

.OUTPUTS
    [PSObject]

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
    Get-AutomaticVariables

#>
function Convert-VariablesToObject
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                   SupportsShouldProcess=$False, 
                   PositionalBinding=$False,
                   ConfirmImpact='Low')]
    [Alias()]
    [OutputType([PSObject])]
    Param
    (
        # Specifies the name of the variable. Wildcards are permitted.
        [Parameter(Mandatory=$True,
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Variable,

        # Specifies an array of items that this cmdlet excludes from the operation. Wildcards are permitted. Automatic variables
        # are excluded by default.
        [Parameter(Mandatory=$False,
                   Position=1,
                   ParameterSetName='Parameter Set 1')]
        [string[]]
        $Exclude,

        # Specifies an array of items which automatic variables are excluded. Wildcards are permitted.
        [Parameter(Mandatory=$False,
                   Position=1,
                   ParameterSetName='Parameter Set 1')]
        [string[]]
        $Include
    )

    Process
    {
        $AllExclude = Get-AutomaticVariables -Include $Include
        if ($Exclude -ne $null)
        {
            $AllExclude += $Exclude
        }

        $NewObject = New-Object -TypeName PSObject
        foreach ($Setting in $Variable)
        {
            try
            {
                foreach ($SettingName in (Get-Variable -Name $Setting -Exclude $AllExclude -ErrorAction SilentlyContinue).Name)
                {
                    $SettingValue = Get-Variable -Name $SettingName -Exclude $AllExclude -ErrorAction SilentlyContinue -ValueOnly
                    Add-Member -InputObject $NewObject -MemberType NoteProperty -Name $SettingName -Value $SettingValue
                }
            }
            catch
            {
                Add-Member -InputObject $NewObject -MemberType NoteProperty -Name $SettingName -Value $null
            }
        }
        Write-Output $NewObject
    }
}

#endregion

