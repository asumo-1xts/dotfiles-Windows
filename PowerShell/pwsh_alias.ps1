# eza（二段階に分けて元の`eza`を上書き）
function eza-custom { `
  eza --icons --hyperlink --group-directories-first $args `
}
Set-Alias -Name eza -Value eza-custom -Option AllScope

# 設定ファイル
function sz { . $PROFILE }
function cz { code $PROFILE }
function cza { code "$HOME\Documents\PowerShell\pwsh_alias.ps1" }

# Git
Set-Abbr "gad" "git add"
Set-Abbr "gbr" "git branch"
Set-Abbr "gbrd" "git branch -d"
Set-Abbr "gbrdo" "git branch -d origin/"
Set-Abbr "gcl" "git clone"
Set-Abbr "gch" "git checkout"
Set-Abbr "gchb" "git checkout -b"
Set-Abbr "gcm" "git commit -m"
Set-Abbr "gcma" "git commit --amend -m"
Set-Abbr "gcme" "git commit --allow-empty -m"
Set-Abbr "gin" "git init; git branch -m main"
Set-Abbr "glg" "git log --oneline"
Set-Abbr "gpl" "git pull origin"
Set-Abbr "gps" "git push origin"
Set-Abbr "grao" "git remote add origin"
Set-Abbr "grro" "git remote remove origin"
Set-Abbr "grh" "git reset --hard HEAD^"
Set-Abbr "grho" "git reset --hard origin/"
Set-Abbr "grs" "git reset --soft HEAD^"
Set-Abbr "gss" "git stash -u"
Set-Abbr "gssa" "git stash apply"
Set-Abbr "gst" "git status"