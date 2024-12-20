-- neotree用のキーマップ
--open/close
vim.keymap.set('n', '<C-e>', '<Cmd>Neotree reveal toggle<CR>')

-- telescope用のキーマップ
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
-- ファイル検索
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- テキスト検索
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- freequency検索
vim.keymap.set("n", "<leader>fe", ':Telescope frecency<CR>', {})

-- hop用のキーマップ
-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 'F', function()
		hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
end, {remap=true})

-- barbar用のキーマップ
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>j', '<Cmd>BufferPrevious<CR>', opts)--Ctrl+jで前のBufferに移動
vim.keymap.set('n', '<leader>k', '<Cmd>BufferNext<CR>', opts)--Ctrl+kで次のBufferに移動
vim.keymap.set('n', '<leader>p',   '<Cmd>BufferPick<CR>', opts)
vim.keymap.set('n', '<leader>to', '<Cmd>BufferOrderByName<CR>', opts)

-- lsp用のキーマップ
-- ホバー
vim.keymap.set("n", "K",  "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set('n', 'gf', '<cmd>Lspsaga goto_definition<CR>')
vim.keymap.set('n', 'gs',  "<Cmd>Lspsaga finder<CR>",  { desc = 'Telescope: live grep args', })


-- dap用のキーマップ
-- options.luaに記述

-- toggleTerm用のキーマップ
-- open/close
vim.keymap.set('', '<C-t>', '<Cmd>ToggleTerm<CR>')
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	dir="%:p:h",
})

function _lazygit_toggle()
  lazygit:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

local w3m = Terminal:new({
    cmd = "w3m google.com",
    hidden = true,
    dir="%:p:h",
})
function _w3m_toggle()
    w3m:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>ww", "<cmd>lua _w3m_toggle()<CR>", {noremap = true, silent = true})

--  天気予報
local wttr = Terminal:new({cmd = "curl wttr.in",hidden = true})
function _wttr_toggle()
    wttr:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>wttr", "<cmd>lua _wttr_toggle()<CR>", {noremap = true, silent = true})

-- Suda.vim 用の キーマップ
vim.keymap.set('n', '<Leader>sr', ':SudaRead<CR>')
vim.keymap.set('n', '<Leader>sw', ':SudaWrite<CR>')

-- 電卓を開く
vim.keymap.set('n', '<Leader>calc', ':Dentaku<CR>')
