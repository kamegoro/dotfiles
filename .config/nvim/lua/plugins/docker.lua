return {
  {
    "dgrbrady/nvim-docker",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    lazy = true,
    keys = {
      { "<leader>dc", "<cmd>DockerContainers<CR>", desc = "Docker: Containers" },
      { "<leader>di", "<cmd>DockerImages<CR>", desc = "Docker: Images" },
    },
  },
}
