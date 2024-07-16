local M = {}

function M.getcharstr(expr)
	local char = vim.fn.getcharstr(expr)

	if LazyVim.has("langmapper.nvim") and char ~= "" then
		char = require("langmapper.utils").translate_keycode(char, "default", "ru")
	end

	return char
end

return M
