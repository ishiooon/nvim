local lsp_servers = {
    "lua_ls",
    "Intelephense",
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
            finder = {
                max_height = 0.6,
                -- これは必須です / REQUIRED
                default = 'tyd+ref+imp+def',
                -- ここは任意でお好きなキーバインドにしてください / optional
                keys = {
                    toggle_or_open = '<CR>',
                    vsplit = 'v',
                    split = 's',
                    tabnew = 't',
                    tab = 'T',
                    quit = 'q',
                    close = '<Esc>',
                },
                -- これは必須です / REQUIRED
                methods = {
                    tyd = 'textDocument/typeDefinition',
                }
            }
        },
	   	dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
        },
	    event = { "BufRead", "BufNewFile" },
	},
}


