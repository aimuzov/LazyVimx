local function jump_or_open(results, open, jump)
	if #results == 1 then
		jump(results[1])
	else
		open(results)
	end
end

return {
	"dnlhc/glance.nvim",
	desc = "A pretty preview window for Neovim that provides VSCode-like peek preview functionality for LSP locations",

	opts = {
		theme = { enable = false },

		border = {
			enable = true,
			top_char = "▁",
			bottom_char = "▔",
		},

		hooks = { before_open = jump_or_open },
	},
}
