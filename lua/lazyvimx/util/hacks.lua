local M = {}

function M.getcharstr()
	local char = vim.fn.getcharstr()

	if LazyVim.has("langmapper.nvim") and char ~= "" then
		char = require("langmapper.utils").translate_keycode(char, "default", "ru")
	end

	return char
end

return M
