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
        M.map("n", "<leader>j", ":%!python -m json.tool<CR>:set syntax=json<CR>")

        -- jumping
        M.map("n", "<leader>,", "<C-o>")
        M.map("n", "<leader>.", "<C-i>")
        -- searching
        M.map("n", "<C-p>", ":Files<Cr>")
        M.map("n", "<C-o>", ":Rg<Cr>")
        _G.rgVisual = require('user.rgVisual').ripgrepVisual
        M.map("v", "<C-o>",":lua rgVisual()<CR>", { silent = true })
        M.map("n", "<leader>K", ":sp<CR>:execute('resize ' . line('$'))<CR><C-w>j")
        -- NERDTree
        M.map("n", "<leader>m", ":NERDTreeFocus<CR>")
        M.map("n", "<leader>n", ":NERDTreeFind<CR>")
end

return M
