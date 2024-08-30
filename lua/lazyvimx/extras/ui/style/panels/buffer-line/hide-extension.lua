return {
	"akinsho/bufferline.nvim",
	optional = true,

	opts = {
		options = {
			name_formatter = function(buf)
				return buf.name:match("(.+)%..+$")
			end,
		},
	},
}
