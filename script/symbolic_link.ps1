# ターミナルの装飾
$target_dir = "$HOME\.config"
if (!(Test-Path $target_dir)) { mkdir $target_dir }
cmd /c mklink $target_dir\starship.toml $PWD\.config\starship.toml

# PowerShellとエイリアスの設定
$target_dir = "$HOME\Documents\PowerShell"
if (!(Test-Path $target_dir)) { mkdir $target_dir }
cmd /c mklink $target_dir\pwsh_alias.ps1 $PWD\PowerShell\pwsh_alias.ps1
cmd /c mklink $target_dir\pwsh_abbr.ps1 $PWD\PowerShell\pwsh_abbr.ps1
cmd /c mklink $target_dir\Microsoft.PowerShell_profile.ps1 `
  $PWD\PowerShell\Microsoft.PowerShell_profile.ps1

# VScodeの環境設定
$target_dir = "$HOME\AppData\Roaming\Code\User"
if (!(Test-Path $target_dir)) { mkdir $target_dir }
cmd /c mklink $target_dir\settings.json $PWD\Code\User\settings.json
cmd /c mklink $target_dir\keybindings.json $PWD\Code\User\keybindings.json