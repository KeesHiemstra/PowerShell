. $PSScriptRoot\PSProfiles.ps1

Write-Host "Restore from Environment"
foreach ( $Key in $AllProfiles.Keys )
{
    Write-Host "$Key ==> $($AllProfiles."$Key")"
    if ((Test-Path -Path "$($env:OneDrive)\PowerShell\Environment\Profiles\$Key.ps1") -and
        (Test-Path -Path (Split-Path -Path $AllProfiles."$Key")))
    {
        Copy-Item -Path "$($env:OneDrive)\PowerShell\Environment\Profiles\$Key.ps1" -Destination $AllProfiles."$Key"
    } 
}
