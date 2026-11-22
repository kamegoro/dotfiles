# dotfiles

macOS 向けの個人 dotfiles。シンボリックリンク方式で管理。

## Quick Start

```bash
git clone https://github.com/kamegoro/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Structure

```
~/dotfiles/
├── .config/
│   ├── nvim/               # Neovim (lazy.nvim)
│   │   ├── init.lua
│   │   ├── lazy-lock.json
│   │   └── lua/plugins/
│   ├── ghostty/
│   │   └── config          # Ghostty ターミナル設定
│   ├── git/
│   │   └── ignore          # global gitignore
│   └── mise/
│       └── config.toml     # ランタイムバージョン管理
├── .gitconfig              # git 設定
├── .zshrc                  # zsh 設定
├── .zsh_aliases            # エイリアス
├── .p10k.zsh               # Powerlevel10k テーマ設定
├── .vimrc                  # vim fallback 設定
├── .ideavimrc              # IdeaVim 設定
└── install.sh              # シンボリックリンク作成スクリプト
```

## Dependencies

### 必須

| ツール | インストール |
|--------|------------|
| [Neovim](https://neovim.io/) >= 0.12 | `brew install neovim` |
| [JetBrains Mono Nerd Font](https://www.nerdfonts.com/) | `brew install font-jetbrains-mono-nerd-font` |
| [mise](https://mise.jdx.dev/) | `brew install mise` |
| [git-delta](https://github.com/dandavison/delta) | `brew install git-delta` |
| [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter) | `brew install tree-sitter-cli`（nvim-treesitter がパーサーのビルドに使う） |
| [Ghostty](https://ghostty.org/) | `brew install --cask ghostty` |

### zsh プラグイン

```bash
brew install powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
```

## Neovim

プラグインマネージャー: [lazy.nvim](https://github.com/folke/lazy.nvim)

| カテゴリ | プラグイン |
|----------|-----------|
| カラースキーム | catppuccin (mocha) |
| UI | lualine, bufferline, noice, nvim-notify, dashboard-nvim, dropbar |
| ファイラー | neo-tree |
| ファジーファインダー | telescope + fzf-native |
| LSP | nvim-lspconfig, mason, mason-lspconfig |
| 補完 | nvim-cmp, LuaSnip |
| フォーマット | conform.nvim |
| リント | nvim-lint |
| シンタックス | nvim-treesitter (main), nvim-treesitter-textobjects |
| Git | gitsigns |
| AI | Copilot, CopilotChat, claude-code.nvim |
| 言語サポート | typescript-tools, go.nvim |
| その他 | todo-comments, vim-illuminate, neoscroll, fidget, which-key |

### セットアップ後

1. nvim を起動するとプラグインと treesitter パーサーが自動インストールされる
2. `:Lazy sync` で最新版に更新（treesitter パーサーは `:TSUpdate`）
3. `:checkhealth` で LSP・treesitter に ERROR が無いことを確認する

### シークレット

API キーなどマシン固有の値は `~/.zshrc.local` に書く（`.zshrc` から読み込まれる）。
`~/.zshrc` はこのリポジトリへのシンボリックリンクなので、直接書くと公開リポジトリにコミットされてしまう。

```bash
echo 'export SOME_API_KEY=...' >> ~/.zshrc.local
chmod 600 ~/.zshrc.local
```
