#region Convert-WindDirectionToDirectionName

<#
.SYNOPSIS
    Convert the wind direction to abbrivation of the wind rose between N .. O .. Z .. W 

.DESCRIPTION
    The abbrivations is in Dutch.
    
.EXAMPLE
    Convert-WindDirectionToDirectionName -WindDirection 90
    ---
    O

.EXAMPLE
    Convert-WindDirectionToDirectionName -WindDirection 105
    ---
    OZO

.INPUTS
    [decimal]

.OUTPUTS
    [string]

.NOTES
    === Version history
    Version 1.00 (2018-11-09, Kees Hiemstra)
    - Initial version.

.COMPONENT
    This component is part the weather information.

.ROLE

.FUNCTIONALITY

#>
function Convert-WindDirectionToDirectionName
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                   SupportsShouldProcess=$false, 
                   PositionalBinding=$true,
                   ConfirmImpact='Low')]
    [OutputType([String])]
    Param
    (
        # Wind direction (0 <= direction < 360)
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNullOrEmpty()]
        [decimal]
        $WindDirection
    )

    Process
    {
        $DirectionName = @("N", "NNO", "NO", "ONO",
            			   "O", "OZO", "ZO", "ZZO",
            			   "Z", "ZZW", "ZW", "WZW",
            			   "W", "WNW", "NW", "NNW"
                          )
        $Direction = [int]([Math]::Round($WindDirection / 22.5))
        if ($Direction -eq 16) { $Direction = 0 }
        Write-Output $DirectionName[$Direction]
    }
}
#endregion
