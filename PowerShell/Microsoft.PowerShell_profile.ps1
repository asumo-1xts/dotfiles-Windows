Import-Module PSReadline
Invoke-Expression (&starship init powershell)

$script:Abbr = @{}
. "$HOME\Documents\PowerShell\pwsh_abbr.ps1"
. "$HOME\Documents\PowerShell\pwsh_alias.ps1"

Write-Host ""
Write-Host "Now initialized."