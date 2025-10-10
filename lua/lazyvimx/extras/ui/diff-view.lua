local layout = require("lazyvimx.util.layout")

return {
	"sindrets/diffview.nvim",
	desc = "Enhanced diff view with consistent panel sizing for file and history panels",
	opts = {
		file_panel = { win_config = { width = layout.get_size("left") } },
		file_history_panel = { win_config = { height = layout.get_size("bottom") } },
	},
}
