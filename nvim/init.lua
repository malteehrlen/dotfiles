require('user.plugins')
require('user.cursorLine')
require('user.keymap').setAllKeymaps()
require('user.nvim-cmp-config')
require('user.lsp')
require('user.treesitter')

vim.opt.compatible = false
vim.opt.fixendofline = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.opt.ignorecase = true -- case insensitive searching
vim.opt.smartcase = true -- case-sensitive if expresson contains a capital letter
vim.opt.hlsearch = true
vim.opt.incsearch = true -- set incremental search, like modern browsers
vim.opt.lazyredraw = false -- don't redraw while executing macros
vim.opt.magic = true -- Set magic on, for regex
vim.opt.showmatch = true -- show matching braces
vim.opt.mat = 2 -- how many tenths of a second to blink


vim.opt.wildignore = '*.a,*.o,*.bmp,*.gif,*.ico,*.jpg,*.png,*.DS_Store,.git,*.hg,*.svn,*~,*.swp,*.tmp'

-- color and color scheme settings
vim.opt.encoding = 'utf8'
vim.opt.background = 'dark'
vim.cmd('colorscheme solarized')

-- vim-airline
local gset = vim.api.nvim_set_var
gset('airline_theme', 'solarized')
gset('airline_solarized_bg', 'dark')
gset('airline_powerline_fonts', 1)

vim.opt.number = true
vim.optautoindent = true -- automatically set indent of new line
vim.opt.smartindent = true
vim.opt.laststatus = 2 -- show the satus line all the time
-- language server stuff I guess (blindly copy pasted)
-- TextEdit might fail if hidden is not set.
vim.opt.hidden = true
-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false
-- Give more space for displaying messages.
vim.opt.cmdheight = 2
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300
-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append('c')
-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = 'yes'
