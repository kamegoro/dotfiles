# dotfiles

## Setup

```bash
git clone https://github.com/kamegoro/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## Structure

```
~/dotfiles/
├── .zshrc
├── .zsh_aliases
├── .vimrc
├── .ideavimrc
├── .gitconfig
├── .p10k.zsh
├── .config/
│   ├── git/ignore
│   └── mise/config.toml
├── install.sh
└── .ignore         # files to skip during install
```

## Dependencies

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k): `brew install powerlevel10k`
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [delta](https://github.com/dandavella/delta): `brew install git-delta`
- [mise](https://mise.jdx.dev/): `brew install mise`
- [fzf](https://github.com/junegunn/fzf): managed via mise
