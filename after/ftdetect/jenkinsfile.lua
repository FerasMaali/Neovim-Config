local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local jenkinsfile_ftdetect = augroup("jenkinsfile_ftdetect", {
    clear = true,
})

autocmd({ "BufRead", "BufNewFile" }, {
    desc = "Detect Jenkinsfile",
    pattern = "*jenkinsfile*",
    command = "set ft=groovy",
    group = jenkinsfile_ftdetect,
})
