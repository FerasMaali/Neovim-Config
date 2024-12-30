-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local runnable = augroup("runnable", {
    clear = true,
})

autocmd({ "BufRead", "BufNewFile", "FileChangedShell" }, {
    desc = "Run the file using <F5> only if the file is executable",
    callback = function()
        local filepath = vim.fn.expand("%:p")
        if vim.fn.executable(filepath) == 1 then
            vim.keymap.set("n", "<F5>", "<CMD>term '" .. filepath .. "'<CR>", {
                noremap = true,
                buffer = true,
            })
        end
    end,
    group = runnable,
})

-- Persistent Folds
local save_fold = augroup("PersistentFolds", { clear = true })
autocmd("BufWinLeave", {
    callback = function()
        vim.cmd.mkview({ mods = { emsg_silent = true } })
    end,
    group = save_fold,
})
autocmd("BufWinEnter", {
    callback = function()
        vim.cmd.loadview({ mods = { emsg_silent = true } })
    end,
    group = save_fold,
})

vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
