if vim.g.vscode then
	return {}
end

local function is_simple_mode()
	for _, arg in pairs(vim.v.argv) do
		if arg == "+Man!" or arg:find(".git/", 1, true) then
			return true
		end
	end

	return false
end

local function is_not_simple_mode()
	return not is_simple_mode()
end

return {
	{ "nvim-neo-tree/neo-tree.nvim", optional = true, cond = is_not_simple_mode },
	{ "akinsho/bufferline.nvim", optional = true, cond = is_not_simple_mode },
	{ "nvim-lualine/lualine.nvim", optional = true, cond = is_not_simple_mode },
	{ "lukas-reineke/virt-column.nvim", optional = true, cond = is_not_simple_mode },

	{
		"LazyVim/LazyVim",
		opts = function()
			if is_simple_mode() then
				vim.o.laststatus = 0
				vim.o.statusline = " "
				vim.o.number = false
				vim.o.relativenumber = false
			end
		end,
	},
}
