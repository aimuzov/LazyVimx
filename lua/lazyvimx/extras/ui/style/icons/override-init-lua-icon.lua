return {
	"echasnovski/mini.icons",
	optional = true,
	opts = function(_, opts)
		local icons = require("mini.icons")
		local lua_glyph, lua_hl = icons.get("extension", "lua")

		opts.file = {
			["init.lua"] = { glyph = lua_glyph, hl = lua_hl },
		}
	end,
}
