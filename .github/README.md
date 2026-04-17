# dotfiles-Windows [![The Unlicense](https://img.shields.io/badge/License-The_Unlicense-green.svg)](/LICENSE)

My dotfiles at Windows 11.

## Recovery with `script`

Run PowerShell as an Administrator:

### Set policies and move to `dotfiles`

Download ZIP as `dotfiles`:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

cd dotfiles
```

### Install tools and make symbolic-links

```powershell
# ローカルで作成した扱いにしてRemoteSigned字に署名を回避
Get-ChildItem -Path "$PWD\PowerShell" -Recurse | Unblock-File

.\script\winget.ps1
.\script\symbolic_link.ps1

git config --global core.editor "edit"
```