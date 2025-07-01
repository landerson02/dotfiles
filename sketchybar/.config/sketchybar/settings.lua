local colors = require("colors")
local icons = require("icons")

return {
	paddings = 3,
	group_paddings = 5,
	modes = {
		main = {
			icon = icons.apple,
			color = colors.white,
		},
	},
	bar = {
		height = 31,
		padding = {
			x = 10,
			y = 0,
		},
		background = colors.bar.bg,
	},
	items = {
		height = 26,
		gap = 5,
		padding = {
			right = 16,
			left = 12,
			top = 0,
			bottom = 0,
		},
		default_color = function(workspace)
			-- return colors.rainbow[workspace + 1]
			return colors.white
		end,
		highlight_color = function(workspace)
			return colors.accent
		end,
		colors = {
			background = colors.bg1,
		},
		corner_radius = 9,
	},

	icons = "sketchybar-app-font:Regular:15.0",

	font = {
		text = "FiraCode Nerd Font Mono", -- Used for text
		numbers = "FiraCode Nerd Font Mono", -- Used for numbers
		style_map = {
			["Regular"] = "Regular",
			["Semibold"] = "Medium",
			["Bold"] = "SemiBold",
			["Heavy"] = "Bold",
			["Black"] = "ExtraBold",
		},
	},
}
