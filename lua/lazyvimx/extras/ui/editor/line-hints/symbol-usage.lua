return {
	"Wansmer/symbol-usage.nvim",
	event = "BufReadPre",
	opts = function(_, opts)
		opts.vt_position = "end_of_line"
		opts.request_pending_text = "symbol"
		opts.hl = { link = "GitSignsCurrentLineBlame" }
		opts.text_format = function(symbol)
			local text = require("symbol-usage.options")._default_opts.text_format(symbol)

			return "󰌹 " .. text
		end
	end,
}
