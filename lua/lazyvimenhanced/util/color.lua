local M = {}

local function dec2hex(n_value)
	if type(n_value) == "string" then
		n_value = tonumber(n_value)
	end

	local n_hex_val = string.format("%X", n_value) -- %X returns uppercase hex, %x gives lowercase letters
	local s_hex_val = n_hex_val .. ""

	if n_value < 16 then
		return "0" .. tostring(s_hex_val)
	else
		return s_hex_val
	end
end

function M.blend(color_first, color_second, percentage)
	local r1, g1, b1 = string.upper(color_first):match("#([0-9A-F][0-9A-F])([0-9A-F][0-9A-F])([0-9A-F][0-9A-F])")
	local r2, g2, b2 = string.upper(color_second):match("#([0-9A-F][0-9A-F])([0-9A-F][0-9A-F])([0-9A-F][0-9A-F])")

	local r3 = tonumber(r1, 16) * (100 - percentage) / 100.0 + tonumber(r2, 16) * percentage / 100.0
	local g3 = tonumber(g1, 16) * (100 - percentage) / 100.0 + tonumber(g2, 16) * percentage / 100.0
	local b3 = tonumber(b1, 16) * (100 - percentage) / 100.0 + tonumber(b2, 16) * percentage / 100.0

	return "#" .. dec2hex(r3) .. dec2hex(g3) .. dec2hex(b3)
end

return M
