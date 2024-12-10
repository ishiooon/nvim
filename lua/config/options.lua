vim.opt.number = true
vim.lsp.set_log_level("debug")

-- lsp設定
local mason = require('mason')
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
    	function(server_name)
        	lspconfig[server_name].setup({})
    	end,
    	intelephense_analyzer = function()  -- 個別に設定することもできる
		require('lspconfig.intelephense').setup({
root_dir = lspconfig.util.root_pattern("composer.json", ".git","*.php")	
		})
    	end,

})
