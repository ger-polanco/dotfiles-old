# ~/.zshrc

# Path append 
export PATH="$HOME/.local/bin:$PATH"

# Environment variables
export EDITOR=nvim
export TERMINAL=kitty
export BROWSER=firefox-developer-edition

# Shell Prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Dotfiles working tree
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Use exa instead of ls
# alias ls='eza --color=auto --icons'
alias ls='eza -lah --icons --git'
alias ll='eza -lh --color=auto --icons'
alias la='eza -a --color=auto --icons'

# History
HISTFILE="$HOME/.local/state/zsh/history"
[[ -d ${HISTFILE:h} ]] || mkdir -p "${HISTFILE:h}"
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups hist_ignore_space share_history inc_append_history

# Completion
[[ -d ~/.cache/zsh ]] || mkdir -p ~/.cache/zsh
autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Keys: emacs-style line editing + fzf (Ctrl-R history, Ctrl-T files, Alt-C cd)
bindkey -e
# fzf look: list on top; inside tmux, open as a centered popup (like Alt+F)
export FZF_DEFAULT_OPTS="--layout=reverse --border=rounded --info=inline"
export FZF_CTRL_R_OPTS="--tmux center,80%,60%"
export FZF_CTRL_T_OPTS="--tmux center,80%,60%"
export FZF_ALT_C_OPTS="--tmux center,80%,60%"
command -v fzf >/dev/null && source <(fzf --zsh)

# Auto-start/attach tmux on kitty open (skipped if NOTMUX is set)
if [ -z "$TMUX" ] && [ -z "$NOTMUX" ]; then
    if ! tmux has-session 2>/dev/null; then
        ~/.local/bin/tmux-sessions init
        exec tmux attach-session -t main
    else
        exec tmux attach-session
    fi
fi
