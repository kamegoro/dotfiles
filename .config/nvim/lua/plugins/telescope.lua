return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
          layout_strategy = "horizontal",
          sorting_strategy = "ascending",
          layout_config = { prompt_position = "top" },
        },
      })
      telescope.load_extension("fzf")
    end,
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>g", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Buffer search" },
      { "<leader>b", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>h", "<cmd>Telescope help_tags<CR>", desc = "Help" },
      { "<leader>r", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
      { "<leader>sd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
      { "<leader>sk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
      { "<leader>sg", "<cmd>Telescope git_status<CR>", desc = "Git status" },
    },
  },
}
