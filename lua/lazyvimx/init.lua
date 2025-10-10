local M = {}

local defaults = {
	colorscheme = "catppuccin",

	colorscheme_households = {
		catppuccin = {
			{ "catppuccin-macchiato", "catppuccin-frappe", "catppuccin-mocha", "catppuccin" },
			{ "catppuccin-latte" },
		},
		tokyonight = {
			{ "tokyonight-storm", "tokyonight-moon", "tokyonight-light" },
			{ "tokyonight-day" },
		},
	},

	bufferline_groups = {
		-- ["name"] = "regex",
	},
}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", defaults, opts or {})
end

return M
