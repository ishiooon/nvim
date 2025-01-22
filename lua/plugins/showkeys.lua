return{
    {
        "nvzone/showkeys",
        cmd = "ShowkeysToggle",
        opts = {
            timeout = 5,
            maxkeys = 6,
            -- 起動時に表示する
            function()
                vim.cmd("ShowkeysToggle")
            end
        }
    }
}
