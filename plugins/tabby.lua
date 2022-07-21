-- custom/plugins/tabby

local colors = require "custom.colors"
local chadrc = require "custom.chadrc"

local filename = require "tabby.filename"
local util = require "tabby.util"

local hl_tabline = chadrc.ui.hl_override.TabLine or {}
local hl_normal = chadrc.ui.hl_override.Normal or {}
local hl_tabline_sel = chadrc.ui.hl_override.TabLineSel or {}
local hl_tabline_fill = chadrc.ui.hl_override.TabLineFill or {}

local function tab_label(tabid, active)
   local icon = active and "" or ""
   local number = vim.api.nvim_tabpage_get_number(tabid)
   return string.format(" %s %d ", icon, number)
end

local function tab_label_no_fallback(tabid, active)
   local icon = active and "" or ""
   local fallback = function()
      return ""
   end
   local number = vim.api.nvim_tabpage_get_number(tabid)
   local name = util.get_tab_name(tabid, fallback)
   if name == "" then
      return string.format(" %s %d ", icon, number)
   end
   return string.format(" %s %d %s ", icon, number, name)
end

local function win_label(winid, top)
   return string.format(" %s ", filename.unique(winid))
end

local tabline = {
   hl = hl_tabline_fill,
   layout = "active_wins_at_tail",
   head = {
      { "  ", hl = { fg = hl_tabline_fill.fg, bg = colors.blue } },
      { "█", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_sel.bg } },
   },
   active_tab = {
      label = function(tabid)
         return {
            tab_label(tabid, true),
            hl = { fg = hl_tabline_fill.fg, bg = colors.blue, style = "bold" },
         }
      end,
      left_sep = { " ", hl = { fg = hl_tabline_fill.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline_fill.bg, bg = hl_tabline_fill.bg } },
   },
   inactive_tab = {
      label = function(tabid)
         return {
            tab_label(tabid),
            hl = { fg = hl_tabline.fg, bg = colors.lightbg, style = "bold" },
         }
      end,
      left_sep = { " ", hl = { fg = hl_tabline_fill.bg, bg = hl_tabline_fill.bg } },
      right_sep = { "", hl = { fg = hl_tabline_fill.bg, bg = hl_tabline_fill.bg } },
   },
   top_win = {
      label = function(winid)
         return {
            win_label(winid, true),
            hl = {
               fg = hl_tabline_fill.fg,
               bg = colors.green,
            },
         }
      end,
      left_sep = { "", hl = { fg = hl_tabline_fill.bg, bg = hl_tabline_fill.bg } },
      right_sep = { " ", hl = { fg = hl_tabline_fill.bg, bg = hl_tabline_fill.bg } },
   },
   win = {
      label = function(winid)
         return {
            win_label(winid),
            hl = { fg = hl_tabline.fg, bg = colors.lightbg, style = "bold" },
         }
      end,
      left_sep = { "", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
      right_sep = { " ", hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
   },
   tail = {
      { "█", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_sel.bg } },
      { "  ", hl = { fg = hl_tabline_fill.fg, bg = colors.green } },
   },
}

require("tabby").setup {
   tabline = tabline,
}
