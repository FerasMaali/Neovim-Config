-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local runnable = vim.api.nvim_create_augroup("runnable", {
    clear = true,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "FileChangedShell" }, {
    desc = "Run the file using <F5> only if the file is executable",
    callback = function()
        local filepath = vim.fn.expand('%:p')
        if vim.fn.executable(filepath) == 1 then
            vim.keymap.set("n", "<F5>", "<CMD>term " .. filepath .. "<CR>", {
                noremap = true,
                buffer = true,
            })
        end
    end,
    group = runnable,
})
