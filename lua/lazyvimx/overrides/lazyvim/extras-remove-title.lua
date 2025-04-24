local function remove_extras_title()
	local Float = require("lazy.view.float")
	local float_new_original = Float.new

	Float.new = function(opts)
		if opts ~= nil and opts.title == "LazyVim Extras" then
			opts.title = ""
		end

		return float_new_original(opts)
	end
end

return {
	"LazyVim/LazyVim",
	opts = remove_extras_title,
}
