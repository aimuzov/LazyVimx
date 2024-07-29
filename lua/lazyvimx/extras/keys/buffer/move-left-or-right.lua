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

	keys = {
		{ "<leader>bm[", buffer_move_create("prev"), desc = "Move buffer (prev)" },
		{ "<leader>bm]", buffer_move_create("next"), desc = "Move buffer (next)" },
	},
}
