# dotfiles-Windows [![The Unlicense](https://img.shields.io/badge/License-The_Unlicense-green.svg)](/LICENSE)

My dotfiles at Windows 11.

## Recovery with `script`

### Clone this repository as `dotfiles`

```powershell
winget install -e --id Git.Git
git clone https://github.com/asumo-1xts/dotfiles-Windows.git dotfiles
cd dotfiles
```

### Install tools and make symbolic-links

```powershell
.\script\winget.ps1
.\script\symbolic_link.ps1
```