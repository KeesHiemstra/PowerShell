#
# Export the Journal table to cvs file
#

if (-not (Test-Path -Path "$($env:OneDrive)\Data"))
{
    Write-Error "The location doesn't exist"
    break
}

# Set culture for proper export for csv
$ThisCulture = Get-Culture
$ThisCulture.TextInfo.ListSeparator = ";"
$ThisCulture.NumberFormat.CurrencyDecimalSeparator = "."
$ThisCulture.NumberFormat.CurrencyGroupSeparator = ","
$ThisCulture.NumberFormat.NumberDecimalSeparator = "."
$ThisCulture.NumberFormat.NumberGroupSeparator = ","
$ThisCulture.NumberFormat.PercentDecimalSeparator = "."
$ThisCulture.NumberFormat.PercentGroupSeparator = ","
$ThisCulture.DateTimeFormat.DateSeparator = "-"
$ThisCulture.DateTimeFormat.FirstDayOfWeek = [System.DayOfWeek]::Monday
$ThisCulture.DateTimeFormat.CalendarWeekRule = [System.Globalization.CalendarWeekRule]::FirstFourDayWeek
$ThisCulture.DateTimeFormat.LongTimePattern = "HH:mm:ss"
$ThisCulture.DateTimeFormat.ShortDatePattern = "yyyy-MM-dd"
$ThisCulture.DateTimeFormat.ShortTimePattern = "HH:mm"
$ThisCulture.DateTimeFormat.TimeSeparator = ":"

$ThisCulture | Set-Culture

[string]$ComputerName = $env:COMPUTERNAME
[string]$SQL = "SELECT [LogID], [DTStart], [Event], [Message] FROM Journal ORDER BY [DTStart], [LogID]"
[string]$CsvFile = "$($env:OneDrive)\Data\Journal.csv"

Push-Location

Import-Module SQLPS -DisableNameChecking

Pop-Location

$Journal = Invoke-Sqlcmd -Query $SQL -ServerInstance $ComputerName -database Joost 

$Journal |
    Export-Csv -Path $CsvFile -NoTypeInformation -UseCulture
