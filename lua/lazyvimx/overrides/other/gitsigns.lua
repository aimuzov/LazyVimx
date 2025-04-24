return {
	"lewis6991/gitsigns.nvim",
	optional = true,

	opts = {
		current_line_blame = true,

		current_line_blame_opts = { virt_text_pos = "right_align", delay = 300 },
		current_line_blame_formatter = " 󰞗 <author>  <author_time:%R>  <summary> ",

		diff_opts = {
			algorithm = "histogram",
			ignore_whitespace_change = true,
		},

		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "┃" },
		},

		numhl = true,
	},
}
