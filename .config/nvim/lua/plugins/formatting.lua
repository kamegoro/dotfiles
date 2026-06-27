return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        desc = "Format",
      },
    },
    opts = {
      formatters_by_ft = {
        go = { "gofumpt", "goimports" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        python = { "ruff_format" },
        sql = { "sql_formatter" },
        lua = { "stylua" },
        terraform = { "terraform_fmt" },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "BufReadPost",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        go = { "golangcilint" },
        python = { "ruff" },
        dockerfile = { "hadolint" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
