local disabled_ft = {
	"aerial",
	"alpha",
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

		opts.options.disabled_filetypes.winbar = disabled_ft
		opts.winbar = { lualine_c = winbar_filetype }
		opts.inactive_winbar = { lualine_c = winbar_filetype }
	end,
}
