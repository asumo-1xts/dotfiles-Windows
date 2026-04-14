cmd /c mklink /D `
    "$HOME\.config" `
    "$PWD\.config"

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