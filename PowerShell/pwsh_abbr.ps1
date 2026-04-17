# 展開の処理を行う関数（Substringを極力排除）
function Expand-LastWord {
    param($line, $cursor)

    if ([string]::IsNullOrEmpty($line) -or $cursor -eq 0) { return $null }

    # カーソル直前の空白の位置を探す
    $spaceIndex = $line.LastIndexOf(' ', $cursor - 1)
    $start = $spaceIndex + 1

    # 単語の長さを計算
    $length = $cursor - $start
    if ($length -le 0) { return $null }

    # ここで初めて単語を抽出
    $word = $line.Substring($start, $length)

    # 略語チェック
    if ($script:Abbr.ContainsKey($word)) {
        # 正規表現の引数にインデックスを指定して、行頭か否かを判定
        if ($start -eq 0 -or $line.Substring(0, $start) -match '^\s*$') {
            return @{ `
                Start = $start; `
                Length = $length; `
                Expanded = $script:Abbr[$word] `
            }
        }
    }
    return $null
}

# 略語の展開を実行する関数
function Check-and-Expand {
    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    $result = Expand-LastWord $line $cursor

    if ($result) {
        # Replaceメソッドで、抽出した単語の長さ分を置換
        [Microsoft.PowerShell.PSConsoleReadLine]::Replace( `
            $result.Start, $result.Length, $result.Expanded `
        )
    }
}

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

# 公開関数
function Set-Abbr ($key, $value) { $script:Abbr[$key] = $value }
function Get-Abbr ($key) { return $script:Abbr[$key] }