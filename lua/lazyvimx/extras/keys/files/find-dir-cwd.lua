return {
	"nvim-telescope/telescope.nvim",
	optional = true,
	keys = { { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" } },
}
