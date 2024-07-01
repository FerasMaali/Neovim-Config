-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>p", '"+p')
map({ "n", "v" }, "<leader>P", '"+P')
map({ "n", "v" }, "<leader>d", '"+d')

vim.keymap.set("n", "<leader><CR>", function()
    vim.opt.hlsearch = not vim.opt.hlsearch:get()
end)

-- Shell-like behavior
map("c", "<C-A>", "<Home>")
map("c", "<C-E>", "<End>")
map("c", "<C-P>", "<Up>")
map("c", "<C-N>", "<Down>")

map("n", "j", function()
    if vim.v.count == 0 then
        vim.cmd("normal! gj")
        return
    end
    vim.cmd("normal! m'" .. vim.v.count .. "j")
end)

map("n", "k", function()
    if vim.v.count == 0 then
        vim.cmd("normal! gk")
        return
    end
    vim.cmd("normal! m'" .. vim.v.count .. "k")
end)

map({"n", "i", "v"}, "<F1>", "<nop>")

-- Visual mode pressing * or # searches for the current selection
vim.cmd([[
    vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
    vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

    function! VisualSelection(direction, extra_filter) range
        let l:saved_reg = @"
        execute "normal! vgvy"

        let l:pattern = escape(@", "\\/.*'$^~[]")
        let l:pattern = substitute(l:pattern, "\n$", "", "")

        if a:direction == 'gv'
            call CmdLine("Ack '" . l:pattern . "' " )
        elseif a:direction == 'replace'
            call CmdLine("%s" . '/'. l:pattern . '/')
        endif

        let @/ = l:pattern
        let @" = l:saved_reg
    endfunction

    function! CmdLine(str)
        call feedkeys(":" . a:str)
    endfunction
]])

del({ "n", "t" }, "<C-H>")
del({ "n", "t" }, "<C-J>")
del({ "n", "t" }, "<C-K>")
del({ "n", "t" }, "<C-L>")
del({ "i", "n" }, "<Esc>")
