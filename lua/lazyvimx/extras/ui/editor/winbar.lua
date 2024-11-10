local disabled_filetypes = {
	"aerial",
	"alpha",
	"dap-repl",
	"dapui_breakpoints",
	"dapui_console",
	"dapui_scopes",
	"dapui_stacks",
	"dapui_watches",
	"DiffviewFiles",
	"fugitive",
	"gitlab",
	"snacks_terminal",
	"neo-tree",
	"neotest-summary",
	"noice",
	"qf",
	"grug-far",
	"trouble",
}

return {
	"nvim-lualine/lualine.nvim",

	opts = function(_, opts)
		local winbar_filetype = {
			{
				"filetype",
				icon_only = true,
				separator = "",
				padding = { left = 3, right = 1 },
				color = { bg = "none" },
			},

			{
				LazyVim.lualine.pretty_path({ length = 6, relative = "root" }),
				color = { bg = "none", gui = "bold" },
			},
		}

		opts.options.disabled_filetypes.winbar = disabled_filetypes
		opts.winbar = { lualine_c = winbar_filetype }
		opts.inactive_winbar = { lualine_c = winbar_filetype }
	end,
}
