return {
  "stevearc/conform.nvim",
  opts = function ()
    return {
      formatters_by_ft = {
        ["markdown"] = { { "prettierd", "prettier" } },
        ["markdown.mdx"] = { { "prettierd", "prettier" } },
      },
    }
  end
}
