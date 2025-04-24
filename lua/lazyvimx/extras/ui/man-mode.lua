local function is_man_mode()
	for _, arg in pairs(vim.v.argv) do
		if arg == "+Man!" then
			return true
		end
	end

	return false
end

local function is_not_man_mode()
	return not is_man_mode()
end

return {
	{ "nvim-neo-tree/neo-tree.nvim", cond = is_not_man_mode },
	{ "akinsho/bufferline.nvim", cond = is_not_man_mode },
	{ "nvim-lualine/lualine.nvim", cond = is_not_man_mode },

	{
		"LazyVim/LazyVim",
		opts = function()
			if is_man_mode() then
				vim.opt.laststatus = 0
				vim.opt.statusline = " "
			end
		end,
	},
}
