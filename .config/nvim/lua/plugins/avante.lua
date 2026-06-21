return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "MeanderingProgrammer/render-markdown.nvim",
    },
    opts = {
      provider = "claude",
      claude = {
        model = "claude-sonnet-4-6",
        max_tokens = 8192,
      },
      behaviour = {
        auto_suggestions = false,
        auto_set_keymaps = true,
      },
      hints = { enabled = true },
    },
    keys = {
      { "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Avante: Ask" },
      { "<leader>ae", "<cmd>AvanteEdit<CR>", mode = "v", desc = "Avante: Edit selection" },
    },
  },
}
