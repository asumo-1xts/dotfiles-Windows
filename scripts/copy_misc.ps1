$copyTargets = @(
    @{
        Source      = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
        Destination = ".\misc\WinTerm.settings.json"
    }
)

foreach ($target in $copyTargets) {
    Copy-Item `
        -Path $target.Source `
        -Destination $target.Destination `
        -Force
}
