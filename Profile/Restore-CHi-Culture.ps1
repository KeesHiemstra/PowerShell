#
# Restore CHi culture
#

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
