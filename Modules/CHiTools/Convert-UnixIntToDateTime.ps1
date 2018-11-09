#region Convert-UnixIntToDateTime

<#
.SYNOPSIS
    Convert Unix time (int) to date/time.

.DESCRIPTION
    Unix date/time is stored the number of seconds since 1970-01-01 as integer. 

.EXAMPLE
    PS> 1540738500 | Convert-UnixIntToDateTime
    ---
    zondag 28 oktober 2018 15:55:00

.EXAMPLE
    PS> Convert-UnixIntToDateTime -UnixInt 1540738500 -UtcTime
    ---
    zondag 28 oktober 2018 14:55:00

.OUTPUTS
    [datetime] DateTime from the Unix time (integer).

.NOTES
    The PowerShell [datetime] variable doesn't contains the time zone.
    This is calculated in the function.

.COMPONENT
    This component belongs the weather information.

.ROLE
.FUNCTIONALITY
.LINK
.LINK
.REMARKS
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
            # Calculate the difference between the Utc time and the local time
            $UtcDiff = Get-Date
            $UtcDiff = $UtcDiff - $UtcDiff.ToUniversalTime()

            $Result = $Result.AddSeconds($UtcDiff.TotalSeconds)
        }

        Write-Output $Result
    }
}

#endregion

