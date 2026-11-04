# tmux

Session-per-project workflow. Opening kitty attaches to tmux (`Super+Shift+Enter` opens kitty without tmux).

- **Pinned sessions:** `main` (everyday shell) and `monitor` (btop). They're created on first launch and have their own keys.
- **Project sessions:** opened with `Alt+F` and numbered `Alt+1–9` in the order you set in harpoon.

## Keys (no prefix needed)

| Key | Action |
|---|---|
| `Alt+Enter` / `Alt+M` | Jump to `main` / `monitor` |
| `Alt+F` | Fuzzy-find a folder, then open or switch to its session |
| `Alt+1–9` | Jump to project session N |
| `Alt+Tab` | Harpoon: manage sessions and windows |
| `Alt+N` | New window in the current directory (asks for a name) |
| `Alt+Shift+1–9` | Jump to window N |
| `Alt+Shift+Tab` | Window list for this session: reorder, rename, add |
| `Alt+V` | Copy mode: `v` select, `Ctrl-v` block, `y` copy to clipboard |
| `Alt+Shift+X` | Kill the tmux server (asks first) |
| `Ctrl+Space` | Prefix for anything else |

Selecting text with the mouse also copies it.

### Harpoon (`Alt+Tab`)
`j`/`k` move · `J`/`K` reorder · `dd` mark for deletion · `Space` window menu · `Enter` apply · `Esc` cancel.
In the window list (`Alt+Shift+Tab`, or `Space` on a project in harpoon): `j`/`k` move · `J`/`K` reorder · `r` rename · `Enter` on `+ add window` creates one. In project sessions, these changes are saved to `.tmux-session`.

## Per-project windows: `.tmux-session`
Put this file in a project root. Each line is `name` or `name: command`:
```
editor: nvim .
run
```
`Alt+F` creates these windows when it first opens the session. Add `.tmux-session` to the project's `.gitignore`.

## Scripts (`~/.local/bin`)
- `tmux-sessions`: pinned sessions (edit `PINNED` there to add one), ordering, `Alt+1–9`, cleanup, and saving `.tmux-session`.
- `tmux-sessionizer`: `Alt+F`.
- `tmux-harpoon`: `Alt+Tab`.

The session order is stored in `~/.local/state/tmux/session_order`.
