return {
    {
        "folke/flash.nvim",
        opts = {
            modes = {
                search = {
                    enabled = false,
                },
                char = {
                    enabled = true,
                    multi_line = true,
                    search = { wrap = false },
                    highlight = { backdrop = false },
                },
            },
        },
    },
}
