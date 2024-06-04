_G.LazyVimEnhanced = require("lazyvimenhanced.util")

local M = {}

LazyVimEnhanced.config = M

local defaults = {
	colorscheme = function() end,
}

local options

function M.setup(opts)
	options = vim.tbl_deep_extend("force", defaults, opts or {}) or {}
end

M.did_init = false

function M.init()
	if not M.did_init then
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				require("lazyvimenhanced.config.options")
				require("lazyvimenhanced.config.keymaps")
			end,
		})

		M.did_init = true
	end
end

setmetatable(M, {
	__index = function(_, key)
		if options == nil then
			return vim.deepcopy(defaults)[key]
		end

		return options[key]
	end,
})

return M
