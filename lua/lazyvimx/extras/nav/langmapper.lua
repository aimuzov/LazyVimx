local function langmap_create()
	local function escape(str)
		local escape_chars = [[;,."|\]]
		return vim.fn.escape(str, escape_chars)
	end

	local en = [[\qwertyuiop[]asdfghjkl;'zxcvbnm]]
	local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
	local en_shift = [[|QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
	local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

	local langmap = vim.fn.join({
		escape(ru) .. ";" .. escape(en),
		escape(ru_shift) .. ";" .. escape(en_shift),
	}, ",")

	return langmap
end

local function hack_getcharstr()
	local orig_getcharstr = vim.fn.getcharstr

	vim.fn.getcharstr = function(expr)
		if expr ~= nil then
			return orig_getcharstr(expr)
		end

		local char = orig_getcharstr()

		local ok, lm = pcall(require, "langmapper.utils")

		if not ok then
			return char
		end

		return lm.translate_keycode(char, "default", "ru")
	end
end

return {
	{
		"LazyVim/LazyVim",
		opts = set_langmap,
	},

	{
		"Wansmer/langmapper.nvim",
		opts = hack_getcharstr,
	},

	{
		"Wansmer/langmapper.nvim",
		dependencies = { "LazyVim/LazyVim" },
		priority = 1,
		lazy = false,

		opts = {
			default_layout = [[ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{}~abcdefghijklmnopqrstuvwxyz,.;'[]\]],

			layouts = {
				ru = {
					id = "com.apple.keylayout.Russian",
					layout = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪËфисвуапршолдьтщзйкыегмцчнябюжэхъё",
				},
			},
		},

		config = function(_, opts)
			local lm = require("langmapper")

			lm.setup(opts)
			lm.hack_get_keymap()
		end,
	},

	{
		"LazyVim/LazyVim",
		opts = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					require("langmapper").automapping()
				end,
			})
		end,
	},

	{
		"folke/which-key.nvim",
		dependencies = { "Wansmer/langmapper.nvim" },
		lazy = false,
		opts = function()
			local lmu = require("langmapper.utils")
			local state = require("which-key.state")
			local check_orig = state.check

			state.check = function(state, key)
				if key ~= nil then
					key = lmu.translate_keycode(key, "default", "ru")
				end

				return check_orig(state, key)
			end
		end,
	},
}
