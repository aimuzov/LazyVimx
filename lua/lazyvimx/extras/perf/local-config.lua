return {
	desc = "Per-project Neovim configuration support via .nvim.lua files",

	"klen/nvim-config-local",
	opts = {
		silent = true,
		config_files = {
			".config/nvim.lua",
			".nvim.lua",
		},
	},
}
