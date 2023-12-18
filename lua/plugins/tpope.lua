return {
    "tpope/vim-eunuch",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    {
        "tpope/vim-sleuth",
        init = function()
            local my_sleuth = vim.api.nvim_create_augroup("my_sleuth", {
                clear = true,
            })

            vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
                desc = "Turn off sleuth for YAML files",
                pattern = {
                    "*/.kube/config",
                    "*.yaml",
                },
                command = "let b:sleuth_automatic = 0",
                group = my_sleuth,
            })
        end,
    },
}
