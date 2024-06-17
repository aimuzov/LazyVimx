local function separator_style(group, hls)
	return {
		sep_start = {
			{ highlight = hls.pick.hl_group, text = "   " },
			{ highlight = hls.trunc_marker.hl_group, text = group.name },
			{ highlight = hls.pick.hl_group, text = group.hidden and "  " or "  " },
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
