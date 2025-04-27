return {
	{
		"chrisgrieser/nvim-spider",
		desc = "Use the w, e, b motions like a spider. Move by subwords and skip insignificant punctuation",
		dependencies = { "vhyrro/luarocks.nvim" },
		config = true,
	},

	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		opts = { rocks = { "luautf8" } },
	},
}
