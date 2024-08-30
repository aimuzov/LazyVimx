return {
	"hrsh7th/nvim-cmp",
	dependencies = { "LazyVim/LazyVim", "onsails/lspkind.nvim" },
	opts = function(_, opts)
		local cmp = require("cmp")

		opts.formatting = {
			fields = {
				cmp.ItemField.Kind,
				cmp.ItemField.Abbr,
				cmp.ItemField.Menu,
			},

			format = require("lspkind").cmp_format({
				mode = "symbol",
				maxwidth = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 50,
				symbol_map = LazyVim.config.icons.kinds,
				ellipsis_char = LazyVim.config.icons.misc.dots,
			}),
		}
	end,
}
