local cmd = [[<cmd>lua require("scope.core").move_current_buf({})<cr>]]

return {
	"tiagovla/scope.nvim",
	keys = { { "<leader>b<tab>", cmd, desc = "Move buffer" } },
	optional = true,
}
