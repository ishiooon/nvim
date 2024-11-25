return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	install = function()
		require("nvim-treesitter.install").setup({
			prefer_git = false,
			compilers = { "gcc" },
		})
	end,
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				-- write supported languages
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}