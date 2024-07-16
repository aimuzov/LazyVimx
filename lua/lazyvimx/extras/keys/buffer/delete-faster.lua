local buffer_delete_create = function(force)
	return function()
		local M = {}

		function M.buffer_delete(buffer_number, force)
			local buffer_filetype = vim.api.nvim_get_option_value("filetype", { buf = buffer_number })

			if buffer_filetype ~= "alpha" then
				require("lazyvimx.util.buffer").delete(buffer_number, force)
				vim.cmd([[redraw!]])
			end

			M.buffer_delete_repeat()
		end

		function M.buffer_delete_repeat()
			local char = require("lazyvimx.util.hacks").getcharstr()

			if char == "d" then
				M.buffer_delete(vim.fn.bufnr())
			elseif char == "D" then
				M.buffer_delete(vim.fn.bufnr(), true)
			elseif char ~= nil then
				vim.api.nvim_feedkeys(vim.keycode(char), "m", true)
			end
		end

		M.buffer_delete(vim.fn.bufnr(), force)
	end
end

return {
	"echasnovski/mini.bufremove",
	optional = true,

	keys = {
		{ "<leader>bd", buffer_delete_create(), desc = "Delete buffer" },
		{ "<leader>bD", buffer_delete_create(true), desc = "Delete buffer (force)" },
	},
}
