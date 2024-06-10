return {
	"jackMort/ChatGPT.nvim",

	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"folke/trouble.nvim",
		{
			"folke/which-key.nvim",
			opts = { defaults = { ["<leader>h"] = { name = "+chatgpt" } } },
		},
	},

	opts = {
		actions_paths = { string.sub(debug.getinfo(1).source, 2, string.len("/init.lua") * -1) .. "actions.json" },
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

	keys = {
		{ "<leader>ac", "<cmd>ChatGPT<cr>", desc = "ChatGPT", mode = { "n", "v" } },
		{ "<leader>ae", "<cmd>ChatGPTEditWithInstruction<cr>", desc = "Edit with instruction", mode = { "n", "v" } },
		{ "<leader>ag", "<cmd>ChatGPTRun grammar_correction<cr>", desc = "Grammar Correction", mode = { "n", "v" } },
		{ "<leader>at", "<cmd>ChatGPTRun translate<cr>", desc = "Translate", mode = { "n", "v" } },
		{ "<leader>ak", "<cmd>ChatGPTRun keywords<cr>", desc = "Keywords", mode = { "n", "v" } },
		{ "<leader>ad", "<cmd>ChatGPTRun docstring<cr>", desc = "Docstring", mode = { "n", "v" } },
		{ "<leader>aa", "<cmd>ChatGPTRun add_tests<cr>", desc = "Add Tests", mode = { "n", "v" } },
		{ "<leader>ao", "<cmd>ChatGPTRun optimize_code<cr>", desc = "Optimize Code", mode = { "n", "v" } },
		{ "<leader>as", "<cmd>ChatGPTRun summarize<cr>", desc = "Summarize", mode = { "n", "v" } },
		{ "<leader>af", "<cmd>ChatGPTRun fix_bugs<cr>", desc = "Fix Bugs", mode = { "n", "v" } },
		{ "<leader>ax", "<cmd>ChatGPTRun explain_code<cr>", desc = "Explain Code", mode = { "n", "v" } },
		{ "<leader>at", "<cmd>ChatGPTRun translate<cr>", desc = "Translate", mode = { "n", "v" } },
		{ "<leader>ak", "<cmd>ChatGPTRun keywords<cr>", desc = "Keywords", mode = { "n", "v" } },
		{ "<leader>ad", "<cmd>ChatGPTRun docstring<cr>", desc = "Docstring", mode = { "n", "v" } },
		{ "<leader>aa", "<cmd>ChatGPTRun add_tests<cr>", desc = "Add Tests", mode = { "n", "v" } },
		{ "<leader>ao", "<cmd>ChatGPTRun optimize_code<cr>", desc = "Optimize Code", mode = { "n", "v" } },
		{ "<leader>as", "<cmd>ChatGPTRun summarize<cr>", desc = "Summarize", mode = { "n", "v" } },
		{ "<leader>af", "<cmd>ChatGPTRun fix_bugs<cr>", desc = "Fix Bugs", mode = { "n", "v" } },
		{ "<leader>ax", "<cmd>ChatGPTRun explain_code<cr>", desc = "Explain Code", mode = { "n", "v" } },
		{
			"<leader>hl",
			"<cmd>ChatGPTRun code_readability_analysis<cr>",
			desc = "Code Readability Analysis",
			mode = { "n", "v" },
		},
	},
}
