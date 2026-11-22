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
        go = { "goimports", "gofumpt" },
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
        dockerfile = { "hadolint" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = function()
          -- 未インストールのリンターでエラー通知が出ないよう、実行可能なものだけ走らせる
          local names = vim.tbl_filter(function(name)
            local linter = lint.linters[name]
            local cmd = type(linter) == "table" and linter.cmd or name
            if type(cmd) == "function" then cmd = cmd() end
            return vim.fn.executable(cmd) == 1
          end, lint.linters_by_ft[vim.bo.filetype] or {})
          if #names > 0 then
            lint.try_lint(names)
          end
        end,
      })
    end,
  },
}
