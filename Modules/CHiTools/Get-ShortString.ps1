#region Get-ShortString

<#
.SYNOPSIS
    Shorten string to selected length and replace the last 3 characters with ... if the string is longer.

.DESCRIPTION
    This function shortens the length of the input to given length.  will be returned if the input is null or an empty string, unless the parameter -NoEmpty is given.

    The last 3 characters will be replaced by ... if the string is longer than the given length.

    The length is by default 36.

.EXAMPLE
    PS> Get-ShortString -String 'This is a long string' -Length 21
    ---
    This is a long string

.EXAMPLE
    PS> Get-ShortString -String 'This is a longer string' -Length 21
    ---
    This is a longer s...

.EXAMPLE
    PS> Get-ShortString -String ''
    ---
    <empty>

.EXAMPLE
    PS> Get-ShortString -String '' -EmptyText '...'
    ---
    ...

.INPUTS
    [string[]]

.OUTPUTS
    [string]

.NOTES
   --- Version history
   Version 1.00 (2016-09-01, Kees Hiemstra)
   - Initial version.

#>
function Get-ShortString
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                   SupportsShouldProcess=$false,
                   PositionalBinding=$true,
                   ConfirmImpact='Low')]
    [OutputType([String])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true,
                   ValueFromRemainingArguments=$false,
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [string[]]
        $String,

        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$false,
                   ValueFromPipelineByPropertyName=$false,
                   ValueFromRemainingArguments=$false,
                   Position=1,
                   ParameterSetName='Parameter Set 1')]
        [int]
        $Length = 36,

        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$false,
                   ValueFromPipelineByPropertyName=$false,
                   ValueFromRemainingArguments=$false,
                   Position=2,
                   ParameterSetName='Parameter Set 1')]
        [string]
        $EmptyText = '<empty>',

        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=3,
                   ParameterSetName='Parameter Set 1')]
        [switch]
        $NoEmpty
    )

    Process
    {
        foreach ( $Item in $String )
        {
            $Item = $Item.TrimEnd()

            if ( [string]::IsNullOrWhiteSpace($Item) )
            {
                if ( $NoEmpty.IsPresent )
                {
                    $Output = [string]::Empty
                }
                else
                {
                    $Output = $EmptyText
                }
            }
            elseif ( $Item.Length -le $Length )
            {
                $Output = $Item
            }
            else
            {
                $Output = "$($Item.Substring(0, $Length - 3))..."
            }

            Write-Output $Output
        }#foreach
    }
}

#endregion

