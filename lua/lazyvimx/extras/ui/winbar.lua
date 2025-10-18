local disabled_ft = {
	"aerial",
	"Avante",
	"AvanteInput",
	"AvanteSelectedFiles",
	"dap-repl",
	"dapui_breakpoints",
	"dapui_console",
	"dapui_scopes",
	"dapui_stacks",
	"dapui_watches",
	"DiffviewFiles",
	"fugitive",
	"gitlab",
	"grug-far",
	"neo-tree",
	"neotest-summary",
	"noice",
	"qf",
	"snacks_dashboard",
	"snacks_terminal",
	"trouble",
}

return {
	"nvim-lualine/lualine.nvim",
	desc = "Displays a winbar with the name of the current file and an icon",

	opts = function(_, opts)
		local hl_normal = vim.api.nvim_get_hl(0, { name = "Normal" })
		local bg_color = string.format("#%06x", hl_normal.bg)

		local winbar_filetype = {
			lualine_c = {
				{
					"filetype",
					icon_only = true,
					separator = "",
					padding = { left = 3, right = 1 },
					color = { bg = bg_color },
				},

				{
					LazyVim.lualine.pretty_path({ length = 6, relative = "root" }),
					color = { bg = bg_color, gui = "bold" },
				},
			},
		}

		opts.options.disabled_filetypes.winbar = disabled_ft
		opts.winbar = winbar_filetype
		opts.inactive_winbar = winbar_filetype
	end,
}
