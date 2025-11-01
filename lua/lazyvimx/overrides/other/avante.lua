return {
	"yetone/avante.nvim",
	optional = true,

	opts = {
		file_selector = { provider = "snacks" },
		hints = { enabled = false },
		windows = {
			sidebar_header = { align = "left", rounded = false },
			input = { prefix = " ", height = 6 },
			edit = { border = "rounded" },
			ask = { start_insert = false },
		},
	},

	specs = {
		{
			"saghen/blink.cmp",
			optional = true,
			dependencies = { "saghen/blink.compat" },

			opts = {
				sources = {
					default = { "avante_commands", "avante_mentions", "avante_files" },
					compat = { "avante_commands", "avante_mentions", "avante_files" },

					providers = {
						avante_commands = {
							name = "avante_commands",
							module = "blink.compat.source",
							score_offset = 90,
							opts = {},
						},

						avante_files = {
							name = "avante_files",
							module = "blink.compat.source",
							score_offset = 100,
							opts = {},
						},

						avante_mentions = {
							name = "avante_mentions",
							module = "blink.compat.source",
							score_offset = 1000,
							opts = {},
						},
					},
				},
			},
		},

		{
			"MeanderingProgrammer/render-markdown.nvim",
			optional = true,
			ft = { "Avante" },
			opts = { file_types = { "Avante" } },
		},

		{
			"folke/which-key.nvim",
			optional = true,
			opts = { spec = { { "<leader>a", group = "+ai" } } },
		},

		{
			"catppuccin/nvim",
			optional = true,
			opts = { integrations = { avante = true } },
		},
	},
}
