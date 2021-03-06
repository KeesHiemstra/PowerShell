﻿#region Convert-UnixIntToDateTime

<#
.SYNOPSIS
    Convert Unix time (int) to date/time.

.DESCRIPTION
    Unix date/time is stored the number of seconds since 1970-01-01 as integer. 

.EXAMPLE
    1540738500 | Convert-UnixIntToDateTime
    ---
    zondag 28 oktober 2018 15:55:00

.EXAMPLE
    Convert-UnixIntToDateTime -UnixInt 1540738500 -UtcTime
    ---
    zondag 28 oktober 2018 14:55:00

.OUTPUTS
    [datetime] DateTime from the Unix time (integer).

.NOTES
    The PowerShell [datetime] variable doesn't contains the time zone.
    This is calculated in the function.

    === Version history
    Version 1.00 (2018-11-09, Kees Hiemstra)
    - Initial version.

.COMPONENT
    This component is part the weather information.

.ROLE
.FUNCTIONALITY
.LINK
    Read about Unix time at https://en.wikipedia.org/wiki/Unix_time
.LINK
#>
function Convert-UnixIntToDateTime
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                   SupportsShouldProcess=$false, 
                   PositionalBinding=$true,
                   ConfirmImpact='Low')]
    [OutputType([DateTime])]
    Param
    (
        # Unix date/time [int] to convert
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNullOrEmpty()]
        $UnixInt,

        # Use this switch to keep it the original Utc timezone
        [Parameter(Mandatory=$false, 
                   ParameterSetName='Parameter Set 1')]
        [switch]
        $UtcTime
    )

    Process
    {
        # Use Hour, Minute, Second and Milliesecond to force it midnight
        $Result = (Get-Date -Year 1970 -Month 1 -day 1 -Hour 0 -Minute 0 -Second 0 -Millisecond 0).Addseconds($UnixInt)
        
        if (-not $UtcTime)
        {
            $Result = $Result.AddMinutes((Get-TimeZone).BaseUtcOffset.TotalMinutes)
        }

        Write-Output $Result
    }
}

#endregion

