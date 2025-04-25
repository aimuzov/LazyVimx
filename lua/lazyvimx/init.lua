local M = {}

local defaults = {
	colorscheme = "catppuccin",

	colorscheme_flavors = {
		catppuccin = { "catppuccin-macchiato", "catppuccin-latte" },
		tokyonight = { "tokyonight-storm", "tokyonight-day" },
	},

	bufferline_groups = {
		-- ["name"] = "regex",
	},
}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", defaults, opts or {})
end

return M
