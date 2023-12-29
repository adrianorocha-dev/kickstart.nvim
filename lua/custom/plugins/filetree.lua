return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree", silent = true }
	},
	config = function()
		require("nvim-tree").setup {
			update_focused_file = {
				enable = true,
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
			}
		}
	end,
}
