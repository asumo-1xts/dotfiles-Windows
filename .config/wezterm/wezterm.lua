local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.window_decorations = "RESIZE"
config.default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe', '-l' }
config.initial_cols = 120
config.initial_rows = 28
config.font = wezterm.font("Moralerspace Neon HW")
config.font_size = 11
config.color_scheme = "iceberg-dark"
config.window_background_opacity = 0.8

config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables

return config
