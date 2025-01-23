-- falshを使う 
return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = {
                    enabled = true,
                }
            }
        },
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "flash treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "remote flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "treesitter search" },
        },
    }
}
