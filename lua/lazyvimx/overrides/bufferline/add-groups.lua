local function separator_style(group)
	return {
		sep_start = {
			{ highlight = "BufferLineCustomGroupSep", text = "   " },
			{ highlight = "BufferLineCustomGroupLabel", text = group.name },
			{ highlight = "BufferLineCustomGroupSep", text = group.hidden and "   " or "   " },
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

local function custom_groups_create(user_groups)
	local bufferline_groups = require("bufferline.groups")

	local custom_groups = {
		items = {
			bufferline_groups.builtin.pinned:with({ icon = "" }),
			bufferline_groups.builtin.ungrouped,
		},
	}

	if user_groups ~= nil then
		for name, match in pairs(user_groups) do
			table.insert(custom_groups.items, item_create(name, match))
		end
	end

	table.insert(custom_groups.items, item_create("term", "term"))

	return custom_groups
end

return {
	"akinsho/bufferline.nvim",
	optional = true,

	opts = function(_, opts)
		opts.options.groups = custom_groups_create(require("lazyvimx").config.bufferline_groups)
		require("bufferline.groups").custom_groups_create = custom_groups_create
	end,
}
