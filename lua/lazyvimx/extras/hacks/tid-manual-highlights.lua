return {
	"rachartier/tiny-inline-diagnostic.nvim",
	optional = true,
	opts = function()
		require("tiny-inline-diagnostic.highlights").setup_highlights = function() end
	end,
}
