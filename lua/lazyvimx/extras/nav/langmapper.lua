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

return {
	{
		"LazyVim/LazyVim",
		opts = function()
			vim.opt.langmap = langmap_create()
		end,
	},

	{
		"Wansmer/langmapper.nvim",
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
}
