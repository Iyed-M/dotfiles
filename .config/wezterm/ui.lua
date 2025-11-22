local wezterm = require("wezterm")

local M = {}

M.use_fancy_tab_bar = false
M.hide_tab_bar_if_only_one_tab = true
M.tab_bar_at_bottom = false
M.font = wezterm.font({
	family = "JetBrains Mono",
	-- family = "MonaspiceNe Nerd Font",
	harfbuzz_features = {
		"ss01",
		-- "ss02",
		"ss03",
		"ss05",
		"ss06",
		"ss07",
		"ss08",
		"calt",
		"dlig",
	},
	-- weight = "Medium",
	italic = false,
})

M.font_size = 12.1
M.line_height = 1.4

M.color_schemes = require("themes")
M.color_scheme = "tokyonight"
M.window_background_opacity = 0.6
return M
