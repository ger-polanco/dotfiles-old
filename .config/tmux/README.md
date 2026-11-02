# tmux config

Session-based workspace setup. Every "workspace" is a named tmux session.
Opening a new Kitty window attaches to the last active session automatically.

## Keybinds

| Key | Action |
|---|---|
| `Alt+Enter` | Jump to `main` session |
| `Alt+M` | Jump to `monitor` session |
| `Alt+S` | Jump to `spotify` session |
| `Alt+F` | Fuzzy-find a folder in `$HOME` and open/switch to its session |
| `Alt+1–9` | Switch to user session by index (order defined in harpoon) |
| `Alt+Tab` | Open session manager (harpoon) |
| `Alt+Shift+X` | Kill tmux server (confirmation prompt) |
| `Ctrl+Space` | Fallback tmux prefix for anything else |

### Window navigation (within a session)

| Key | Action |
|---|---|
| `Alt+q` | Window 1 |
| `Alt+w` | Window 2 |
| `Alt+e` | Window 3 |
| `Alt+r` | Window 4 |
| `Alt+t` | Window 5 |
| `Alt+y` | Window 6 |
| `Alt+u` | Window 7 |
| `Alt+i` | Window 8 |
| `Alt+o` | Window 9 |
| `Alt+p` | Window 10 |

### Harpoon (`Alt+Tab`)

| Key | Action |
|---|---|
| `j` / `k` | Navigate up/down |
| `J` / `K` | Reorder session up/down |
| `Space` | Open window manager for selected session (user sessions only) |
| `dd` | Mark session for deletion (shown in red, not killed yet) |
| `Enter` | Confirm — switch to selected, kill marked, save order |
| `Esc` | Cancel — no changes applied |

Predefined sessions (`↵ main`, `m monitor`, `s spotify`) appear at the top in cyan.
They cannot be moved, deleted, or reordered.

#### Window manager (`Space` in harpoon)

| Key | Action |
|---|---|
| `j` / `k` | Navigate windows |
| `J` / `K` | Reorder window up/down |
| `Enter` | Switch to selected window |
| `r` | Rename selected window, persist to `.tmux-session` |
| `Enter` on `+ add window` | Prompt for name, create window, persist to `.tmux-session` |
| `Esc` | Back to session list |

---

## Per-project window layout (`.tmux-session`)

Place a `.tmux-session` file in a project root to define named windows that are
created automatically when the session is first opened via `Alt+F`.

```
editor
shell
run
```

One window name per line. Windows are created in order; window 1 gets the first name.
New windows can also be added at runtime via `Space` in harpoon — they are appended
to `.tmux-session` automatically.

Add `.tmux-session` to `.gitignore` and `.dockerignore` to keep it local.

---

## Scripts

All scripts live in `~/.local/bin/`:

| Script | Purpose |
|---|---|
| `tmux-init` | Creates predefined sessions on first launch |
| `tmux-sessionizer` | Fuzzy folder search (`Alt+F`) |
| `tmux-switch-index` | Index-based switching (`Alt+1–9`) |
| `tmux-harpoon` | Session + window manager UI (`Alt+Tab`) |
| `tmux-session-cleanup` | Removes closed sessions from the order file |

Session order for `Alt+1–9` and the harpoon list is persisted in
`~/.config/tmux/session_order` (one session name per line).

---

## Adding a new predefined session

Predefined sessions are created automatically on first launch by `tmux-init`
and are pinned in the harpoon list with a letter keybind.

### Folder-only session

**1. Add the session to `tmux-init`:**

```bash
if ! tmux has-session -t mysession 2>/dev/null; then
    tmux new-session -ds mysession -c "$HOME/path/to/folder"
fi
```

**2. Add a keybind in `tmux.conf`:**

```
bind -n M-x switch-client -t mysession
```

**3. Register the key in `tmux-harpoon`:**

```bash
PREDEFINED_LIST=("main" "btop" "mysession")
PREDEFINED="main btop mysession"
declare -A PREDEFINED_KEYS=(["main"]="↵" ["btop"]="b" ["mysession"]="x")
```

### Session with a command (like btop)

**1. Add to `tmux-init`:**

```bash
if ! tmux has-session -t myapp 2>/dev/null; then
    tmux new-session -ds myapp -c "$HOME"
    tmux send-keys -t myapp "myapp" Enter
fi
```

**2–3.** Same as above.

> The session stays alive after the program exits — the user is dropped to a
> shell prompt. The program is only launched once (on first tmux start).
> To restart it, simply run the command manually inside the session.

---

## Sessionizer exclusions (`Alt+F`)

Folders excluded from the fuzzy search are listed in `tmux-sessionizer`.
To add more, extend the `-name` list in the `find` command:

```bash
-name '.mydir' -o \
```
