Import-Module PSReadline
Set-PSReadLineOption -EditMode Emacs

Invoke-Expression (&starship init powershell)

$script:Abbr = @{}
. "$HOME\Documents\PowerShell\pwsh_abbr.ps1"
Register-AbbrHandler
. "$HOME\Documents\PowerShell\pwsh_alias.ps1"
""
"Now initialized."