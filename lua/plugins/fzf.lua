return {
    {
        "junegunn/fzf.vim",
        dependencies = {
            {
                "junegunn/fzf",
                build = "./install --all",
            },
        },
        config = function()
            vim.keymap.set("n", "<leader>sf", "<cmd>Rg<CR>")
        end
    },
}
