Import-Module PSReadline
Set-PSReadLineOption -EditMode Emacs

Invoke-Expression (&starship init powershell)
. "$HOME\Documents\PowerShell\alias.ps1"

"PowerShell is now initialized."