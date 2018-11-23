$ProfileFolder = "$($env:OneDrive)\PowerShell\Environment\Profiles"

$AllProfiles = @{
    'V5aAll' = "C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1"
    'V5aISE' = "C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShellISE_profile.ps1"
    'V5cAll' = "C:\Users\$($env:USERNAME)\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    'V5cISE' = "C:\Users\$($env:USERNAME)\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1"
    'V6cAll' = "C:\Users\$($env:USERNAME)\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
}


