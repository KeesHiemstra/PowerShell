<#
.SYNOPSIS
    Get the week of the year.
.DESCRIPTION
    By default, the week of the year is returned as integer.

    The calculated is as object with these attributes:
    DayNo        : Day of the week, 1 = Monday, 7 = Sunday (integer)
    WeekNo       : Week of the year (integer)
    WeekYear     : Corrected year (integer)
    LongWeekNo   : <corrected year>-<week of the year> (string)
    ShortWeekDay : <week of the year>.<day of the week> (string)
    LongWeekDay  : <corrected year>-<week number>.<day of the week> (string)

            
.EXAMPLE
    PS> Get-WeekOfYear -Date 2017-01-01
    ---
    52
    
    This command gives the number of week of the year of the provided date.
.EXAMPLE
    PS> Get-WeekOfYear -Date 2017-01-01 -WeekofYearType DayNo
    ---
    7
    
    This command gives the number the day in the week of the provided date. 7 represents Sunday.
.EXAMPLE
    PS> Get-WeekOfYear -Date 2017-01-01 -WeekofYearType LongWeekNo
    ---
    2016-52
    
    This command gives the long presented number of week of the year of the provided date.
    The year is a corrected because this is the week number 52 of the previous year.
.EXAMPLE
    PS> Get-WeekOfYear -Date 2017-01-01 -WeekofYearType LongWeekDay
    ---
    2016-52.7
    
    This command gives the long presented number of week of the year of the provided date and includes the day of the week.
    The year is a corrected because this is the week number 52 of the previous year.
.EXAMPLE
    PS> Get-WeekOfYear -Date 2017-01-01 -WeekofYearType ShortWeekDay
    ---
    52.7
    
    This command gives the number of week of the year of the provided date and includes the day of the week.
.EXAMPLE
    PS> Get-WeekOfYear -Date 2017-01-01 -WeekofYearType Object
    ---
    DayNo        : 7
    WeekNo       : 52
    WeekYear     : 2016
    LongWeekNo   : 2016-52
    ShortWeekDay : 52.7
    LongWeekDay  : 2016-52.7

    This command gives all the details as object.
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   [String]

   or

   [Object]
.NOTES
    --- Version history:
    Version 1.01 (2018-11-08, Kees Hiemstra)
    - Added TypeName when the output is an object.
    Version 1.00 (2017-08-12, Kees Hiemstra)
    - Initial version.

.COMPONENT

.ROLE

.FUNCTIONALITY

.LINK

.LINK

#>
function Get-WeekOfYear
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                   SupportsShouldProcess=$true, 
                   PositionalBinding=$false,
                   ConfirmImpact='Low')]
    [OutputType([String])]
    Param
    (
        # Specifies a date and time. By default, Get-Date gets the current system date and time.
        [Parameter(Mandatory=$false,
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true,
                   ValueFromRemainingArguments=$false,
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [datetime]
        $Date = 0,

        # Specifies the type of the week of the year. By default, the type is the week number.
        [Parameter(Mandatory=$false,
                   ValueFromPipeline=$false,
                   ValueFromPipelineByPropertyName=$false,
                   ValueFromRemainingArguments=$false,
                   Position=1,
                   ParameterSetName='Parameter Set 1')]
        [ValidateSet('DayNo', 'WeekNo', 'LongWeekNo', 'ShortWeekDay', 'LongWeekDay', 'Object')]
        $WeekofYearType = 'WeekNo'
    )

    Process
    {
        if ($Date -eq 0)
        {
            $Date = (Get-Date)
        }

        $Properties = [ordered]@{'DayNo'        = 0;
                                 'WeekNo'       = 0;
                                 'WeekYear'     = 0
                                 'LongWeekNo'   = ''
                                 'ShortWeekDay' = ''
                                 'LongWeekDay'  = ''
                                 }
        $WeekDay = New-Object -TypeName PSObject -Property $Properties
        $WeekDay.PSObject.TypeNames.Insert(0, 'CHi.DateTime.WeekDay')

        $WeekDay.DayNo = [int]([System.Globalization.CultureInfo]::InvariantCulture.Calendar.GetDayOfWeek($Date))
        if ([System.Globalization.CultureInfo]::InvariantCulture.Calendar.GetDayOfWeek($Date) -eq [System.DayOfWeek]::Sunday)
        {
            $WeekDay.DayNo = 7
        }

        $WeekDay.WeekNo = [System.Globalization.CultureInfo]::InvariantCulture.Calendar.GetWeekOfYear($Date, [System.Globalization.CalendarWeekRule]::FirstFourDayWeek, [System.DayOfWeek]::Monday)

        $WeekDay.WeekYear = $Date.Year
        if ($Date.DayOfYear -le 4 -and $WeekDay.WeekNo -gt 1)
        {
            $WeekDay.WeekYear--
        }

        $WeekDay.LongWeekNo   = "$($WeekDay.WeekYear)-$($WeekDay.WeekNo)"
        $WeekDay.ShortWeekDay = "$($WeekDay.WeekNo).$($WeekDay.DayNo)"
        $WeekDay.LongWeekDay  = "$($WeekDay.WeekYear)-$($WeekDay.WeekNo).$($WeekDay.DayNo)"

        switch ($WeekofYearType)
        {
            'DayNo'        { Write-Output $WeekDay.DayNo }
            'WeekNo'       { Write-Output $WeekDay.WeekNo }
            'LongWeekNo'   { Write-Output $WeekDay.LongWeekNo }
            'ShortWeekDay' { Write-Output $WeekDay.ShortWeekDay }
            'LongWeekDay'  { Write-Output $WeekDay.LongWeekDay }
            'Object'       { Write-Output $WeekDay }
        }

    }
}
