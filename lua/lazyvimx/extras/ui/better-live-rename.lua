return {
	"saecki/live-rename.nvim",
	desc = "Live preview of LSP rename operations with inline editing and instant feedback",
	opts = {
		keys = {
			submit = { { "n", "<cr>" }, { "v", "<cr>" }, { "i", "<cr>" } },
			cancel = { { "n", "<c-c>" }, { "v", "<c-c>" }, { "i", "<c-c>" } },
		},
	},
}
