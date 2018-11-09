#region Convert-WindSpeedToBeaufort

<#
.SYNOPSIS
    Convert the wind speed to the Beaufort scale.

.DESCRIPTION
    The description of the wind in written in Dutch.

.EXAMPLE
    Convert-WindSpeedToBeaufort -WindSpeed 7.7
    ---
    Beaufort Name         
    -------- ----         
           4 Matige koelte

.EXAMPLE
    Convert-WindSpeedToBeaufort -WindSpeed 28 -InKmPerHour
    ---
    Beaufort Name         
    -------- ----         
           4 Matige koelte

.INPUTS
    [decimal]

.OUTPUTS
    [Weather.Wind.BeaufortScale]

.NOTES
    === Version history
    Version 1.00 (2018-11-09, Kees Hiemstra)
    - Initial version.

.COMPONENT
    This component is part the weather information.

.ROLE
.FUNCTIONALITY
.LINK
    Read about Beaufort at https://en.wikipedia.org/wiki/Beaufort_scale.
.LINK

#>
function Convert-WindSpeedToBeaufort
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                   SupportsShouldProcess=$false, 
                   PositionalBinding=$true,
                   ConfirmImpact='Low')]
    [OutputType([PSObject])]
    Param
    (
        # Wind speed in [m/s] by default unless the -InKmPerHour parameter is included.
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$true, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNullOrEmpty()]
        [decimal]
        $WindSpeed,

        # Speed in kilometer per hour [km/h]
        [Parameter(ParameterSetName='Parameter Set 1')]
        [AllowNull()]
        [switch]
        $InKmPerHour
    )

    Process
    {
        if ( $InKmPerHour.IsPresent )
        {
            $WindSpeed = $WindSpeed / 3.6
        }

        if ($WindSpeed -le 0.2)      { $Props = [ordered]@{'Beaufort' = [int]0 ;'Name' = "Wind stil" } }
        elseif ($WindSpeed -le 1.5)  { $Props = [ordered]@{'Beaufort' = [int]1 ;'Name' = "Flauw en stil" } }
        elseif ($WindSpeed -le 3.3)  { $Props = [ordered]@{'Beaufort' = [int]2 ;'Name' = "Zwakke wind" } }
        elseif ($WindSpeed -le 5.4)  { $Props = [ordered]@{'Beaufort' = [int]3 ;'Name' = "Lichte koelte" } }
        elseif ($WindSpeed -le 7.9)  { $Props = [ordered]@{'Beaufort' = [int]4 ;'Name' = "Matige koelte" } }
        elseif ($WindSpeed -le 10.7) { $Props = [ordered]@{'Beaufort' = [int]5 ;'Name' = "Vrij krachtige wind" } }
        elseif ($WindSpeed -le 13.8) { $Props = [ordered]@{'Beaufort' = [int]6 ;'Name' = "Krachtige wind" } }
        elseif ($WindSpeed -le 17.1) { $Props = [ordered]@{'Beaufort' = [int]7 ;'Name' = "Harde wind" } }
        elseif ($WindSpeed -le 20.7) { $Props = [ordered]@{'Beaufort' = [int]8 ;'Name' = "Stormachtige wind" } }
        elseif ($WindSpeed -le 24.4) { $Props = [ordered]@{'Beaufort' = [int]9 ;'Name' = "Storm" } }
        elseif ($WindSpeed -le 28.4) { $Props = [ordered]@{'Beaufort' = [int]10;'Name' = "Zware storm" } }
        elseif ($WindSpeed -le 32.6) { $Props = [ordered]@{'Beaufort' = [int]11;'Name' = "Zeer zware storm" } }
        else                         { $Props = [ordered]@{'Beaufort' = [int]12;'Name' = "Orkaan" } }

        $Bft = New-Object -TypeName PSObject -Property $Props
        $Bft.PSObject.TypeNames.Insert(0, 'Weather.Wind.BeaufortScale')
        Write-Output $Bft
    }
}

#endregion
