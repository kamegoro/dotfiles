return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "│" },
      },
    },
    keys = {
      { "]g", "<cmd>Gitsigns next_hunk<CR>", desc = "Next hunk" },
      { "[g", "<cmd>Gitsigns prev_hunk<CR>", desc = "Prev hunk" },
      { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
      { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame line" },
    },
  },
}
