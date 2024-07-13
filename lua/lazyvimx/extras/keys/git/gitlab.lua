return {
	"harrisoncramer/gitlab.nvim",
	optional = true,

	dependencies = {
		{
			"folke/which-key.nvim",
			optional = true,
			opts = { spec = { { "<leader>gl", group = "+gitlab" } } },
		},
	},

	keys = {
		{ "<leader>glr", [[<cmd>lua require("gitlab").review()<cr>]], desc = "review" },
		{ "<leader>gls", [[<cmd>lua require("gitlab").summary()<cr>]], desc = "summary" },
		{ "<leader>glA", [[<cmd>lua require("gitlab").approve()<cr>]], desc = "approve" },
		{ "<leader>glR", [[<cmd>lua require("gitlab").revoke()<cr>]], desc = "revoke" },
		{ "<leader>glc", [[<cmd>lua require("gitlab").create_comment()<cr>]], desc = "create comment" },
		-- stylua: ignore start
		{ "<leader>glc", [[<cmd>lua require("gitlab").create_multiline_comment()<cr>]], desc = "create comment", mode = { "v" } },
		{ "<leader>glC", [[<cmd>lua require("gitlab").create_comment_suggestion()<cr>]], desc = "create comment suggestion", mode = { "v" } },
		{ "<leader>glm", [[<cmd>lua require("gitlab").move_to_discussion_tree_from_diagnostic()<cr>]], desc = "move to discussion" },
		-- stylua: ignore end
		{ "<leader>gln", [[<cmd>lua require("gitlab").create_note()<cr>]], desc = "create note" },
		{ "<leader>gld", [[<cmd>lua require("gitlab").toggle_discussions()<cr>]], desc = "toggle discussion" },
		{ "<leader>glp", [[<cmd>lua require("gitlab").pipeline()<cr>]], desc = "pipeline" },
		{ "<leader>glo", [[<cmd>lua require("gitlab").open_in_browser()<cr>]], desc = "open in browser" },
		{ "<leader>glM", [[<cmd>lua require("gitlab").merge()<cr>]], desc = "merge" },
	},
}
