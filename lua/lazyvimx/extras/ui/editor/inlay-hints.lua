return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			diagnostics = {
				underline = false,
				virtual_text = { spacing = 0, prefix = "▎", suffix = " " },
			},
		},
	},

	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		dependencies = {
			"neovim/nvim-lspconfig",
			opts = { diagnostics = { virtual_text = false } },
		},

		opts = {
			signs = {
				left = " ",
				right = "",
				diag = " ",
				arrow = " ",
				up_arrow = " ",
				vertical = " │",
				vertical_end = " ╰",
			},
			options = { virt_texts = { priority = 4100 } },
		},
	},

	{
		"Wansmer/symbol-usage.nvim",
		event = "BufReadPre",
		opts = function(_, opts)
			opts.vt_position = "end_of_line"
			opts.request_pending_text = "symbol"
			opts.hl = { link = "GitSignsCurrentLineBlame" }
			opts.text_format = function(symbol)
				local text = require("symbol-usage.options")._default_opts.text_format(symbol)

				return "󰌹 " .. text
			end
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			current_line_blame_opts = { virt_text_pos = "right_align" },
			current_line_blame_formatter = " 󰞗 <author>  <author_time:%R>  <summary> ",
		},
	},
}
