vim.g.mapleader = " "

-- neotree用のキーマップ
--open/close
vim.keymap.set('', '<C-b>', '<Cmd>Neotree toggle<CR>')

-- telescope用のキーマップ
local builtin = require("telescope.builtin")
-- ファイル検索
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- テキスト検索
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})


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
vim.keymap.set('n', '<C-j>', '<Cmd>BufferPrevious<CR>', opts)--Ctrl+jで前のBufferに移動
vim.keymap.set('n', '<C-k>', '<Cmd>BufferNext<CR>', opts)--Ctrl+kで次のBufferに移動
