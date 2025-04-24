return {
	"folke/snacks.nvim",
	opts = function()
		require("snacks.picker.config.layouts").default.layout.backdrop = false
	end,
}
