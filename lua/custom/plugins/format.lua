return {
	'mhartington/formatter.nvim',
	lazy = false,
	config = function()
		local util = require('formatter.util')

		local prettierd_format = function()
			return {
				exe = 'prettierd',
				args = { util.escape_path(util.get_current_buffer_file_path()) },
				stdin = true
			}
		end

		require('formatter').setup({
			logging = true,
			log_level = vim.log.levels.WARN,

			filetype = {
				javascript = {
					prettierd_format
				},
				javascriptreact = {
					prettierd_format
				},
				typescript = {
					prettierd_format
				},
				typescriptreact = {
					prettierd_format
				}
			}
		})

		vim.api.nvim_create_augroup("__formatter__", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})
	end
}
