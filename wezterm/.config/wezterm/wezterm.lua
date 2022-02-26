local wezterm = require("wezterm")
return {
	font = wezterm.font("SauceCodePro Nerd Font"),
	font_size = 13.0,
	-- font = wezterm.font("JetBrains Mono"),
	color_scheme = "Gruvbox Dark",
	window_background_opacity = 0.8,
	leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 },
	keys = {
		{
			key = "%",
			mods = "LEADER",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ key = '"', mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "n", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "p", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "w", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		{ key = "j", mods = "CTRL", action = { SendKey = { key = "Escape" } } },
	},
}
