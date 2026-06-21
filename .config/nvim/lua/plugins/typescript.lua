return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {
      settings = {
        tsserver_file_preferences = {
          importModuleSpecifierPreference = "non-relative",
        },
        jsx_close_tag = { enable = true },
      },
    },
    keys = {
      { "<leader>to", "<cmd>TSToolsOrganizeImports<CR>", desc = "TS: Organize imports" },
      { "<leader>ta", "<cmd>TSToolsAddMissingImports<CR>", desc = "TS: Add missing imports" },
      { "<leader>tu", "<cmd>TSToolsRemoveUnused<CR>", desc = "TS: Remove unused" },
      { "<leader>tr", "<cmd>TSToolsRenameFile<CR>", desc = "TS: Rename file" },
    },
  },
}
