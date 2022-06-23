-- custom/utils

local M = {}
local cmd = vim.cmd

M.lsp_symbol = function(name, icon)
   -- Set symbols for lsp diagnostics
   -- local hl = "DiagnosticSign" .. name
   -- vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })

   -- Set highlight line number for lsp diagnostics
   local hl_s = "DiagnosticSign" .. name
   local hl_ln = "DiagnosticLineNr" .. name
   vim.fn.sign_define(hl_s, { text = "", linehl = "", numhl = hl_ln, texthl = hl_s })
end

-- Set border style
M.border = function(hl_name)
   return {
      { "┌", hl_name },
      { "─", hl_name },
      { "┐", hl_name },
      { "│", hl_name },
      { "┘", hl_name },
      { "─", hl_name },
      { "└", hl_name },
      { "│", hl_name },
   }
end

--
-- Highlights functions
--

-- Define bg color
-- @param group Group
-- @param color Color

M.bg = function(group, col)
   cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, col)
   cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

return M
