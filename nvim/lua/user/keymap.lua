local M = {}
function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
function M.setAllKeymaps()
        vim.g.mapleader = ','
        -- json format
        M.map("n", "<leader>j", ":%!python3 -m json.tool<CR>:set syntax=json<CR>")
        -- jump list backwards
        M.map("n", "<leader>,", "<C-o>")
        -- jump list forwards
        M.map("n", "<leader>.", "<C-i>")
        -- ripgrep filenames
        M.map("n", "<C-p>", ":Files<Cr>")
        -- ripgrep in file content
        M.map("n", "<C-o>", ":Rg<Cr>")
        -- ripgrep visual selection in all files
        _G.rgVisual = require('user.rgVisual').ripgrepVisual
        M.map("v", "<C-o>",":lua rgVisual()<CR>", { silent = true })
        -- open floating doc window as permanent split
        M.map("n", "<leader>K", ":sp<CR>:execute('resize ' . line('$'))<CR><C-w>j")
        -- NERDTree
        M.map("n", "<leader>m", ":NERDTreeFocus<CR>")
        M.map("n", "<leader>n", ":NERDTreeFind<CR>")
        -- copy selection and wrap in triple single qoutes into system buffer, slack code block style
        M.map("v", "<leader>y", "\"*y<CR>:let @* = \"```\\n\" . @* . \"```\"<CR>", { silent = true })
        -- copy file path and line number into system buffer like so: `lua/user/keymap.lua:31`
        M.map("n", "<leader>F", ":let @* = \"`\" . expand(\"%\") . \":\" . line(\".\") . \"`\"<CR>", { silent = true })
end

return M
