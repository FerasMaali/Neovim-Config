return {
    {
        "junegunn/fzf.vim",
        cmd = {
            "Rg",
        },
        keys = {
            "<leader>sf",
            "<leader>sF",
        },
        dependencies = {
            {
                "junegunn/fzf",
                build = "./install --all",
            },
        },
        config = function()
            vim.keymap.set("n", "<leader>sF", "<cmd>Rg<CR>", {
                desc = "FZF Rg (cwd)",
            })

            vim.keymap.set(
                "n",
                "<leader>sf",
                ([[<cmd>call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case -- '.fzf#shellescape('') . ' %s', fzf#vim#with_preview(), 0)<CR>]]):format(
                    require("lazyvim.util").root.get()
                ),
                {
                    desc = "FZF Rg (Root)",
                }
            )
        end,
    },
}
