return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "lua", "typescript", "tsx", "javascript",
        "go", "python", "rust", "json", "yaml",
        "html", "css", "markdown", "bash",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
