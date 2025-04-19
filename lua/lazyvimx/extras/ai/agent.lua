return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false,
		build = "make",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = { file_types = { "markdown", "Avante" } },
				ft = { "markdown", "Avante" },
			},
		},
		opts = {
			provider = "openai",

			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
				timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
				temperature = 0,
				max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
				--reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
			},

			file_selector = { provider = "snacks" },

			windows = {
				sidebar_header = { align = "left", rounded = false },
				input = { prefix = " ", height = 6 },
				edit = { border = "rounded" },
				ask = { start_insert = false },
			},
		},
	},

	{
		"saghen/blink.cmp",
		lazy = true,
		dependencies = { "saghen/blink.compat" },
		opts = {
			sources = {
				default = { "avante_commands", "avante_mentions", "avante_files" },
				compat = {
					"avante_commands",
					"avante_mentions",
					"avante_files",
				},
				-- LSP score_offset is typically 60
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
		ft = function(_, ft)
			vim.list_extend(ft, { "Avante" })
		end,
		opts = function(_, opts)
			opts.file_types = vim.list_extend(opts.file_types or {}, { "Avante" })
		end,
	},

	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			spec = {
				{ "<leader>a", group = "ai" },
			},
		},
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		optional = true,
		opts = { integrations = { avante = true } },
	},
}
