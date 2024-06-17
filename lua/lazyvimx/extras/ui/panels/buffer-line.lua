return {
	"akinsho/bufferline.nvim",
	lazy = false,

	opts = {
		options = {
			always_show_bufferline = true,
			truncate_names = false,
			tab_size = 16,
			indicator = { icon = "▎", style = "icon" },
			separator_style = "thin",
			left_trunc_marker = "",
			right_trunc_marker = "",
			modified_icon = "",
			close_icon = "󰅖",
			offsets = {
				{ filetype = "neo-tree", separator = false, text = "" },
				{ filetype = "DiffviewFiles", separator = false, text = "" },
			},

			name_formatter = function(buf)
				return buf.name:match("(.+)%..+$")
			end,
		},
	},
}
