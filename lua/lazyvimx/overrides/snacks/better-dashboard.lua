local button_icons = {
	f = "󰫳",
	g = "󰫴",
	l = "󱎦",
	n = "󰫻",
	p = "󰫽",
	q = "󰫾",
	s = "󰬀",
	x = "󱂑",
}

local function sections_header_create()
	local list_raw = {
		[[⌜ ⌨ lazyvim  ⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆ ⌝]],
		[[▄ ▄▄▄▄ ▄ ▄▄▄ ▄ █ ▄▄▄▄▄▄ ▄▄▄▄▄ ▄▄▄ █ ▄ █ ▄▄▄ █ ▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄ ▄▄█▄▄ ▄]],
		[[▄ █▄▄█ █ █▄ ▄█ █▄█ ▄ ▄  █ ▄ █ █▄  █ ▄ █ ▄ ▄▄▄▄ █ ▄▄▄▄▄ ▄ ▄ ▄ ▄▄▄ █ ▄▄▄ ▄ ▄ ▄]],
		[[█ █▄ █ █ █▄▄ ▄ █ █▄▄ █▄ █▄▄▄▄ █▄▄ █▄▄▄█  ▄▄▄ ▄ █ █ █ █ ▄ █▄█ ▄▄█ █ █▄█ █ █ █]],
		[[▄ ▄▄ ▄ █ ▄▄▄▄ ▄▄▄ ▄▄ █▄ ▄▄▄ █▄ ▄▄▄ ▄█ ▄▄ █▄█ █ █ ▄ ▄▄▄▄█ ▄▄▄ ▄▄█ █ ▄ ▄ █▄█ ▄]],
		[[█ █ ▄█ █▄▄▄▄▄ ▄ █▄▄▄▄▄█▄▄▄▄▄█▄ █ ▄▄▄▄ █▄▄▄█▄▄█▄▄▄▄▄▄▄▄ ▄ ▄█▄▄▄▄▄ █▄▄▄▄▄▄ ▄ █]],
		[[▄ █▄▄ ▄▄ ▄ ▄▄▄ ▄▄▄▄█ ▄▄▄ ▄▄▄ ▄▄█▄▄ █▄▄▄▄▄▄ ▄▄█▄▄ ▄ ▄ █ ▄▄█ ▄█▄ ▄▄ ▄▄█ ▄ ▄█ ▄]],
		[[⌞ ⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆⋆   extended ⌟]],
	}

	local list_prepared = {}

	for index, value in ipairs(list_raw) do
		table.insert(list_prepared, { text = { { value, hl = "SnacksDashboardHeader" .. index } } })
	end

	return list_prepared
end

local function sections_mixin_header(sections)
	local header = sections_header_create()

	for _, section in pairs(sections) do
		table.insert(header, section)
	end

	return header
end

return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		styles = { dashboard = { wo = { winblend = 0 } } },
		dashboard = {
			width = 42,
			preset = {
				---@type snacks.dashboard.Item[]
				keys = {
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
					{ icon = "󰏗", key = "x", desc = "Extras", action = ":LazyExtras" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},

			formats = {
				icon = function(item)
					return { item.icon, width = 5, hl = "icon" }
				end,
				key = function(item)
					return {
						{ "▌", hl = "key" },
						{ " " .. button_icons[item.key] .. "  ", hl = "key" },
						{ "▐", hl = "key" },
					}
				end,
			},

			sections = sections_mixin_header({
				{ text = { { "▁▁▁▁▁▁", hl = "SnacksDashboardBorder" } }, indent = 36 },
				{ section = "keys" },
				{ text = { { "▔▔▔▔▔▔", hl = "SnacksDashboardBorder" } }, indent = 36 },
				{ section = "startup" },
			}),
		},
	},
}
