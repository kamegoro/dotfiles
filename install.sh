#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
IGNORE_FILE="$DOTFILES_DIR/.ignore"

is_ignored() {
  local name="$1"
  [[ -f "$IGNORE_FILE" ]] || return 1
  grep -qxF "$name" "$IGNORE_FILE"
}

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
  [[ "$name" == "." || "$name" == ".." || "$name" == ".git" || "$name" == ".gitignore" || "$name" == ".ignore" ]] && continue
  is_ignored "$name" && { echo "  ignore: $name"; continue; }

  if [[ "$name" == ".config" ]]; then
    mkdir -p "$HOME/.config"
    for config_item in "$item"/*; do
      [[ -e "$config_item" ]] || continue
      config_name="$(basename "$config_item")"
      is_ignored "$config_name" && { echo "  ignore: .config/$config_name"; continue; }
      link_file "$config_item" "$HOME/.config/$config_name"
    done
  else
    link_file "$item" "$HOME/$name"
  fi
done

# VS Code settings
echo ""
echo "==> Linking VS Code settings"
VSCODE_DIR="$HOME/Library/Application Support/Code/User"
if [[ -d "$VSCODE_DIR" ]]; then
  link_file "$DOTFILES_DIR/vscode/settings.json" "$VSCODE_DIR/settings.json"
else
  echo "  skip: VS Code not found"
fi

echo ""
echo "==> Done!"
echo ""
echo "Post-install steps:"
echo "  1. Install vscode-neovim extension:"
echo "       code --install-extension asvetliakov.vscode-neovim"
echo "  2. Uninstall old vscodevim:"
echo "       code --uninstall-extension vscodevim.vim"
echo "  3. Install vim-plug: curl -fLo ~/.vim/autoload/plug.vim --create-dirs \\"
echo "       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
echo "  4. Install vim plugins: vim +PlugInstall +qall"
echo "  5. Install zsh plugins if missing:"
echo "       git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions"
echo "       git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting"
