local yaml_ftdetect = vim.api.nvim_create_augroup("yaml_ftdetect", {
    clear = true,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    desc = "YAML",
    pattern = {"*/.kube/config", "kubeconfig"},
    command = "set ft=yaml",
    group = yaml_ftdetect,
})
