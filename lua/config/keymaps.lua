vim.g.mapleader = " "


-- telescope用のキーマップ
local builtin = require("telescope.builtin")
-- ファイル検索
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- テキスト検索
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

