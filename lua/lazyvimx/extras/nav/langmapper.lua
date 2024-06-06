local function langmap_create()
	local function escape(str)
		local escape_chars = [[;,."|\]]
		return vim.fn.escape(str, escape_chars)
	end

	local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
	local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
	local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
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
			default_layout = [[ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{}~abcdefghijklmnopqrstuvwxyz,.;'[]`]],

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
		"folke/which-key.nvim",
		optional = true,
		dependencies = { "Wansmer/langmapper.nvim" },

		opts = function(_, opts)
			local lmu = require("langmapper.utils")

			opts.triggers_blacklist = {
				o = lmu.trans_list({ ";", ".", '"', "'", "j", "k", "D", "s", "S" }),
				i = lmu.trans_list({ ";", ".", '"', "'", "j", "k", "D", "s", "S" }),
				n = lmu.trans_list({ ";", ".", '"', "'", "j", "k", "D", "s", "S" }),
				v = lmu.trans_list({ ";", ".", '"', "'", "j", "k", "D", "s", "S" }),
			}

			opts.plugins = { spelling = false }
			opts.icons = { group = " " }
			opts.layout = { spacing = 5 }
			opts.window = { winblend = 15 }
		end,

		config = function(_, opts)
			local lmu = require("langmapper.utils")
			local view = require("which-key.view")
			local execute = view.execute

			view.execute = function(prefix_i, mode, buf)
				prefix_i = lmu.translate_keycode(prefix_i, "default", "ru")
				execute(prefix_i, mode, buf)
			end

			require("which-key").setup(opts)
			require("which-key").register(opts.defaults)
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
