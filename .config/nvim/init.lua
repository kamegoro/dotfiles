-- ターミナルのカラースキームを有効にする
vim.opt.termguicolors = true

-- Lazy.nvimのインストールと初期化
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",  -- 最新の安定版をインストール
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグインのセットアップ
require("lazy").setup({
  -- 外観とテーマ関連
  'folke/tokyonight.nvim',  -- カラースキーム
  'kyazdani42/nvim-web-devicons',  -- アイコンのサポート

  -- 編集補助ツール
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},  -- Treesitterによるシンタックスハイライト
  'nvim-lua/plenary.nvim',  -- ヘルパーツールライブラリ
  {'nvim-telescope/telescope.nvim', tag = '0.1.0'},  -- 高機能検索ツール
  'nvim-lualine/lualine.nvim',  -- ステータスライン
  'yamatsum/nvim-cursorline',  -- カーソル行をハイライト
  'windwp/nvim-ts-autotag',  -- HTMLタグの自動補完

  -- コード補完
  {'neoclide/coc.nvim', branch = 'release'},  -- コード補完とサジェスト

  -- ファイル・バッファ管理
  'nvim-tree/nvim-tree.lua',  -- ファイルツリー
  'akinsho/bufferline.nvim',  -- 複数バッファの管理
  'akinsho/toggleterm.nvim',  -- ターミナル管理

  -- その他
  'lewis6991/gitsigns.nvim',  -- Git情報の表示
  'dinhhuy258/git.nvim',  -- Gitインターフェース
  'norcalli/nvim-colorizer.lua',  -- 色の強調表示
  'pocco81/auto-save.nvim',  -- 自動保存
  'windwp/nvim-autopairs',  -- 自動ペア補完
  'numToStr/Comment.nvim',  -- コメントアウトを簡単に
  'pechorin/any-jump.vim',  -- 高速ジャンプ
  'echasnovski/mini.indentscope',  -- インデントスコープ
})

-- プラグイン設定の読み込み
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
