vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'folke/tokyonight.nvim',
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
  {'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  'nvim-lua/plenary.nvim',
  {'nvim-telescope/telescope.nvim', tag = '0.1.0' },
  'kyazdani42/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  },
  {'neoclide/coc.nvim', branch='release'},
  'yamatsum/nvim-cursorline',
  'pechorin/any-jump.vim',
  {'numToStr/Comment.nvim', config = function() require('Comment').setup() end},
  'norcalli/nvim-colorizer.lua',
  'dinhhuy258/git.nvim',
  'lewis6991/gitsigns.nvim',
  'windwp/nvim-ts-autotag',
  'pocco81/auto-save.nvim',
  'akinsho/bufferline.nvim',
  'windwp/nvim-autopairs',
  'echasnovski/mini.indentscope',
  'akinsho/toggleterm.nvim',
})

require("plugins.auto_save")
require("plugins.bufferline")
require("plugins.colorizer")
require("plugins.colorscheme")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.nvim_cursorline")
require("plugins.nvim_tree")
require("plugins.nvim_web_devicons")
require("plugins.toggleterm")
