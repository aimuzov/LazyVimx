local buffer_move_create = function(dir)
	local cmd_next = "BufferLineMoveNext"
	local cmd_prev = "BufferLineMovePrev"

	return function()
		local M = {}

		function M.buffer_move(dir_next)
			vim.cmd(dir_next == "next" and cmd_next or cmd_prev)
			M.buffer_move_repeat()
		end

		function M.buffer_move_repeat()
			local char = vim.fn.getcharstr()

			if char == "]" then
				M.buffer_move("next")
			elseif char == "[" then
				M.buffer_move("prev")
			elseif char ~= nil then
				vim.api.nvim_feedkeys(vim.keycode(char), "m", true)
			end
		end

		M.buffer_move(dir)
	end
end

return {
	"akinsho/bufferline.nvim",
	optional = true,

	opts = function()
		require("bufferline").move_prev_repeatable = buffer_move_create("prev")
		require("bufferline").move_next_repeatable = buffer_move_create("next")

		vim.cmd("command! BufferLineMoveNextRepeatable lua require('bufferline').move_prev_repeatable()")
		vim.cmd("command! BufferLineMovePrevRepeatable lua require('bufferline').move_next_repeatable()")
	end,
}
