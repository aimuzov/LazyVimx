return {
	"nvim-telescope/telescope.nvim",
	optional = true,
	keys = { { "<leader><space>", LazyVim.pick("auto", { root = false }), desc = "Find Files (cwd)" } },
}
