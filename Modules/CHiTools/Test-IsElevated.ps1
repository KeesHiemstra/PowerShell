#region Test-IsElevated

<#
.SYNOPSIS
    Test if the current process runs under elevated privileges.

.DESCRIPTION
    Some tasks need to be performed whilst the process runs under elevated privileges. This cmdlet returns true if the current process is running under elevated privileges.

.EXAMPLE
    PS> Test-IsElevated
    ---
    >> When the process is started normally, the cmdlet will return false.
    False

    >> When the process is running with elevated privileges, the cmdlet will return true.
    True

.EXAMPLE
    Test-IsElevated -Verbose

    >> When the process is started normally, the cmdlet will return false.
    VERBOSE: The process is running under normal privileges
    False

    >> When the process is running with elevated privileges, the cmdlet will return true.
    VERBOSE: The process is running under elevated privileges
    True

.INPUTS
    There are no inputs.

.OUTPUTS
    [bool]

.NOTES
    --- Version history
    Version 1.00 (2016-01-31, Kees Hiemstra)
    - Inital version.

.LINK

.LINK

#>
function Test-IsElevated
{
    [CmdletBinding(SupportsShouldProcess=$false, 
                   PositionalBinding=$false,
                   ConfirmImpact='Low')]
    [OutputType([bool])]
    Param
    (
    )

    Process
    {
        $WindowsIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
        if ($WindowsIdentity.Owner -ne $WindowsIdentity.User)
        {
            Write-Verbose "The process is running under elevated privileges"
            Write-Output $true
        }
        else
        {
            Write-Verbose "The process is running under normal privileges"
            Write-Output $false
        }
    }
}

#endregion


