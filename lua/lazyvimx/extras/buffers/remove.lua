local buffer_delete = require("lazyvimx.util.buffer").delete

return {
	"akinsho/bufferline.nvim",
	dependencies = { "echasnovski/mini.bufremove" },
	optional = true,

	opts = {
		options = {
			close_command = buffer_delete,
			right_mouse_command = buffer_delete,
		},
	},
}
