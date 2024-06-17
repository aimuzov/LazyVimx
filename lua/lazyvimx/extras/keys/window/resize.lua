local layout = require("lazyvimx.util.layout")
local step = layout.step
local mode = { "n", "v", "t" }

return {
	"folke/edgy.nvim",
	optional = true,

	opts = function(_, opts)
		opts.keys = {
			["<c-a-l>"] = layout.increase_create("width"),
			["<c-a-h>"] = layout.decrease_create("width"),
			["<c-a-k>"] = layout.increase_create("height"),
			["<c-a-j>"] = layout.decrease_create("height"),
		}
	end,

	keys = {
		{ "<c-a-k>", "<cmd>resize +" .. step .. "<cr>", mode = mode, desc = "Increase window height" },
		{ "<c-a-j>", "<cmd>resize -" .. step .. "<cr>", mode = mode, desc = "Decrease window height" },
		{ "<c-a-h>", "<cmd>vertical resize -" .. step .. "<cr>", mode = mode, desc = "Decrease window width" },
		{ "<c-a-l>", "<cmd>vertical resize +" .. step .. "<cr>", mode = mode, desc = "Increase window width" },
	},
}
