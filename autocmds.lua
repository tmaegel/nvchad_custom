-- lua/custom/autocmds

local autocmd = vim.api.nvim_create_autocmd

local opt = vim.opt

autocmd("FileType", {
   pattern = "python",
   callback = function()
      opt.wrap = true
      opt.tabstop = 4
      opt.shiftwidth = 4
      opt.softtabstop = 4
      opt.expandtab = true
      opt.smarttab = true
   end,
})

autocmd("FileType", {
   pattern = "sh",
   callback = function()
      opt.wrap = true
      opt.tabstop = 2
      opt.shiftwidth = 2
      opt.softtabstop = 2
      opt.expandtab = true
      opt.smarttab = true
   end,
})

autocmd("FileType", {
   pattern = "json",
   callback = function()
      opt.tabstop = 4
      opt.shiftwidth = 4
      opt.softtabstop = 4
      opt.expandtab = true
      opt.smarttab = true
   end,
})

autocmd("FileType", {
   pattern = "markdown,txt",
   callback = function()
      opt.wrap = true
      opt.tabstop = 4
      opt.shiftwidth = 4
      opt.softtabstop = 4
      opt.expandtab = true
      opt.smarttab = true
   end,
})

autocmd("FileType", {
   pattern = "yaml",
   callback = function()
      opt.tabstop = 2
      opt.shiftwidth = 2
      opt.softtabstop = 2
      opt.expandtab = true
      opt.smarttab = true
   end,
})

autocmd("FileType", {
   pattern = "lua",
   callback = function()
      opt.tabstop = 3
      opt.shiftwidth = 3
      opt.softtabstop = 3
      opt.expandtab = true
      opt.smarttab = true
   end,
})

vim.cmd [[
  augroup autoresize
    autocmd!
    autocmd VimResized * wincmd =
  augroup END
]]

-- Automatically format json
-- vim.cmd [[
--   autocmd FileType json autocmd BufWritePre <buffer> silent! %!python -m json.tool --indent 4
-- ]]

-- Sort entries requirements*.txt
vim.cmd [[
  augroup requirements
    autocmd!
    autocmd BufWritePre requirements*.txt silent! :sort i
  augroup END
]]
