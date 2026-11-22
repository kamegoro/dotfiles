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
setopt EXTENDED_HISTORY  # 実行日時も記録する（不要なツールの棚卸しに使える）

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000

# -----------------------------------------------------------
# PATH
# -----------------------------------------------------------
typeset -U path

path=(
  $HOME/.local/bin
  $HOME/.pub-cache/bin
  $HOME/go/bin
  ${KREW_ROOT:-$HOME/.krew}/bin
  $path
)

export PATH

# -----------------------------------------------------------
# Tools
# -----------------------------------------------------------
# SDKMAN (Java / Maven)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# mise: 他の PATH 変更より後に有効化して、mise 管理のツールを優先させる
eval "$(mise activate zsh)"

# fzf
command -v fzf &>/dev/null && source <(fzf --zsh)

# kubectl
if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi

# -----------------------------------------------------------
# Aliases
# -----------------------------------------------------------
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

# -----------------------------------------------------------
# Machine-local settings and secrets (not tracked by this repo)
# -----------------------------------------------------------
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# -----------------------------------------------------------
# Plugins & Theme
# -----------------------------------------------------------
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
