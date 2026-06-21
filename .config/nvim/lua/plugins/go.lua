return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "CmdlineEnter",
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
    opts = {},
    keys = {
      { "<leader>gt", "<cmd>GoTest<CR>", desc = "Go: Run tests" },
      { "<leader>gf", "<cmd>GoTestFunc<CR>", desc = "Go: Test function" },
      { "<leader>gc", "<cmd>GoCoverage<CR>", desc = "Go: Coverage" },
      { "<leader>ge", "<cmd>GoIfErr<CR>", desc = "Go: if err" },
      { "<leader>gs", "<cmd>GoFillStruct<CR>", desc = "Go: Fill struct" },
      { "<leader>gi", "<cmd>GoImpl<CR>", desc = "Go: Implement interface" },
    },
  },
}
