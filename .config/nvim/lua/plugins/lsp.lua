return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "eslint",
        "gopls",
        "pyright",
        "ruff",
        "lua_ls",
        "yamlls",
        "jsonls",
        "dockerls",
        "docker_compose_language_service",
        "sqlls",
        "helm_ls",
        "terraformls",
        "marksman",
      },
      automatic_installation = true,
      -- LSP setup は nvim-lspconfig 側で vim.lsp.config/enable を使って手動管理するため
      -- mason-lspconfig のデフォルトハンドラー（全インストール済みサーバーを自動 enable）を無効化
      handlers = {
        function(_) end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "b0o/schemastore.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        eslint = {},
        pyright = {},
        ruff = {},
        dockerls = {},
        docker_compose_language_service = {},
        sqlls = {},
        helm_ls = {},
        terraformls = {},
        marksman = {},
        gopls = {
          settings = {
            gopls = {
              analyses = { unusedparams = true, shadow = true },
              staticcheck = true,
              gofumpt = true,
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = { vim.env.VIMRUNTIME },
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                kubernetes = "/*.yaml",
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://json.schemastore.org/chart.json"] = "/Chart.yaml",
              },
            },
          },
        },
        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },
      }

      for name, config in pairs(servers) do
        config.capabilities = capabilities
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end
      -- typescript-tools.nvim を使うため ts_ls を明示的に無効化
      vim.lsp.enable("ts_ls", false)
    end,
    keys = {
      { "gd", vim.lsp.buf.definition, desc = "Go to definition" },
      { "gr", vim.lsp.buf.references, desc = "References" },
      { "gi", vim.lsp.buf.implementation, desc = "Implementation" },
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code action" },
      { "]d", vim.diagnostic.goto_next, desc = "Next diagnostic" },
      { "[d", vim.diagnostic.goto_prev, desc = "Prev diagnostic" },
      { "<leader>d", vim.diagnostic.open_float, desc = "Diagnostic float" },
    },
  },
  { "b0o/schemastore.nvim", lazy = true },
}
