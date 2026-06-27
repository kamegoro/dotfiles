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
| シンタックス | nvim-treesitter |
| Git | gitsigns |
| AI | avante.nvim (Claude), Copilot, CopilotChat, claude-code.nvim |
| 言語サポート | typescript-tools, go.nvim |
| その他 | todo-comments, vim-illuminate, neoscroll, fidget, which-key |

### セットアップ後

1. nvim を起動するとプラグインが自動インストールされる
2. `:Lazy sync` で最新版に更新
3. API キーをシェル環境変数に追加:

```bash
export ANTHROPIC_API_KEY=sk-ant-...
```
