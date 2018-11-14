#
# Report current Culture as Mail
#

$Block1 = Get-Culture | Select * | Convert-ObjectToList | ConvertTo-Html -Fragment
$Block2 = Get-Culture | Select -ExpandProperty TextInfo | Convert-ObjectToList | ConvertTo-Html -Fragment
$Block3 = Get-Culture | Select -ExpandProperty NumberFormat | Convert-ObjectToList | ConvertTo-Html -Fragment
$Block4 = Get-Culture | Select -ExpandProperty DateTimeFormat | Convert-ObjectToList | ConvertTo-Html -Fragment

[string]$Html = ConvertTo-Html -Body "$Block1<hr/>$Block2<hr/>$Block3<hr/>$Block4"
Send-MailMessage -Subject "Culture" -SmtpServer smtp.xs4all.nl -From "Joost <CHi@xs4all.nl>" -To CHi@xs4all.nl -BodyAsHtml -Body $Html