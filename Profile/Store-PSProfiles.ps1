. $PSScriptRoot\PSProfiles.ps1

Write-Host "Storing to Environment"
foreach ( $Key in $AllProfiles.Keys )
{
    if ((Test-Path -Path $AllProfiles."$Key"))
    {
        Copy-Item -Path $AllProfiles."$Key" -Destination "$($env:OneDrive)\PowerShell\Environment\Profiles\$Key.ps1"
    } 
}

#Archive files
$Files = (Get-ChildItem -Path "$ProfileFolder\*.ps1" | Where-Object { $_.Name -match "V[5|6][a|c]...\.ps1"}).FullName
Compress-Archive -Path $Files -DestinationPath "$ProfileFolder\Archive-$((Get-Date).ToString('yyyyMMdd-HHmmss')).zip"
