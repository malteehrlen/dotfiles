require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓"
        }
    }
}
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "kotlin_language_server", "gopls", "tsserver", "eslint", "html", "cssls", "jsonls" },
}

local lspconfig = require("lspconfig")
local default_opts = {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
}

require('mason-lspconfig').setup_handlers({
  function(server)
    lspconfig[server].setup(default_opts)
  end,
  ['lua_ls'] = function()
    lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", require("user.lsp.settings.sumneko_lua"), default_opts))
  end,
  ['jsonls'] = function()
    lspconfig.jsonls.setup(vim.tbl_deep_extend("force", require("user.lsp.settings.jsonls"), default_opts))
  end,
  ['jdtls'] = function()
    lspconfig.jdtls.setup(vim.tbl_deep_extend("force", require("user.lsp.settings.jdtls"), default_opts))
  end,
})
