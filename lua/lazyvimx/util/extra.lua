local M = {}

function M.has(extra)
	local Config = require("lazyvim.config")
	local modname = "lazyvimx.extras." .. extra

	return vim.tbl_contains(require("lazy.core.config").spec.modules, modname)
		or vim.tbl_contains(Config.json.data.extras, modname)
end

function M.notify_missing(extra, required)
	local type = required and "required" or "recommended"

	vim.notify(
		"Missing " .. type .. " extra: `" .. extra .. "`",
		required and vim.log.levels.ERROR or vim.log.levels.WARN
	)
end

return M
