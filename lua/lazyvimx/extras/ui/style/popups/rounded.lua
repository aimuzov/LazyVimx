return {
	{
		"rcarriga/nvim-dap-ui",
		optional = true,
		opts = { floating = { border = "rounded" } },
	},

	{
		"lewis6991/gitsigns.nvim",
		optional = true,
		opts = { preview_config = { border = "rounded" } },
	},

	{
		"williamboman/mason.nvim",
		optional = true,
		opts = { ui = { border = "rounded" } },
	},

	{
		"neovim/nvim-lspconfig",
		optional = true,

		opts = {
			diagnostics = {
				float = { border = "rounded" },
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		optional = true,

		opts = function()
			require("lspconfig.ui.windows").default_options.border = "rounded"
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		optional = true,
		opts = { popup_border_style = "rounded" },
	},

	{
		"folke/noice.nvim",
		optional = true,

		opts = {
			presets = { lsp_doc_border = true },

			lsp = {
				documentation = {
					opts = { win_options = { winhighlight = "NormalFloat:Float" } },
				},
			},
		},
	},

	{
		"folke/snacks.nvim",
		optional = true,

		opts = {
			terminal = {
				win = {
					position = "float",
					border = "rounded",
					width = 0.84,
					height = 0.62,
					zindex = 60,
					backdrop = false,
				},
			},
		},
	},

	{
		"folke/snacks.nvim",
		optional = true,

		opts = function()
			require("snacks").config.style("news", {
				border = "rounded",
				backdrop = false,
				width = 0.84,
				height = 0.62,
			})
		end,
	},
}
