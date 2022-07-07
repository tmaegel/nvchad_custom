-- custom/chadrc

local plugin_override = require "custom.plugins.override"
local colors = require "custom.colors"

local M = {}

-- Overwrite options
M.options = {

   user = function()
      require "custom.options"
   end,

   nvChad = {
      update_url = "https://github.com/NvChad/NvChad",
      update_branch = "main",
      -- update_url = "https://github.com/tmaegel/NvChad",
      -- update_branch = "custom",
   },
}

M.ui = {

   statusline = {
      separator_style = "block", -- default/round/block/arrow
      config = "%!v:lua.require'custom.statusline'.run()",
   },

   tabufline = {
      enabled = false,
      lazyload = true,
      override = {},
   },

   theme = "onedark", -- default theme
   transparency = false,
   hl_add = {
      DiffText = {
         fg = "none",
         bg = colors.diff_text,
      },
      -- Gitsigns
      GitSignsAdd = {
         fg = "green",
         bg = "none",
      },
      GitSignsChange = {
         fg = "blue",
         bg = "none",
      },
      GitSignsDelete = {
         fg = "red",
         bg = "none",
      },
      GitWordAdd = {
         bg = colors.diff_text,
      },
      GitWordDelete = {
         bg = colors.diff_text,
      },
      GitSignsAddNr = {
         fg = "green",
         bg = "black",
      },
      GitSignsChangeNr = {
         fg = "blue",
         bg = "black",
      },
      GitSignsDeleteNr = {
         fg = "red",
         bg = "black",
      },
      GitSignsAddLn = {
         fg = "none",
         bg = colors.diff_add,
      },
      GitSignsChangeLn = {
         fg = "none",
         bg = colors.diff_change,
      },
      GitSignsDeleteLn = {
         fg = "none",
         bg = colors.diff_delete,
      },
      -- Diagnostics
      DiagnosticLineNrError = {
         fg = "red",
         bg = "black",
      },
      DiagnosticLineNrWarn = {
         fg = "yellow",
         bg = "black",
      },
      DiagnosticLineNrHint = {
         fg = "purple",
         bg = "black",
      },
      DiagnosticLineNrInfo = {
         fg = "green",
         bg = "black",
      },
      -- statusline
      St_FilePath_text = {
         fg = "light_grey",
         bg = "black",
      },
      St_Git_icon = {
         fg = "black",
         bg = "green",
      },
      St_Git_text = {
         fg = "white",
         bg = "lightbg",
      },
      St_FileType_icon = {
         fg = "black",
         bg = "purple",
      },
      St_FileType_text = {
         fg = "white",
         bg = "lightbg",
      },
      St_LspStatus_icon = {
         fg = "black",
         bg = "teal",
      },
      St_Sep = {
         fg = "black",
         bg = "black",
      },
   },
   hl_override = {
      CursorLine = {
         bg = "black2",
      },
      FloatBorder = {
         fg = "grey",
         bg = "black",
      },
      NormalFloat = {
         fg = "white",
         bg = "black",
      },
      TabLine = {
         fg = "white",
         bg = "black",
      },
      TabLineSel = {
         fg = "white",
         bg = "grey",
      },
      TabLineFill = {
         fg = "black",
         bg = "black",
      },
      Pmenu = {
         bg = "black",
      },
      -- Git
      DiffAdd = {
         fg = "none",
         bg = colors.diff_add,
      },
      DiffChange = {
         fg = "none",
         bg = colors.diff_change,
      },
      DiffDelete = {
         fg = "none",
         bg = colors.diff_delete,
      },
      SignColumn = {
         bg = "black",
      },
      FoldColumn = {
         bg = "black",
      },
      -- Modes
      St_NormalMode = {
         fg = "black",
         bg = "blue",
      },
      St_InsertMode = {
         fg = "black",
         bg = "green",
      },
      St_VisualMode = {
         fg = "black",
         bg = "purple",
      },
      St_CommandMode = {
         fg = "black",
         bg = "red",
      },
      St_ReplaceMode = {
         fg = "black",
         bg = "orange",
      },
      -- statusline
      StatusLine = {
         bg = "black",
      },
      St_cwd_icon = {
         fg = "black",
         bg = "red",
      },
      St_cwd_text = {
         fg = "white",
         bg = "lightbg",
      },
      St_lspError = {
         fg = "white",
         bg = "lightbg",
      },
      St_lspWarning = {
         fg = "white",
         bg = "lightbg",
      },
      St_LspHints = {
         fg = "white",
         bg = "lightbg",
      },
      St_LspInfo = {
         fg = "white",
         bg = "lightbg",
      },
      St_LspStatus = {
         fg = "white",
         bg = "lightbg",
      },
      -- Blankline
      IndentBlanklineContextChar = {
         fg = "line",
      },
      IndentBlanklineContextStart = {
         bg = "one_bg2",
      },
      MatchWord = {
         fg = "white",
         bg = "one_bg2",
      },
   },
   changed_themes = {
      onedark = {
         -- base_16 = {
         --   base08 = "#",
         -- },
         base_30 = {
            line = colors.bg_default2,
         },
      },
   },
}

M.plugins = {

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   override = {
      ["nvim-treesitter/nvim-treesitter"] = plugin_override.treesitter,
      ["nvim-telescope/telescope.nvim"] = plugin_override.telescope,
      ["lewis6991/gitsigns.nvim"] = plugin_override.gitsigns,
      ["hrsh7th/nvim-cmp"] = plugin_override.cmp,
      ["lukas-reineke/indent-blankline.nvim"] = plugin_override.blankline,
   },

   remove = {
      "folke/which-key.nvim",
      "kyazdani42/nvim-tree.lua",
      "rafamadriz/friendly-snippets",
      "NvChad/nvterm",
      "akinsho/bufferline.nvim",
   },

   -- add, modify, remove plugins
   user = require "custom.plugins",
}

-- Overwrite mapping
M.mappings = require "custom.mappings"

return M
