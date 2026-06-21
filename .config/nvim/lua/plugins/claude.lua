return {
  {
    "greggh/claude-code.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<CR>", desc = "Claude Code toggle" },
      { "<leader>as", "<cmd>ClaudeCodeSend<CR>", mode = "v", desc = "Send to Claude Code" },
    },
    opts = {
      window = {
        position = "right",
        width = 60,
        hide_on_escape = false,
      },
      refresh = { enable = true },
    },
  },
}
