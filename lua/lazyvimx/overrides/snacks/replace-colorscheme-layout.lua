return {
	"folke/snacks.nvim",
	opts = function()
		require("snacks.picker.config.sources").colorschemes.layout = { preset = "vertical" }
	end,
}
