-- neocodeiumをインストール
--  aiを用いたコード補完 
return {
    {
        "github/copilot.vim",
        lazy=false,
    },
    -- {
    --     "monkoose/neocodeium",
    --       event = "VeryLazy",
    --       config = function()
    --             local neocodeium = require("neocodeium")
    --             neocodeium.setup()
    --             vim.keymap.set("i", "<C-a>", neocodeium.accept)
    --             vim.keymap.set("i", "<C-j>", function()
    --               neocodeium.cycle(1)
    --             end)
    --             vim.keymap.set("i", "<C-k>", function()
    --               neocodeium.cycle(-1)
    --             end)
    --     end,
    -- },
    -- {
    --     "supermaven-inc/supermaven-nvim",
    --     event = "VeryLazy",
    --     opts = {}
    -- },
}

