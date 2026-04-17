Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

# ローカルで作成した扱いにしてRemoteSigned時に署名を回避
Get-ChildItem -Path "$PWD\PowerShell" -Recurse | Unblock-File

.\script\winget.ps1
.\script\symbolic_link.ps1

git config --global core.editor "edit"
