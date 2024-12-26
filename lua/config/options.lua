vim.opt.number = true
-- タブとインデントの設定
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- 背景の透過
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])
require('notify').setup({
    background_colour = '#000000',
})

-- クリップボードの設定
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

vim.lsp.set_log_level("debug")

-- ウィンドウの不透明度
vim.opt.termguicolors = true
vim.opt.winblend = 0 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度

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
})


-- lsp自動補完設定
-- lspのハンドラーに設定
capabilities = require("cmp_nvim_lsp").default_capabilities()

-- lspの設定後に追加
vim.opt.completeopt = "menu,menuone,noselect"

local cmp = require"cmp"
cmp.setup({
  -- snippet = {
  --   expand = function(args)
  --     require("luasnip").lsp_expand(args.body)
  --   end,
  -- },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
  })
})

-- dap設定
require("mason").setup()
require("mason-nvim-dap").setup({
    ensure_installed = { "php-debug-adapter" },
    automatic_installation = true,
})
local dap = require("dap")
local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
-- PHP用アダプターの設定
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/vscode-php-debug/out/phpDebug.js' }
}
-- .vscode/launch.jsonの設定
-- require("dap.ext.vscode").load_launchjs(nil, { lldb = { "c", "cpp", "" } })

dap.set_log_level('TRACE')
-- ブレークポイントの設定
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "Set Conditional Breakpoint" })
vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "Set Log Point" })

-- デバッグ操作
vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = "Start/Continue Debugging" })
vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = "Step Over" })
vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = "Step Into" })
vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = "Step Out" })

-- デバッグUI
local dapui = require('dapui')
vim.keymap.set('n', '<Leader>d', function() dapui.toggle() end, { desc = "Toggle Debug UI" })
-- vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end, { desc = "Open Debug REPL" })

-- 最後のデバッグセッションを再実行
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end, { desc = "Run Last Debug Session" })


