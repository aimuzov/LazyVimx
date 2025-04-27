local layout = require("lazyvimx.util.layout")

local function open_yazi()
	Snacks.terminal("yazi", {
		win = {
			border = "none",
			height = 0,
			width = 0,
			wo = { winblend = 0 },
		},
	})
end

function tab_rename()
	local tab_name = vim.fn.input("tab name: ")

	if tab_name ~= "" then
		vim.cmd("BufferLineTabRename " .. tab_name)
	end
end

local function create(plugin_name, keys, opts)
	local info = {
		plugin_name,
		optional = true,
	}

	for _, value in pairs(keys) do
		value["desc"] = value["desc"] or "Description not setted"

		if type(value[2]) == "string" then
			value[2] = "<cmd>" .. value[2] .. "<cr>"
		else
			value[2] = value[2][1]
		end
	end

	info.keys = keys

	if opts ~= nil then
		info.opts = opts
	end

	return info
end

return {
	create("LazyVim/LazyVim", {
		{ "<leader>\\", { "<c-w>v" }, desc = "Split window right" },
		{ "<leader>ch", "lua Snacks.terminal.open('cht.sh --shell')", desc = "Open shell (cht.sh)" },
		{ "<leader>fy", { open_yazi }, desc = "Find files (yazi)" },
		{ "<leader>ll", "Lazy", desc = "Open popup with lazy dashboard" },
		{ "<leader>lx", "LazyExtras", desc = "Open popup with lazy extras" },

		{ "d", { [["_d]] }, mode = { "n", "v" }, desc = "Delete text without yanking" },

		-- stylua: ignore start
		{ "<c-s-j>", { ":m '>+1<cr>gv=gv" },		desc = "Move down", mode = { "v" }, silent = true },
		{ "<c-s-j>", { "<esc><cmd>m .+1<cr>==gi" },	desc = "Move down", mode = { "i" } },
		{ "<c-s-j>", { "<cmd>m .+1<cr>==" },		desc = "Move down", mode = { "n" } },

		{ "<c-s-k>", { ":m '<-2<cr>gv=gv" },		desc = "Move up", mode = { "v" }, silent = true },
		{ "<c-s-k>", { "<esc><cmd>m .-2<cr>==gi" },	desc = "Move up", mode = { "i" } },
		{ "<c-s-k>", { "<cmd>m .-2<cr>==" },		desc = "Move up", mode = { "n" } },
		-- stylua: ignore end
	}),

	create("dnlhc/glance.nvim", {
		{ "<leader>gd", "Glance definitions", desc = "Show definitions (peek window)" },
		{ "<leader>gm", "Glance implementations", desc = "Show implementations (peek window)" },
		{ "<leader>gr", "Glance references", desc = "Show references (peek window)" },
		{ "<leader>gy", "Glance type_definitions", desc = "Show type definitions (peek window)" },
	}),

	create("folke/snacks.nvim", {
		{ "<leader><space>", { LazyVim.pick("smart") }, desc = "Find files (smart)" },
		{ "<leader>uz", "lua Snacks.zen.zoom()", desc = "Toggle zen mode" },
	}),

	create("nvim-treesitter/nvim-treesitter-context", {
		{ "[x", "lua require('treesitter-context').go_to_context(vim.v.count1)", desc = "Go to context" },
	}),

	create("goolord/alpha-nvim", {
		{ "<leader>uq", "Alpha", desc = "Open dashboard (Alpha)" },
	}),

	create("akinsho/bufferline.nvim", {
		{ "<leader><tab>r", { tab_rename }, desc = "Rename tab" },
		{ "<leader>bg", "BufferLinePick", mode = { "n", "v" }, desc = "Pick Buffer" },
		{ "<leader>bm[", "BufferLineMoveNextRepeatable", desc = "Move buffer (prev)" },
		{ "<leader>bm]", "BufferLineMovePrevRepeatable", desc = "Move buffer (next)" },
		{ "H", "BufferLineCyclePrev" },
		{ "L", "BufferLineCycleNext" },
	}),

	create("chrisgrieser/nvim-spider", {
		{ "<c-b>", { "<esc><cmd>lua require('spider').motion('b')<cr>i" }, mode = { "i" } },
		{ "<c-f>", { "<esc>l<cmd>lua require('spider').motion('w')<cr>i" }, mode = { "i" } },
		{ "b", "lua require('spider').motion('b')", mode = { "n", "o", "x" } },
		{ "cw", { "c<cmd>lua require('spider').motion('e')<cr>" }, mode = { "n" } },
		{ "e", "lua require('spider').motion('e')", mode = { "n", "o", "x" } },
		{ "w", "lua require('spider').motion('w')", mode = { "n", "o", "x" } },
	}),

	create("folke/edgy.nvim", {
		-- stylua: ignore start
		{ "<c-Up>",		"resize +" .. layout.step,				mode = { "n", "v", "t" }, desc = "Increase window height" },
		{ "<c-Down>",	"resize -" .. layout.step,				mode = { "n", "v", "t" }, desc = "Decrease window height" },
		{ "<c-Left>",	"vertical resize -" .. layout.step,		mode = { "n", "v", "t" }, desc = "Decrease window width" },
		{ "<c-Right>",	"vertical resize +" .. layout.step,		mode = { "n", "v", "t" }, desc = "Increase window width" },
		-- stylua: ignore end
	}, function(_, opts)
		opts.keys = {
			["<c-Up>"] = layout.increase_create("height"),
			["<c-Down>"] = layout.decrease_create("height"),
			["<c-Left>"] = layout.decrease_create("width"),
			["<c-Right>"] = layout.increase_create("width"),
		}
	end),

	create("tiagovla/scope.nvim", {
		{ "<leader>b<tab>", "lua require('scope.core').move_current_buf({})", desc = "Move buffer to another tab" },
	}),

	create("harrisoncramer/gitlab.nvim", {
		{ "<leader>glA", "lua require('gitlab').approve()", desc = "Approve" },
		{ "<leader>glc", "lua require('gitlab').create_comment()", desc = "Create comment" },
		-- stylua: ignore
		{ "<leader>glC", "lua require('gitlab').create_comment_suggestion()", mode = { "v" }, desc = "Create comment suggestion" },
		{ "<leader>glc", "lua require('gitlab').create_multiline_comment()", mode = { "v" }, desc = "Create comment" },
		{ "<leader>gld", "lua require('gitlab').toggle_discussions()", desc = "Toggle discussion" },
		{ "<leader>gle", "lua require('gitlab').choose_merge_request()", desc = "Choose merge request" },
		{ "<leader>glM", "lua require('gitlab').merge()", desc = "Merge" },
		-- stylua: ignore
		{ "<leader>glm", "lua require('gitlab').move_to_discussion_tree_from_diagnostic()", desc = "Move to discussion" },
		{ "<leader>gln", "lua require('gitlab').create_note()", desc = "create note" },
		{ "<leader>glo", "lua require('gitlab').open_in_browser()", desc = "Open in browser" },
		{ "<leader>glp", "lua require('gitlab').pipeline()", desc = "Pipeline" },
		{ "<leader>glr", "lua require('gitlab').review()", desc = "Review" },
		{ "<leader>glR", "lua require('gitlab').revoke()", desc = "Revoke" },
		{ "<leader>gls", "lua require('gitlab').summary()", desc = "Summary" },
	}),

	create("tpope/vim-fugitive", {
		{ "go", "'<,'>GBrowse", desc = "Open range (browser)", mode = { "v" } },
		{ "go", "GBrowse", desc = "Open (browser)", mode = { "n" } },
	}),

	create("moyiz/git-dev.nvim", {
		{ "gX", "GitDevRemoteEnterAndOpen", desc = "Enter a remote git repository; open (tab)" },
		{ "gx", "GitDevRemoteOpen", desc = "Open a remote git repository; open (tab)" },
	}),

	create("mfussenegger/nvim-dap", {
		{ "<F5>", "require('dap').continue()", desc = "Continue" },
		{ "<F10>", "require('dap').step_over()", desc = "Step over" },
		{ "<F11>", "require('dap').step_into()", desc = "Step into" },
		{ "<F12>", "require('dap').step_out()", desc = "Step out" },
	}),

	create("m4xshen/hardtime.nvim", {}, function()
		-- https://github.com/m4xshen/hardtime.nvim/issues/31
		-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua#L8-L11
		-- stylua: ignore start
		vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
		vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
		vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
		vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
		-- stylua: ignore end

		local hardtime = require("hardtime")

		Snacks.toggle
			.new({
				name = "Hard time",
				-- stylua: ignore start
				get = function() return hardtime.is_plugin_enabled end,
				set = function() hardtime.toggle() end,
				-- stylua: ignore end
			})
			:map("<leader>uH")
	end),

	create("olrtg/nvim-emmet", {
		{ "<leader>cw", "EmmetWrap", desc = "Wrap with emmet abbreviation", mode = { "n", "v" } },
	}),

	create("Wansmer/sibling-swap.nvim", {
		{ "<C-.>", "lua require('sibling-swap').swap_with_right()", desc = "Move sibling node to right" },
		{ "<C-,>", "lua require('sibling-swap').swap_with_left()", desc = "Move sibling node to left" },
	}, { use_default_keymaps = false }),

	create("aaronik/treewalker.nvim", {
		{ "<c-a-l>", "Treewalker Right" },
		{ "<c-a-h>", "Treewalker Left" },
		{ "<c-a-j>", "Treewalker Down" },
		{ "<c-a-k>", "Treewalker Up" },
		{ "<c-a-.>", "Treewalker SwapDown" },
		{ "<c-a-,>", "Treewalker SwapUp" },
	}),

	create("lewis6991/gitsigns.nvim", {}, function(_, opts)
		local on_attach_orig = opts.on_attach
		local on_attach_modified = function(buffer)
			local keyOpts = { buffer = buffer, desc = "Preview Hunk" }
			vim.keymap.set("n", "<leader>ghP", require("gitsigns").preview_hunk, keyOpts)
			on_attach_orig(buffer)
		end

		opts.on_attach = on_attach_modified
		opts.preview_config = vim.tbl_extend("force", opts.preview_config or {}, { row = 1, col = 1 })
	end),
}
