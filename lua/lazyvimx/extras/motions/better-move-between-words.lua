return {
	{
		"chrisgrieser/nvim-spider",
		desc = "Use the w, e, b motions like a spider. Move by subwords and skip insignificant punctuation",
		dependencies = { "vhyrro/luarocks.nvim" },
		vscode = true,
		config = true,
	},

	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		vscode = true,
		opts = { rocks = { "luautf8" } },
	},
}
