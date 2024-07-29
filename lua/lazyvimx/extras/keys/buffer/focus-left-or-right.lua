return {
	"akinsho/bufferline.nvim",
	optional = true,
	keys = {
		{ "H", "<cmd>BufferLineCyclePrev<cr>", mode = { "n" }, desc = "Focus on previous buffer" },
		{ "L", "<cmd>BufferLineCycleNext<cr>", mode = { "n" }, desc = "Focus on next buffer" },
	},
}
