# 展開の処理を行う関数
function Expand-LastWord {
    param($line, $cursor)

    if ([string]::IsNullOrEmpty($line) -or $cursor -eq 0) { return $null }

    # クォート判定
    $inSingle = $false; $inDouble = $false
    for ($i = 0; $i -lt $cursor; $i++) {
        if ($line[$i] -eq "'" -and -not $inDouble) { $inSingle = -not $inSingle }
        elseif ($line[$i] -eq '"' -and -not $inSingle) { $inDouble = -not $inDouble }
    }
    if ($inSingle -or $inDouble) { return $null }

    # 単語の抽出
    $start = $cursor - 1
    while ($start -ge 0 -and -not [char]::IsWhiteSpace($line[$start])) { $start-- }
    $start++

    $word = $line.Substring($start, $cursor - $start)

    # 展開チェック
    if ($script:Abbr.ContainsKey($word)) {
        return @{ Start = $start; Word = $word; Expanded = $script:Abbr[$word] }
    }
    return $null
}

# 略語が行頭にあることを確認して展開の処理を呼び出す関数
function Check-and-Expand {
    param($line, $cursor)

    # 現在の状態を取得
    $line = $null
    $cursor = 0
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    # 行頭に略語があれば展開
    $result = Expand-LastWord $line $cursor

    if ($result ) {
        $beforeMatch = $line.Substring(0, $result.Start)
        if ($beforeMatch -match '^\s*$') {
            # 単語を削除して展開後の文字を挿入
            $diff = $cursor - $result.Start
            [Microsoft.PowerShell.PSConsoleReadLine]::Replace($result.Start, $diff, $result.Expanded)
        }
    }
}

# 処理を呼び出すハンドラー
function Register-AbbrHandler {
    # Spaceキー：展開後してスペースを挿入
    Set-PSReadLineKeyHandler -Key Spacebar -ScriptBlock {
        param($key, $arg)

        Check-and-Expand
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert(' ')
    }

    # Enterキー：展開して実行
    Set-PSReadLineKeyHandler -Key Enter -ScriptBlock {
        param($key, $arg)
        
        Check-and-Expand
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }
}

# 公開関数
function Set-Abbr ($key, $value) { $script:Abbr[$key] = $value }
function Get-Abbr ($key) { return $script:Abbr[$key] }