local M = {}

M.group = vim.api.nvim_create_augroup("nihilc", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = M.group,
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

autocmd("BufWritePre", {
  desc = "Remove white spaces before save",
  group = M.group,
  command = "%s/\\s\\+$//e"
})

autocmd("TermOpen", {
  desc    = "Start terminal in insert mode",
  group   = M.group,
  command = "startinsert | set winfixheight | setlocal nospell"
})

return M
