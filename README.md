# Dotfiles

Personal Arch Linux config, managed as a bare git repo checked out into `$HOME`.
Installed automatically by [arch-bootstrap](https://github.com/ger-polanco/arch-bootstrap).

## What's tracked

| Area | Files |
|---|---|
| Shell | `.zshrc`, `.zprofile` (starts Hyprland on TTY1), `.bashrc` (fallback) |
| Prompt | `.config/starship/` |
| Desktop | `.config/hypr/` (Lua config, v0.55+), `.config/waybar/` |
| Terminal | `.config/kitty/`, `.config/tmux/`, `.local/bin/tmux-*` |
| Editor | `.config/nvim/` (lazy.nvim) |
| Apps | `.config/btop/` |
| Misc | `.gitconfig`, `.clang-format`, `.config/user-dirs.dirs` |

## Restore on a new machine

```sh
git clone --bare https://github.com/ger-polanco/dotfiles.git ~/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout            # move away any conflicting files it lists, then retry
dotfiles config status.showUntrackedFiles no
dotfiles remote set-url origin git@github.com:ger-polanco/dotfiles.git
```

## Daily use

```sh
dotfiles status
dotfiles add <file> && dotfiles commit -m "..." && dotfiles push
```
