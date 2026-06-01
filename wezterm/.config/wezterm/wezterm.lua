local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 10
config.font = wezterm.font("CascadiaCode")
config.color_scheme = "AdventureTime"

config.window_background_opacity = 0.8
config.enable_tab_bar = false

config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 500 }

config.keys = {
	{ key = "5", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "'", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "n", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "p", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = -1 }) },
	{ key = "w", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{ key = "j", mods = "CTRL", action = { SendKey = { key = "Escape" } } },
	-- fzf
	-- { key = "r", mods = "CTRL", action = wezterm.action.SendString("fzf-history-widget") },
}

return config
