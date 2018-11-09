#region Convert-KelvinToCelisus

<#
.SYNOPSIS
    Convert Kelvin [K] to Celsius degrees [°C]

.DESCRIPTION
    Kelvin is the temparature measured of the absolute zero.

.EXAMPLE
    Convert-KelvinToCelsius -Kelvin 294.65
    ---
    21.5

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
#>
function Convert-KelvinToCelsius
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                   SupportsShouldProcess=$false, 
                   PositionalBinding=$true,
                   ConfirmImpact='Low')]
    [OutputType([decimal])]
    Param
    (
        # Tempature in [K] (Kelvin)
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNullOrEmpty()]
        $Kelvin
    )

    Process
    {
        Write-Output ($Kelvin - 273.15)
    }
}

#endregion
