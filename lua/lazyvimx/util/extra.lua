local M = {}

function M.has(extra)
	local Config = require("lazyvim.config")
	local modname = "lazyvimx.extras." .. extra

	return vim.tbl_contains(require("lazy.core.config").spec.modules, modname)
		or vim.tbl_contains(Config.json.data.extras, modname)
end

return M
