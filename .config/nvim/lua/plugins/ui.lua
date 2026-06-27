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
    opts = {
      exclude = {
        filetypes = { "dashboard", "help", "neo-tree", "Trouble", "lazy", "mason", "toggleterm", "markdown", "text" },
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        suppress_on_insert = true,
        display = { done_ttl = 2 },
      },
      notification = {
        override_vim_notify = false,
      },
    },
  },
  {
    "karb94/neoscroll.nvim",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
      hide_cursor = true,
      easing = "sine",
    },
  },
}
