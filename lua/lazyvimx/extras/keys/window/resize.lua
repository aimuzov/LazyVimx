local layout = require("lazyvimx.util.layout")
local step = layout.step
local mode = { "n", "v", "t" }

return {
	"folke/edgy.nvim",
	optional = true,

	opts = function(_, opts)
		opts.keys = {
			["<c-Right>"] = layout.increase_create("width"),
			["<c-Left>"] = layout.decrease_create("width"),
			["<c-Up>"] = layout.increase_create("height"),
			["<c-Down>"] = layout.decrease_create("height"),
		}
	end,

	keys = {
		{ "<c-Up>", "<cmd>resize +" .. step .. "<cr>", mode = mode, desc = "Increase window height" },
		{ "<c-Down>", "<cmd>resize -" .. step .. "<cr>", mode = mode, desc = "Decrease window height" },
		{ "<c-Left>", "<cmd>vertical resize -" .. step .. "<cr>", mode = mode, desc = "Decrease window width" },
		{ "<c-Right>", "<cmd>vertical resize +" .. step .. "<cr>", mode = mode, desc = "Increase window width" },
	},
}
