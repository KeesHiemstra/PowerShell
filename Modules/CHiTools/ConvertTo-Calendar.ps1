<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
function ConvertTo-Calendar
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                   SupportsShouldProcess=$true, 
                   PositionalBinding=$true,
                   ConfirmImpact='Medium')]
    [OutputType([String])]
    Param
    (
        # Convert of the object to list the members
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$true, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        $Input
    )

    Begin
    {
        $DateName = 'Date'
        $ItemName = 'Item'

        $Properties = [ordered]@{'Week' = '';
                                 'Mon' = '';
                                 'Tue' = '';
                                 'Wed' = '';
                                 'Thu' = '';
                                 'Fri' = '';
                                 'Sat' = '';
                                 'Sun' = '';
                                 }
        $Calendar = New-Object -TypeName PSObject -Property $Properties

        $Item = @()
        foreach ( $Property in $Calendar.PSObject.Properties )
        {
            $Item += $Property
        }

        $LastWeekNo = 0
    }
    Process
    {
        $WeekDay = Get-WeekOfYear -Date $_."$DateName" -WeekofYearType Object
        if ($LastWeekNo -eq 0)
        {
            $Calendar.Week = $WeekDay.WeekNo
            $LastWeekNo = $WeekDay.WeekNo
        }
        if ($LastWeekNo -ne $WeekDay.WeekNo)
        {
            Write-Output $Calendar
            $Calendar = New-Object -TypeName PSObject -Property $Properties
            $Calendar.Week = $WeekDay.WeekNo
            $LastWeekNo = $WeekDay.WeekNo
        }
        $Calendar."$($Item[$WeekDay.DayNo].Name)" = $_."$ItemName"
    }
    End
    {
        Write-Output $Calendar
    }
}

@"
Date	Item
2017-07-19 09:40:00	onderzoek  
2017-07-20 09:45:00	ontspanning
2017-07-21 09:50:00	brunch     
2017-07-22 09:50:00	brunch     
2017-07-23 10:00:00	bezoek     
2017-07-24 10:00:00	opmerking  
2017-07-25 10:10:00	koffie     
2017-07-26 10:30:00	actie      
2017-07-28 10:30:00	opmerking  
2017-07-30 10:45:00	opmerking  
2017-08-01 11:00:00	terugkomst 
2017-08-02 11:00:00	sig        
2017-08-03 11:15:00	werk       
2017-08-04 11:15:00	chat       
2017-08-05 11:20:00	hobby      
2017-08-07 11:30:00	sig        
2017-08-09 11:50:00	actie      
2017-08-10 12:00:00	snoep      
2017-08-11 12:00:00	werk       
2017-08-12 12:05:00	werk       
"@ | ConvertFrom-Csv -Delimiter "`t" |
    ConvertTo-Calendar | ft
