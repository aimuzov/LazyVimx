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
		{ "<leader>gle", [[<cmd>lua require("gitlab").choose_merge_request()<cr>]], desc = "Choose merge request" },
		{ "<leader>glr", [[<cmd>lua require("gitlab").review()<cr>]], desc = "Review" },
		{ "<leader>gls", [[<cmd>lua require("gitlab").summary()<cr>]], desc = "Summary" },
		{ "<leader>glA", [[<cmd>lua require("gitlab").approve()<cr>]], desc = "Approve" },
		{ "<leader>glR", [[<cmd>lua require("gitlab").revoke()<cr>]], desc = "Revoke" },
		{ "<leader>glc", [[<cmd>lua require("gitlab").create_comment()<cr>]], desc = "Create comment" },
		-- stylua: ignore start
		{ "<leader>glc", [[<cmd>lua require("gitlab").create_multiline_comment()<cr>]], desc = "Create comment", mode = { "v" } },
		{ "<leader>glC", [[<cmd>lua require("gitlab").create_comment_suggestion()<cr>]], desc = "Create comment suggestion", mode = { "v" } },
		{ "<leader>glm", [[<cmd>lua require("gitlab").move_to_discussion_tree_from_diagnostic()<cr>]], desc = "Move to discussion" },
		-- stylua: ignore end
		{ "<leader>gln", [[<cmd>lua require("gitlab").create_note()<cr>]], desc = "create note" },
		{ "<leader>gld", [[<cmd>lua require("gitlab").toggle_discussions()<cr>]], desc = "Toggle discussion" },
		{ "<leader>glp", [[<cmd>lua require("gitlab").pipeline()<cr>]], desc = "Pipeline" },
		{ "<leader>glo", [[<cmd>lua require("gitlab").open_in_browser()<cr>]], desc = "Open in browser" },
		{ "<leader>glM", [[<cmd>lua require("gitlab").merge()<cr>]], desc = "Merge" },
	},
}
