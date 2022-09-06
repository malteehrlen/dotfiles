local api = vim.api
-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })

function setCursorLine()
  vim.opt.cursorline = true
  api.nvim_set_hl(0, "CursorLineNr", { cterm=none })
end

api.nvim_create_autocmd(
  { "InsertLeave", "WinEnter" },
  { pattern = "*", callback = setCursorLine, group = cursorGrp }
)
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

return setCursorLine()
