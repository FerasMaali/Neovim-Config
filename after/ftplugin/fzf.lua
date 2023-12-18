local opts = {
    buffer = true,
    nowait = true,
    silent = true,
}

vim.keymap.set("n", "<ESC>", ":q!<CR>", opts)

vim.keymap.set("t", "<ESC>", "<C-G>", opts)
