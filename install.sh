#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link_file() {
  local src="$1" dest="$2"
  if [[ -L "$dest" ]]; then
    local current_target
    current_target=$(readlink "$dest")
    if [[ "$current_target" == "$src" ]]; then
      echo "  skip: $dest (already linked)"
      return
    fi
  fi
  if [[ -e "$dest" ]]; then
    echo "  backup: $dest -> ${dest}.bak"
    mv "$dest" "${dest}.bak"
  fi
  ln -sf "$src" "$dest"
  echo "  link: $dest -> $src"
}

echo "==> Linking dotfiles from $DOTFILES_DIR"

for item in "$DOTFILES_DIR"/.*; do
  name="$(basename "$item")"
  [[ "$name" == "." || "$name" == ".." || "$name" == ".git" || "$name" == ".gitignore" ]] && continue

  if [[ "$name" == ".config" ]]; then
    mkdir -p "$HOME/.config"
    for config_item in "$item"/*; do
      [[ -e "$config_item" ]] || continue
      config_name="$(basename "$config_item")"
      link_file "$config_item" "$HOME/.config/$config_name"
    done
  else
    link_file "$item" "$HOME/$name"
  fi
done

echo ""
echo "==> Done!"
echo ""
echo "Post-install steps:"
echo "  1. Install dependencies:"
echo "       brew install neovim git-delta mise font-jetbrains-mono-nerd-font"
echo "       brew install powerlevel10k"
echo "       git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions"
echo "       git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting"
echo "  2. Open nvim to auto-install plugins:"
echo "       nvim"
echo "  3. Add API keys to ~/.zshrc (or ~/.zshenv):"
echo "       export ANTHROPIC_API_KEY=sk-ant-..."
