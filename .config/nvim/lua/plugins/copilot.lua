return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          -- accept は cmp の <Tab> fallback から呼ぶため無効化
          accept = false,
          accept_word = "<C-Right>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        yaml = true,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    build = "make tiktoken",
    opts = {
      model = "claude-sonnet-4-6",
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc = "Copilot Chat" },
      { "<leader>ce", "<cmd>CopilotChatExplain<CR>", mode = "v", desc = "Explain selection" },
      { "<leader>cr", "<cmd>CopilotChatReview<CR>", mode = "v", desc = "Review selection" },
      { "<leader>ct", "<cmd>CopilotChatTests<CR>", mode = "v", desc = "Generate tests" },
      { "<leader>cf", "<cmd>CopilotChatFix<CR>", mode = "v", desc = "Fix selection" },
    },
  },
}
