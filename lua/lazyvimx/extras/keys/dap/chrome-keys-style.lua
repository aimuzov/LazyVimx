return {
	"mfussenegger/nvim-dap",
	optional = true,

	keys = {
		{ "n", "<F5>", [[<cmd>require("dap").continue()<cr>]], desc = "Continue" },
		{ "n", "<F10>", [[<cmd>require("dap").step_over()<cr>]], desc = "Step over" },
		{ "n", "<F11>", [[<cmd>require("dap").step_into()<cr>]], desc = "Step into" },
		{ "n", "<F12>", [[<cmd>require("dap").step_out()<cr>]], desc = "Step out" },
	},
}
