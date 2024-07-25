return {
	"rktjmp/paperplanes.nvim",

	opts = {
		provider = "ray.so",
		provider_options = {
			padding = 32,
			colors = "sand",
			darkmode = require("lazyvimx.util.system").theme_is_dark(),
		},
	},
}
