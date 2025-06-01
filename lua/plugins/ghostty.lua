return {
    "isak102/ghostty.nvim",
    config = function()
        require("ghostty").setup({
            -- These are just the defaults
            -- Added them for verbosity
            file_pattern = "*/ghostty/config",
            ghostty_cmd = "ghostty",
            check_timeout = 1000,
        })
    end,
}
