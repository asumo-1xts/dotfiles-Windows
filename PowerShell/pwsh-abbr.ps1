# 主な処理
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

# 処理を呼び出すハンドラー
function Register-AbbrHandler {
    Set-PSReadLineKeyHandler -Key Spacebar -ScriptBlock {
        param($key, $arg)

        # 現在の状態を取得
        $line = $null
        $cursor = 0
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

        # 展開対象があるか確認
        $result = Expand-LastWord $line $cursor

        if ($result) {
            # 単語を削除して展開後の文字を挿入
            # Replace(開始位置, 長さ, 置換文字列)
            $diff = $cursor - $result.Start
            [Microsoft.PowerShell.PSConsoleReadLine]::Replace($result.Start, $diff, $result.Expanded)
        }

        # 最後にスペースを挿入
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert(' ')
    }

    Set-PSReadLineKeyHandler -Key Enter -ScriptBlock {
        param($key, $arg)

        # 現在の状態を取得
        $line = $null
        $cursor = 0
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

        # 展開対象があるか確認
        $result = Expand-LastWord $line $cursor

        if ($result) {
            # 単語を削除して展開後の文字を挿入
            # Replace(開始位置, 長さ, 置換文字列)
            $diff = $cursor - $result.Start
            [Microsoft.PowerShell.PSConsoleReadLine]::Replace($result.Start, $diff, $result.Expanded)
        }

        # 実行
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
    }
}

# 公開関数
function Set-Abbr ($key, $value) { $script:Abbr[$key] = $value }
function Get-Abbr ($key) { return $script:Abbr[$key] }