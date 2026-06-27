return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        neotree = true,
        treesitter = true,
        notify = true,
        noice = true,
        telescope = { enabled = true },
        dropbar = { enabled = true },
        dashboard = true,
        mason = true,
        indent_blankline = { enabled = true },
        illuminate = { enabled = true, lsp = false },
        lsp_trouble = true,
        which_key = true,
        nvim_surround = true,
        fidget = true,
        render_markdown = true,
        avante = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
