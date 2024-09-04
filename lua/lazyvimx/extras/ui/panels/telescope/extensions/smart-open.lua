return {
	"nvim-telescope/telescope.nvim",
	optional = true,

	dependencies = {
		"danielfalk/smart-open.nvim",
		dependencies = { "kkharji/sqlite.lua", { "nvim-telescope/telescope-fzf-native.nvim", make = "build" } },
		config = true,
	},

	opts = {
		extensions = {
			smart_open = {
				ignore_patterns = {
					"*.git/*",
					"*.temp/*",
					"index.ts",
					"ns.ts",
				},
				match_algorithm = "fzf",
				cwd_only = true,
			},
		},
	},

	keys = {
		{
			"<leader><space>",
			[[<cmd>Telescope smart_open theme=dropdown previewer=false<cr>]],
			desc = "Find Files (Smart open)",
		},
	},
}
