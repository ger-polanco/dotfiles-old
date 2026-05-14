# ~/.zshrc

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
export PATH="$HOME/.local/bin:$PATH"
