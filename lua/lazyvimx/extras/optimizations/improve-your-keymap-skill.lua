return {
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },

		opts = {
			disabled_filetypes = { "neo-tree", "lazy", "mason", "alpha" },
			disable_mouse = false,
			restricted_keys = {
				["j"] = { "x" },
				["k"] = { "x" },
			},
		},
	},

	{
		"m4xshen/hardtime.nvim",
		lazy = false,

		-- https://github.com/m4xshen/hardtime.nvim/issues/31
		keys = {
			-- stylua: ignore start
			{ "<Down>",	"v:count == 0 ? 'gj' : 'j'" },
			{ "<Up>",	"v:count == 0 ? 'gk' : 'k'" },
			--	{ "j",	"v:count == 0 ? 'gj' : 'j'" },
			--	{ "k",	"v:count == 0 ? 'gk' : 'k'" },
			-- stylua: ignore end
		},
	},
}
