return {
	"folke/snacks.nvim",
	opts = function()
		require("snacks.picker.config.layouts").default.layout.backdrop = false
		vim.g.snacks_animate = false
	end,
}
