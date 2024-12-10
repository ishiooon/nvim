local lsp_servers = {
    "lua_ls",
    "phpactor",
}

return{
	-- mason / mason-lspconfig / lspconfig
	{ "williamboman/mason.nvim", opts = { ensure_installed = lsp_servers } },
	{
		"williamboman/mason-lspconfig.nvim",
	    	dependencies = {
	    		"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
	    	},
		opts =  {
			automatic_installation = true,
		},
	},
	-- lspsaga
	{
	    	"nvimdev/lspsaga.nvim",
		opts  = {
		    symbol_in_winbar = {
			separator = "  ",
		    },
		},
	   	dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
	    	},
	    	event = { "BufRead", "BufNewFile" },
	},
}


