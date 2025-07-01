local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
sbar.add("item", {
	position = "right",
	width = settings.group_paddings,
})

local cal = sbar.add("item", {
	icon = {
		color = colors.white,
		padding_left = 0,
		font = {
			size = 22.0,
		},
	},
	label = {
		color = colors.white,
		padding_right = 8,
		width = 145,
		align = "right",
		font = {
			family = settings.icons,
		},
	},
	position = "right",
	update_freq = 1,
	padding_left = 1,
	padding_right = 1,
	background = {
		color = colors.bg1,
		-- border_color = colors.rainbow[#colors.rainbow],
		border_color = colors.trans_accent,
		border_width = 1,
	},
})

-- Padding item required because of bracket
sbar.add("item", {
	position = "right",
	width = settings.group_paddings,
})

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	cal:set({
		label = os.date("%a %b %d %I:%M:%S %p"),
	})
end)
