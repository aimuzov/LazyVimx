return {
	"rcarriga/nvim-dap-ui",
	optional = true,

	opts = {
		layouts = {
			{
				elements = {
					{ id = "scopes", size = 0.25 },
					{ id = "breakpoints", size = 0.25 },
					{ id = "stacks", size = 0.25 },
					{ id = "watches", size = 0.25 },
				},
				position = "left",
				size = 40,
			},

			{
				elements = { { id = "repl", size = 1 } },
				position = "bottom",
				size = 10,
			},
		},
	},
}
