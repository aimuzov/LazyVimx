return {
	"saghen/blink.cmp",
	optional = true,
	dependencies = { "xzbdmw/colorful-menu.nvim" },
	opts = {
		completion = {
			documentation = {
				auto_show_delay_ms = 500,
			},
			menu = {
				auto_show = false,
				draw = {
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
		},
	},
}
