if (-not (Test-Path "$HOME\.config")) {
    mkdir "$HOME\.config"
}

cmd /c mklink /D `
    "$HOME\.config\wezterm" `
    "$PWD\.config\wezterm"

cmd /c mklink `
    "$HOME\.config\starship.toml" `
    "$PWD\.config\starship.toml"

# ===========================================================================

if (-not (Test-Path "$HOME\Documents\PowerShell")) {
    mkdir "$HOME\Documents\PowerShell"
}

cmd /c mklink `
    "$HOME\Documents\PowerShell\alias.ps1" `
    "$PWD\PowerShell\alias.ps1"

cmd /c mklink `
    "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" `
    "$PWD\PowerShell\Microsoft.PowerShell_profile.ps1"

## ===========================================================================
## Microsoftアカウントで同期しない場合に使用
#
# cmd /c mklink `
#     "$HOME\AppData\Roaming\Code\User\settings.json" `
#     "$PWD\User\settings.json"
#
# cmd /c mklink `
#     "$HOME\AppData\Roaming\Code\User\keybindings.json" `
#     "$PWD\User\keybindings.json"
## ============================================================================