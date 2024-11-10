local layout = require("lazyvimx.util.layout")

return {
	{
		"folke/edgy.nvim",
		optional = true,

		opts = {
			animate = { enabled = false },
			exit_when_last = true,
			wo = { winfixwidth = false, winbar = false },

			options = {
				left = { size = layout.get_size_create("left") },
				right = { size = layout.get_size_create("right") },
				top = { size = layout.get_size_create("top") },
				bottom = { size = layout.get_size_create("bottom") },
			},

			left = {
				{ ft = "neo-tree", wo = { winhighlight = "Normal:NeoTreeNormal" } },
				{ ft = "dapui_scopes" },
				{ ft = "dapui_breakpoints" },
				{ ft = "dapui_stacks" },
				{ ft = "dapui_watches" },
			},

			right = {
				{ ft = "neotest-summary" },
			},

			bottom = {
				{ ft = "dap-repl" },
			},
		},
	},

	{
		"rcarriga/nvim-dap-ui",
		optional = true,
		opts = {
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					position = "left",
					size = 40,
				},

				{
					elements = { { id = "repl", size = 1 } },
					position = "bottom",
					size = 10,
				},
			},
		},
	},
}
