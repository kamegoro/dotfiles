return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        -- TypeScript / JavaScript
        "ts_ls",
        "eslint",
        -- Go
        "gopls",
        -- Python
        "pyright",
        "ruff",
        -- Lua
        "lua_ls",
        -- YAML / JSON
        "yamlls",
        "jsonls",
        -- Docker
        "dockerls",
        "docker_compose_language_service",
        -- SQL
        "sqlls",
        -- Helm
        "helm_ls",
        -- Terraform
        "terraformls",
        -- Markdown
        "marksman",
      },
      automatic_installation = true,
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = { diagnostics = { globals = { "vim" } } },
            },
          })
        end,
        ["gopls"] = function()
          require("lspconfig").gopls.setup({
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true,
                  shadow = true,
                },
                staticcheck = true,
                gofumpt = true,
              },
            },
          })
        end,
        ["yamlls"] = function()
          require("lspconfig").yamlls.setup({
            settings = {
              yaml = {
                schemas = {
                  kubernetes = "/*.yaml",
                  ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                  ["https://json.schemastore.org/chart.json"] = "/Chart.yaml",
                },
              },
            },
          })
        end,
        ["jsonls"] = function()
          require("lspconfig").jsonls.setup({
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
          })
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
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
  {
    "b0o/schemastore.nvim",
  },
}
