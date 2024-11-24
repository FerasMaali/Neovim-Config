local config = vim.fn.expand("$HOME/.indentconfig.yaml")
return {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            injected = { options = { ignore_errors = true } },
            latexindent = {
                args = { "-m", "-l", config, "-" },
            },
        },
        formatters_by_ft = {
            ["css"] = { { "prettierd", "prettier" } },
            ["html"] = { { "prettierd", "prettier" } },
            ["javascript"] = { { "prettierd", "prettier" } },
            ["markdown"] = { { "prettierd", "prettier" } },
            ["markdown.mdx"] = { { "prettierd", "prettier" } },
            ["sql"] = { "sql_formatter" },
            ["tex"] = { "latexindent" },
        },
    },
}
