return {
	"mfussenegger/nvim-dap",
	optional = true,

	keys = {
		{ "<F5>", [[<cmd>require("dap").continue()<cr>]], mode = { "n" }, desc = "Continue" },
		{ "<F10>", [[<cmd>require("dap").step_over()<cr>]], mode = { "n" }, desc = "Step over" },
		{ "<F11>", [[<cmd>require("dap").step_into()<cr>]], mode = { "n" }, desc = "Step into" },
		{ "<F12>", [[<cmd>require("dap").step_out()<cr>]], mode = { "n" }, desc = "Step out" },
	},
}
