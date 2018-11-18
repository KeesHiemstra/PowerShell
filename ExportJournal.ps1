#
# Export the Journal table to cvs file
#

if (-not (Test-Path -Path "$($env:OneDrive)\Data"))
{
    Write-Error "The location doesn't exist"
    break
}

[string]$ComputerName = $env:COMPUTERNAME
[string]$SQL = "SELECT [LogID], [DTStart], [Event], [Message] FROM Journal ORDER BY [DTStart], [LogID]"
[string]$CsvFile = "$($env:OneDrive)\Data\Journal.csv"

Push-Location

Import-Module SQLPS -DisableNameChecking

Pop-Location

$Journal = Invoke-Sqlcmd -Query $SQL -ServerInstance $ComputerName -database Joost 

$Journal |
    Export-Csv -Path $CsvFile -NoTypeInformation -UseCulture
