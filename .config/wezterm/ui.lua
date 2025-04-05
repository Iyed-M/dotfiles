local wezterm = require("wezterm")

local M = {}

M.use_fancy_tab_bar = false
M.hide_tab_bar_if_only_one_tab = true
M.tab_bar_at_bottom = false

M.font = wezterm.font({
	family = "Iosevka",
	harfbuzz_features = {
		-- "ss01",
		-- "ss02",
		-- "ss03",
		-- "ss05",
		-- "ss06",
		-- "ss07",
		-- "ss08",
		"calt",
		"dlig",
	},
	weight = "Regular",
	italic = false,
})

M.font_size = 16
M.line_height = 1

M.color_schemes = require("themes")
M.color_scheme = "tokyonight"
M.window_background_opacity = 0.6
return M
