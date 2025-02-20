-- neoetree用のキーマップ
vim.keymap.set('n', '<C-e>', '<Cmd>Neotree reveal toggle<CR>')
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree reveal toggle<CR>', { desc = 'Neotree: トグル', })

-- spectre用のキーマップ
vim.keymap.set('n', '<C-f>', '<Cmd>lua require("spectre").toggle()<CR>')
vim.keymap.set('v', '<C-f>', '<Cmd>lua require("spectre").open_visual{select_word=true}<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>lua require("spectre").open_file_search()<CR>')
vim.keymap.set('v', '<C-s>', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>')

-- treesj用のキーマップ
vim.keymap.set('n', '<leader>m', require('treesj').toggle, { desc = 'Treesj: トグル' })

-- telescope用のキーマップ
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
-- ファイル検索
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- テキスト検索
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- freequency検索
vim.keymap.set("n", "<leader>fe", ':Telescope frecency workspace=CWD<CR>', {})
vim.keymap.set("n", "<C-p>", ':Telescope frecency workspace=CWD<CR>', {})
-- レジスタ
vim.keymap.set("n", "<leader>fr", builtin.registers, {})
-- バッファ
vim.keymap.set("n", "<C-b>", builtin.buffers, {})
-- TODO
vim.keymap.set("n", "<leader>ft", ':TodoTelescope<CR>', {})

-- hop用のキーマップ
-- place this in one of your configuration file(s)
-- local hop = require('hop')
-- local directions = require('hop.hint').HintDirection
-- vim.keymap.set('', 'f', function()
--     hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
-- end, {remap=true})
-- vim.keymap.set('', 'F', function()
-- 		hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
-- end, {remap=true})
-- vim.keymap.set('', 't', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
-- end, {remap=true})
-- vim.keymap.set('', 'T', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
-- end, {remap=true})

-- barbar用のキーマップ
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>j', '<Cmd>BufferPrevious<CR>', opts)--Ctrl+jで前のBufferに移動
vim.keymap.set('n', '<leader>k', '<Cmd>BufferNext<CR>', opts)--Ctrl+kで次のBufferに移動
vim.keymap.set('n', '<leader>p',   '<Cmd>BufferPick<CR>', opts)
vim.keymap.set('n', '<leader>to', '<Cmd>BufferOrderByName<CR>', opts)
vim.keymap.set('n', '<leader>q', '<Cmd>BufferClose<CR>', opts)
vim.keymap.set('n', '<leader>tq', '<C-w>o<Cmd>BufferCloseAllButCurrent<CR>', opts)

-- lsp用のキーマップ
-- ホバー
vim.keymap.set("n", "K",  "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set('n', 'gf', '<cmd>Lspsaga goto_definition<CR>')
vim.keymap.set('n', 'gs',  "<Cmd>Lspsaga finder<CR>",  { desc = 'Telescope: live grep args', })
vim.keymap.set('n', '<leader>ol', '<cmd>Lspsaga outline<CR>') -- lsp outline

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
vim.keymap.set('n', '<Leader>sw', ':SudaWrite<CR>')
vim.keymap.set('n', '<Leader>sr', ':SudaRead<CR>')

require("CopilotChat").setup({
    show_help = "yes",
    prompts = {
        Explain = {
            prompt = "/COPILOT_EXPLAIN コードを日本語で説明してください",
            mapping = '<leader>ce',
            description = "コードの説明をお願いする",
        },
        Review = {
            prompt = '/COPILOT_REVIEW コードを日本語でレビューしてください。',
            mapping = '<leader>cr',
            description = "コードのレビューをお願いする",
        },
        Fix = {
            prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします。",
            mapping = '<leader>cf',
            description = "コードの修正をお願いする",
        },
        Optimize = {
            prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします。",
            mapping = '<leader>co',
            description = "コードの最適化をお願いする",
        },
        Docs = {
            prompt = "/COPILOT_GENERATE 選択したコードに関するドキュメントコメントを日本語で生成してください。",
            mapping = '<leader>cd',
            description = "コードのドキュメント作成をお願いする",
        },
        Tests = {
            prompt = "/COPILOT_TESTS 選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします。",
            mapping = '<leader>ct',
            description = "テストコード作成をお願いする",
        },
        FixDiagnostic = {
            prompt = 'コードの診断結果に従って問題を修正してください。修正内容の説明は日本語でお願いします。',
            mapping = '<leader>cd',
            description = "コードの修正をお願いする",
            selection = require('CopilotChat.select').diagnostics,
        },
        Commit = {
            prompt =
            '実装差分に対するコミットメッセージを日本語で記述してください。',
            mapping = '<leader>cco',
            description = "コミットメッセージの作成をお願いする",
            selection = require('CopilotChat.select').gitdiff,
        },
        CommitStaged = {
            prompt =
            'ステージ済みの変更に対するコミットメッセージを日本語で記述してください。',
            mapping = '<leader>cs',
            description = "ステージ済みのコミットメッセージの作成をお願いする",
            selection = function(source)
                return require('CopilotChat.select').gitdiff(source, true)
            end,
        },
    },
})

-- hardtimeのトグル
vim.keymap.set('n', '<leader>ht', '<Cmd>Hardtime toggle<CR>')

-- avante用のキーマップ
-- prefil edit window with common scenarios to avoid repeating query and submit immediately
local prefill_edit_window = function(request)
    require("avante.api").edit()
    local code_bufnr = vim.api.nvim_get_current_buf()
    local code_winid = vim.api.nvim_get_current_win()
    if code_bufnr == nil or code_winid == nil then
        return
    end
    vim.api.nvim_buf_set_lines(code_bufnr, 0, -1, false, { request })
    -- Optionally set the cursor position to the end of the input
    vim.api.nvim_win_set_cursor(code_winid, { 1, #request + 1 })
    -- Simulate Ctrl+S keypress to submit
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-s>", true, true, true), "v", true)
end

-- NOTE: most templates are inspired from ChatGPT.nvim -> chatgpt-actions.json
local avante_code_readability_analysis = [[
  以下の点を考慮しコードの可読性の問題を特定してください。
  考慮すべき可読性の問題:
  - 不明瞭な命名
  - 不明瞭な目的
  - 冗長なコメント
  - コメントの欠如
  - 長いまたは複雑な一行のコード
  - ネストが多すぎる
  - 長すぎる変数名
  - 命名とコードスタイルの不一致
  - コードの繰り返し
  上記以外の問題を特定しても構いません。
]]
local avante_optimize_code = "次のコードを最適化してください。"
local avante_fix_bugs = "次のコード内のバグを修正してください。"
local avante_add_tests = "次のコードのテストを実装してください。"
local avante_add_docstring = "次のコードにdocstringを追加してください。"

-- avante.nvim
local avante_ask = require("avante.api").ask

vim.keymap.set("n", "<leader>al", function()
    avante_ask({ question = avante_code_readability_analysis })
end, { noremap = true, silent = true, desc = "[avante]可読性" })

vim.keymap.set("n", "<leader>aL", function()
    prefill_edit_window(avante_code_readability_analysis)
end, { noremap = true, silent = true, desc = "[avante]可読性(Edit)" })

vim.keymap.set("n", "<leader>ao", function()
    avante_ask({ question = avante_optimize_code })
end, { noremap = true, silent = true, desc = "[avante]最適化" })

vim.keymap.set("n", "<leader>aO", function()
    prefill_edit_window(avante_optimize_code)
end, { noremap = true, silent = true, desc = "[avante]最適化(Edit)" })

vim.keymap.set("n", "<leader>ab", function()
    avante_ask({ question = avante_fix_bugs })
end, { noremap = true, silent = true, desc = "[avante]バグ修正" })

vim.keymap.set("n", "<leader>aB", function()
    prefill_edit_window(avante_fix_bugs)
end, { noremap = true, silent = true, desc = "[avante]バグ修正(Edit)" })

vim.keymap.set("n", "<leader>au", function()
    avante_ask({ question = avante_add_tests })
end, { noremap = true, silent = true, desc = "[avante]テスト実装" })

vim.keymap.set("n", "<leader>aU", function()
    prefill_edit_window(avante_add_tests)
end, { noremap = true, silent = true, desc = "[avante]テスト実装(Edit)" })

vim.keymap.set("n", "<leader>ad", function()
    avante_ask({ question = avante_add_docstring })
end, { noremap = true, silent = true, desc = "[avante]docstring" })

vim.keymap.set("n", "<leader>aD", function()
    prefill_edit_window(avante_add_docstring)
end, { noremap = true, silent = true, desc = "[avante]docstring(Edit)" })
