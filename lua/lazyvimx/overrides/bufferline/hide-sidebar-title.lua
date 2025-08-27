function offsets_generate()
	local offsets = {}
	local filetypes = {
		"dapui_breakpoints",
		"dapui_scopes",
		"dapui_stacks",
		"dapui_watches",
		"DiffviewFiles",
		"neo-tree",
	}

	for _, filetype in pairs(filetypes) do
		table.insert(offsets, { filetype = filetype, separator = false })
	end

	return offsets
end

function offset_get_replace()
	local Offset = require("bufferline.offset")
	local get_orig = Offset.get

	Offset.get = function()
		local ret = get_orig()

		local layout = require("edgy.config").layout

		if layout.left and #layout.left.wins > 0 and ret.left_size > 0 then
			ret.left = string.rep(" ", layout.left.bounds.width)
		end

		ret.right = ""
		ret.right_size = 0

		ret.total_size = ret.left_size + ret.right_size

		return ret
	end
end

return {
	{
		"akinsho/bufferline.nvim",
		optional = true,
		opts = { options = { offsets = offsets_generate() } },
	},

	{
		"akinsho/bufferline.nvim",
		optional = true,
		opts = offset_get_replace,
	},
}
