return {
	"LazyVim/LazyVim",

	opts = function()
		table.insert(require("lazyvim.util.extras").sources, {
			name = "[ 󰬟 ]",
			desc = "Some recipes (extras) for enhance lazyvim",
			module = "lazyvimx.extras",
		})
	end,
}
