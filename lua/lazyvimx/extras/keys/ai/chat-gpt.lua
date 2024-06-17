return {
	"jackMort/ChatGPT.nvim",
	optional = true,

	dependencies = {
		{
			"folke/which-key.nvim",
			optional = true,
			opts = { defaults = { ["<leader>a"] = { name = "+ai (chatgpt)" } } },
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
