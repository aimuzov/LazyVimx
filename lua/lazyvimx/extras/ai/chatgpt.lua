return {

	{
		"jackMort/ChatGPT.nvim",

		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"folke/trouble.nvim",
		},

		opts = {
			actions_paths = { string.sub(debug.getinfo(1).source, 2, string.len("/.lua") * -1) .. "-actions.json" },
			chat = {
				loading_text = "",
				question_sign = "",
				border_left_sign = " ",
				border_right_sign = "",
			},
			popup_window = {
				border = {
					text = { top = "  󰫰 󰫵 󰫮 󰬁   󰫴 󰫽 󰬁  " },
				},
			},
			popup_input = {
				prompt = "  ",
				border = {
					text = { top = "" },
				},
			},
		},
	},
}
