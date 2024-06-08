return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            ["css"] = { { "prettierd", "prettier" } },
            ["html"] = { { "prettierd", "prettier" } },
            ["markdown"] = { { "prettierd", "prettier" } },
            ["markdown.mdx"] = { { "prettierd", "prettier" } },
        },
    },
}
