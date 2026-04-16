# dotfiles-Windows [![The Unlicense](https://img.shields.io/badge/License-The_Unlicense-green.svg)](/LICENSE)

My dotfiles at Windows 11.

## Recovery with `script`

Run PowerShell as an Administrator:

### Download ZIP as `dotfiles`

```powershell
cd dotfiles
```

### 自己証明書による署名

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

PowerShell $PWD\script\self_signer.ps1 $PROFILE

PowerShell $PWD\script\self_signer.ps1 `
  $HOME\Documents\dotfiles\PowerShell\pwsh_abbr.ps1

PowerShell $PWD\script\self_signer.ps1 `
  $HOME\Documents\dotfiles\PowerShell\pwsh_alias.ps1
```

### Install tools and make symbolic-links

```powershell
.\script\winget.ps1
.\script\symbolic_link.ps1
```