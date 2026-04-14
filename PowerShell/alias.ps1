# eza
function eza-custom { eza --icons --hyperlink --group-directories-first $args }
Set-Alias -Name eza -Value eza-custom -Option AllScope

# 設定ファイル
function sz { . $PROFILE }
function cz { code $PROFILE }
function cza { code "$HOME\Documents\PowerShell\alias.ps1" }

# Git
function gad { git add $args }
function gbr { git branch $args }
function gbrd { git branch -d $args }
function gbrdo { git branch -d "origin/$args" }
function gcl { git clone $args }
function gch { git checkout $args }
function gchb { git checkout -b $args }
function gcm { git commit -m $args }
function gcma { git commit --amend -m $args }
function gcme { git commit --allow-empty -m $args }
function gin { git init; git branch -m main }
function glg { git log --oneline $args }
function gpl { git pull origin $args }
function gps { git push origin $args }
function grao { git remote add origin $args }
function grro { git remote remove origin $args }
function grh { git reset --hard HEAD^ }
function grho { git reset --hard "origin/$args" }
function grs { git reset --soft HEAD^ }
function gss { git stash -u $args }
function gssa { git stash apply $args }
function gst { git status }
