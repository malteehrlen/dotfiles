-- Modernized LSP Configuration for Neovim 0.11+
require("user.lsp.mason")
require("user.lsp.handlers").setup()

-- Ensure 'vue-language-server' is installed via Mason
-- Then, manually locate the Volar plugin path:
local vue_ls_path = vim.fn.expand("$MASON/packages/vue-language-server")
local vue_plugin_path = vue_ls_path .. "/node_modules/@vue/language-server"

-- Now configure ts_ls (TypeScript) to load the Vue plugin natively
vim.lsp.config("ts_ls", {
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

-- Enable the server globally using the modern API
vim.lsp.enable("ts_ls")

-- Global keymaps execution upon LSP connection
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    desc = 'LSP keymaps',
    callback = function(event)
        local opts = { buffer = event.buf, noremap = true, silent = true }
        
        -- Utilizing modern, simplified Lua calling syntax instead of wrap-strings
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        
        -- Diagnostics mapping cleanups
        vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[g", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, opts)
        vim.keymap.set("n", "gl", function() vim.diagnostic.open_float({ border = "rounded" }) end, opts)
        vim.keymap.set("n", "]g", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.setqflist, opts)
        
        -- Native formatting macro wrapper
        vim.api.nvim_buf_create_user_command(event.buf, 'Format', function()
            vim.lsp.buf.format({ async = true })
        end, {})
    end,
})

