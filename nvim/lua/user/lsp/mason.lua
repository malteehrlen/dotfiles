require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓"
        }
    }
}
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "kotlin_language_server", "gopls", "vue_ls", "ts_ls","html", "cssls", "jsonls" },
}
