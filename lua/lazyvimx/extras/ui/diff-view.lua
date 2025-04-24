local layout = require("lazyvimx.util.layout")

return {
	"sindrets/diffview.nvim",
	opts = {
		file_panel = { win_config = { width = layout.get_size("left") } },
		file_history_panel = { win_config = { height = layout.get_size("bottom") } },
	},
}
