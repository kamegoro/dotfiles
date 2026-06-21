# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------
# Options
# -----------------------------------------------------------
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt AUTO_CD
setopt NO_BEEP

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000

# -----------------------------------------------------------
# PATH
# -----------------------------------------------------------
typeset -U path

path=(
  $HOME/.local/bin
  $HOME/.bun/bin
  $HOME/.cargo/bin
  $HOME/.pub-cache/bin
  $(go env GOPATH 2>/dev/null)/bin
  ${KREW_ROOT:-$HOME/.krew}/bin
  /opt/homebrew/opt/mysql-client/bin
  /Applications/IntelliJ\ IDEA\ CE.app/Contents/MacOS
  $path
)

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
path=($ANDROID_HOME/emulator $ANDROID_HOME/platform-tools $path)

# Dotnet (via mise)
if DOTNET_ROOT=$(mise where dotnet 2>/dev/null); then
  export DOTNET_ROOT
  path=($DOTNET_ROOT $path)
fi

export PATH

# -----------------------------------------------------------
# Tools
# -----------------------------------------------------------
# mise
eval "$(mise activate zsh)"

# Cargo
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# bun completions
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# kubectl
if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi

# -----------------------------------------------------------
# Completions
# -----------------------------------------------------------
fpath=(~/.zsh/completion $fpath)

# -----------------------------------------------------------
# Aliases
# -----------------------------------------------------------
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

# -----------------------------------------------------------
# Plugins & Theme
# -----------------------------------------------------------
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
