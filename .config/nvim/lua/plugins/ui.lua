return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "catppuccin" },
    },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        offsets = { { filetype = "neo-tree", text = "Explorer", text_align = "center" } },
      },
    },
    keys = {
      { "<S-h>", ":BufferLineCyclePrev<CR>", desc = "Prev buffer" },
      { "<S-l>", ":BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<leader>x", ":bdelete<CR>", desc = "Close buffer" },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}
