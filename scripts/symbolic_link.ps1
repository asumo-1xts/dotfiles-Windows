$ErrorActionPreference = "Stop"

# リポジトリのルートディレクトリ
$repo = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path

# シンボリックリンクの設定
$links = @(
    @{
        Source      = Join-Path $repo ".config\starship.toml"
        Destination = "$HOME\.config\starship.toml"
    }
    @{
        Source      = Join-Path $repo "PowerShell\pwsh_alias.ps1"
        Destination = "$HOME\Documents\PowerShell\pwsh_alias.ps1"
    }
    @{
        Source      = Join-Path $repo "PowerShell\pwsh_abbr.ps1"
        Destination = "$HOME\Documents\PowerShell\pwsh_abbr.ps1"
    }
    @{
        Source      = Join-Path $repo "PowerShell\Microsoft.PowerShell_profile.ps1"
        Destination = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    }
    @{
        Source      = Join-Path $repo "Code\User\settings.json"
        Destination = "$HOME\AppData\Roaming\Code\User\settings.json"
    }
    @{
        Source      = Join-Path $repo "Code\User\keybindings.json"
        Destination = "$HOME\AppData\Roaming\Code\User\keybindings.json"
    }
)

# リンク元の存在確認
foreach ($link in $links) {
    if (-not (Test-Path -LiteralPath $link.Source)) {
        throw "Source not found: $($link.Source)"
    }
}

# VS Code の起動確認
if (Get-Process -Name Code -ErrorAction SilentlyContinue) {
    throw "Please close VS Code before running this script."
}

# ディレクトリを再作成する関数
function Reset-Directory {
    param (
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (Test-Path -LiteralPath $Path) {
        Remove-Item -LiteralPath $Path -Recurse -Force
    }

    New-Item -ItemType Directory -Path $Path -Force | Out-Null
}

# シンボリックリンクを作成する関数
function New-ConfigSymlink {
    param (
        [Parameter(Mandatory)]
        [string]$Source,

        [Parameter(Mandatory)]
        [string]$Destination
    )

    New-Item -ItemType SymbolicLink `
        -Path $Destination `
        -Target $Source | Out-Null

    Write-Host "Created: $Destination"
}

# 対象ディレクトリを初期化
$target_dirs = @(
    "$HOME\.config"
    "$HOME\Documents\PowerShell"
    "$HOME\AppData\Roaming\Code\User"
)

foreach ($dir in $target_dirs) {
    Reset-Directory $dir
}

# シンボリックリンクを作成
foreach ($link in $links) {
    New-ConfigSymlink @link
}

Write-Host "Symbolic links created successfully." -ForegroundColor Green
