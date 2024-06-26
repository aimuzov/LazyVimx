local function separator_style(group)
	return {
		sep_start = {
			{ highlight = "BufferLineCustomGroupSep", text = "   " },
			{ highlight = "BufferLineCustomGroupLabel", text = group.name },
			{ highlight = "BufferLineCustomGroupSep", text = group.hidden and "  " or "  " },
		},
		sep_end = {},
	}
end

local function matcher_create(match)
	return function(buf)
		if match == "term" then
			return buf.buftype == "terminal"
		end

		return string.find(buf.path, match)
	end
end

local function item_create(name, match)
	return {
		name = name,
		matcher = matcher_create(match),
		separator = { style = separator_style },
	}
end

return {
	"akinsho/bufferline.nvim",
	optional = true,

	opts = function(_, opts)
		local bufferline_groups = require("bufferline.groups")

		opts.options.groups = {
			items = {
				bufferline_groups.builtin.pinned:with({ icon = "" }),
				bufferline_groups.builtin.ungrouped,

				item_create("lib", "/lib/"),
				item_create("types", "/types/"),
				item_create("ui", "%.svelte"),
				item_create("term", "term"),
			},
		}
	end,
}
