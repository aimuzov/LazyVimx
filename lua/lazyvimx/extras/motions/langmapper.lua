local function langmap_set()
	local escape = function(str)
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

	vim.fn.langmap = langmap
end

local function getcharstr_hack()
	local getcharstr_original = vim.fn.getcharstr
	local getcharstr_override = function(expr)
		if expr ~= nil then
			return getcharstr_original(expr)
		end

		local char = getcharstr_original()

		local ok, lm = pcall(require, "langmapper.utils")

		if not ok then
			return char
		end

		return lm.translate_keycode(char, "default", "ru")
	end

	vim.fn.getcharstr = getcharstr_override
end

local function whichkey_setup()
	local lmu = require("langmapper.utils")
	local state = require("which-key.state")
	local check_orig = state.check

	state.check = function(state, key)
		if key ~= nil then
			key = lmu.translate_keycode(key, "default", "ru")
		end

		return check_orig(state, key)
	end
end

local function langmapper_automapping_on_start()
	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			require("langmapper").automapping()
		end,
	})
end

return {
	recommended = true,
	desc = "A plugin that makes Neovim more friendly to non-English input methods 🤝",

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

	{ "LazyVim/LazyVim", opts = langmap_set },
	{ "Wansmer/langmapper.nvim", opts = getcharstr_hack },
	{ "LazyVim/LazyVim", opts = langmapper_automapping_on_start },

	{
		"folke/which-key.nvim",
		dependencies = { "Wansmer/langmapper.nvim" },
		lazy = false,
		opts = whichkey_setup,
	},
}
