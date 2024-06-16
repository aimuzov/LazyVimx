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
		if match == "term" and buf.buftype == "terminal" then
			return true
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
	{
		"akinsho/bufferline.nvim",
		lazy = false,

		opts = {
			options = {
				always_show_bufferline = true,
				truncate_names = false,
				tab_size = 16,
				indicator = { icon = "▎", style = "icon" },
				separator_style = "thin",
				left_trunc_marker = "",
				right_trunc_marker = "",
				modified_icon = "",
				close_icon = "󰅖",
				offsets = {
					{ filetype = "neo-tree", separator = false, text = "" },
					{ filetype = "DiffviewFiles", separator = false, text = "" },
				},

				name_formatter = function(buf)
					return buf.name:match("(.+)%..+$")
				end,
			},
		},

		keys = {
			{ "<leader>bg", "<cmd>BufferLinePick<cr>", mode = { "n", "v", "t" }, desc = "Pick Buffer" },
			{ "<leader>bm[", buffer_move_create("prev"), desc = "Move buffer (prev)" },
			{ "<leader>bm]", buffer_move_create("next"), desc = "Move buffer (next)" },
		},
	},

	{
		"akinsho/bufferline.nvim",

		opts = function(_, opts)
			local bufferline_groups = require("bufferline.groups")

			opts.options.groups = {
				items = {
					bufferline_groups.builtin.pinned:with({ icon = "" }),
					bufferline_groups.builtin.ungrouped,
					item_create("lib", "/lib/"),
					item_create("types", "/types/"),
					item_create("ui", ".svelte"),
					item_create("term", "term"),
				},
			}
		end,
	},
}
