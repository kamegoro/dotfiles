return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
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
            Lua = { diagnostics = { globals = { "vim" } } },
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
