local M = {}

function M.has(extra)
	local Config = require("lazyvim.config")
	local modname = "lazyvimx.extras." .. extra

	return vim.tbl_contains(require("lazy.core.config").spec.modules, modname)
		or vim.tbl_contains(Config.json.data.extras, modname)
end

function M.notify_missing(extra, required)
	local type = required and "required" or "recommended"

	if required then
		Snacks.notify.error("Missing required extra: `" .. extra .. "`", { icon = "[ 󰬟 ]" })
	else
		Snacks.notify.warn("Missing recommended extra: `" .. extra .. "`", { icon = "[ 󰬟 ]" })
	end
end

return M
