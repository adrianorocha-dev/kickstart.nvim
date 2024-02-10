return {
	"prettier/vim-prettier",
	cmd = "Prettier",
	build = "yarn install --frozen-lockfile",
	opts = {
		autoformat = 1,
		-- filetypes = {
		-- 	"css",
		-- 	"graphql",
		-- 	"html",
		-- 	"javascript",
		-- 	"javascriptreact",
		-- 	"json",
		-- 	"less",
		-- 	"markdown",
		-- 	"scss",
		-- 	"typescript",
		-- 	"typescriptreact",
		-- 	"yaml",
		-- },
	},
}
