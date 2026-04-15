Import-Module PSReadline
Set-PSReadLineOption -EditMode Emacs

Invoke-Expression (&starship init powershell)

$script:Abbr = @{}
. "$HOME\Documents\PowerShell\pwsh-abbr.ps1"
Register-AbbrHandler
. "$HOME\Documents\PowerShell\alias.ps1"

"PowerShell is now initialized."