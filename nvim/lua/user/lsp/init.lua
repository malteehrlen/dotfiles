local lspconfig = require("lspconfig")
require("user.lsp.mason")
require("user.lsp.handlers").setup()

-- Ensure 'vue-language-server' is installed via Mason
-- Then, manually locate the Volar plugin path:
local vue_ls_path = vim.fn.expand("$MASON/packages/vue-language-server")
local vue_plugin_path = vue_ls_path .. "/node_modules/@vue/language-server"

-- Now configure ts_ls (TypeScript) to load the Vue plugin
lspconfig.ts_ls.setup({
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_plugin_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "vue" },
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    desc = 'LSP keymaps',
    callback = function(event)
        local opts = { buffer = event.buf, noremap = true, silent = true }
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        vim.keymap.set("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
        vim.keymap.set("n", "[g", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
        vim.keymap.set(
            "n",
            "gl",
            '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
            opts
        )
        vim.keymap.set("n", "]g", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
        vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
        vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts)
        vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]
    end,
})
