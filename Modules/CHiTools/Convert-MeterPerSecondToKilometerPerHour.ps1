#region Convert-MeterPerSecondToKilometerPerHour

<#
.SYNOPSIS
    Convert speed in meter per second [m/s] to kilometer per hour [km/h].

.DESCRIPTION

.EXAMPLE
    PS> Convert-MeterPerSecondToKilometerPerHour -MeterPerSecond 7.7
    ---
    27.72

.OUTPUTS
    [decimal]

.NOTES
    === Version history
    Version 1.00 (2018-11-09, Kees Hiemstra)
    - Initial version

.COMPONENT
    This component is part the weather information.

.ROLE
.FUNCTIONALITY
.LINK
.LINK
.REMARKS
#>
function Convert-MeterPerSecondToKilometerPerHour
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                   SupportsShouldProcess=$false, 
                   PositionalBinding=$true,
                   ConfirmImpact='Low')]
    [OutputType([decimal])]
    Param
    (
        # Wind speed in [m/s]
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNullOrEmpty()]
        $MeterPerSecond
    )

    Process
    {
        Write-Output ($MeterPerSecond * 3.6)
    }
}

#endregion
