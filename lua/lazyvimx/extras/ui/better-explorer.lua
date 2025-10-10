return {
	"mikavilpas/yazi.nvim",
	desc = "Yazi file manager integration with full-window floating UI and rich file previews",
	event = "VeryLazy",
	dependencies = { "folke/snacks.nvim" },

	opts = {
		floating_window_scaling_factor = 1,
		yazi_floating_window_border = 0,
		highlight_hovered_buffers_in_same_directory = false,
	},
}
