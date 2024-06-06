return {
	"LazyVim/LazyVim",
	opts = function()
		vim.keymap.set("n", "H", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
		vim.keymap.set("n", "L", "<cmd>bnext<cr>", { desc = "Next Buffer" })
	end,
}
