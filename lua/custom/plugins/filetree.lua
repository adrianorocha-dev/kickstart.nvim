local function handle_attatch()
	local api = require("nvim-tree.api")

	-- open as vsplit on current node
	local function vsplit_preview()
		local node = api.tree.get_node_under_cursor()

		if node.nodes ~= nil then
			-- expand or collapse folder
			api.node.open.edit()
		else
			-- open file as vsplit
			api.node.open.vertical()
		end

		-- Finally refocus on tree if it was lost
		api.tree.focus()
	end

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.keymap.set("n", "l", api.node.open.edit, opts("Edit or Open"))
	vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
	vim.keymap.set("n", "h", api.node.navigate.parent, opts("Parent Directory"))
	vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))

	vim.keymap.set("n", "o", api.node.open.edit, opts("Edit or Open"))
end

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree", silent = true },
	},
	config = function()
		require("nvim-tree").setup {
			update_focused_file = {
				enable = true,
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
			-- on_attach = handle_attatch,
		}
	end,
}
