local function icons_override(list)
	local chezmoi_dot_prefix = "dot_"

	list = list or {}

	for key, value in pairs(list) do
		list[key] = value

		if string.find(key, chezmoi_dot_prefix, 1, true) then
			local key_new = "." .. key:sub(chezmoi_dot_prefix:len() + 1)
			list[key_new] = value
		end
	end

	return list
end

return {
	"echasnovski/mini.icons",
	optional = true,

	opts = function(_, opts)
		local icons = require("mini.icons")

		local lua_glyph, lua_hl = icons.get("extension", "lua")
		local rb_glyph, rb_hl = icons.get("extension", "rb")
		local zsh_glyph, zsh_hl = icons.get("extension", "zsh")

		local file_list = {
			["dot_bashrc"] = { glyph = zsh_glyph, hl = zsh_hl },
			["dot_Brewfile"] = { glyph = rb_glyph, hl = rb_hl },
			["dot_tool-versions"] = { glyph = "", hl = "MiniIconsYellow" },
			["dot_zshrc"] = { glyph = zsh_glyph, hl = zsh_hl },
			["dot_zshenv"] = { glyph = zsh_glyph, hl = zsh_hl },
			["init.lua"] = { glyph = lua_glyph, hl = lua_hl },
		}

		opts.file = icons_override(file_list)
	end,
}
