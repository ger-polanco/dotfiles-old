-- ~/.config/nvim/lua/roger/binds.lua

-- Mod key
vim.g.mapleader = " "

-- Keybinds
local bind = vim.keymap.set

-- System copy
bind({ "n", "v", "o" }, "<leader>y", '"+y', { noremap = true, desc = "Yank motion to clipboard" })

-- System paste
bind({ "n", "v", "o" }, "<leader>p", '"+p', { desc = "Paste after from clipboard" }) -- Normal mode: Paste after cursor from system clipboard

-- Format file
bind("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format file" })

-- Completions
vim.keymap.set('i', '<C-o>', function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-x><C-o>', true, false, true), 'n')
end, { desc = "Omni Completion" })


-- Keep cursor centered
bind("n", "<C-d>", "<C-d>zz")
bind("n", "<C-u>", "<C-u>zz")

-- Keep search centered
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")

-- Diagnostics
vim.keymap.set("n", "<leader>d", function()
    local bufnr, winid = vim.diagnostic.open_float(nil, {
        focusable = true,
    })

    if winid then
        vim.api.nvim_set_current_win(winid)

        -- Close with <leader>d
        vim.keymap.set("n", "<leader>d", function()
            vim.api.nvim_win_close(winid, true)
        end, { buffer = bufnr, silent = true })

    end
end)
