local cmd = [[<cmd>lua require("lazyvimx.util.tab").rename()<cr>]]

return {
	"akinsho/bufferline.nvim",
	keys = { { "<leader><tab>r", cmd, desc = "Rename tab" } },
	optional = true,
}
