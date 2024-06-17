local cmd = [[<cmd>lua require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })<cr>]]

return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = { { "<c-e>", cmd, mode = { "n", "v", "t" }, desc = "Toggle explorer" } },
}
