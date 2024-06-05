return {
	"LazyVim/LazyVim",
	keys = {
		-- stylua: ignore start
		{ "<c-s-j>", ":m '>+1<cr>gv=gv",		desc = "Move down", mode = { "v" }, silent = true },
		{ "<c-s-j>", "<esc><cmd>m .+1<cr>==gi",	desc = "Move down", mode = { "i" } },
		{ "<c-s-j>", "<cmd>m .+1<cr>==",		desc = "Move down", mode = { "n" } },

		{ "<c-s-k>", ":m '<-2<cr>gv=gv",		desc = "Move up", mode = { "v" }, silent = true },
		{ "<c-s-k>", "<esc><cmd>m .-2<cr>==gi",	desc = "Move up", mode = { "i" } },
		{ "<c-s-k>", "<cmd>m .-2<cr>==",		desc = "Move up", mode = { "n" } },
		-- stylua: ignore end
	},
}
