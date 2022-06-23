local M = {}

local utils = require "custom.utils"
-- local nvimcmp = require "cmp"

M.gitsigns = {
   signs = {
      add = { hl = "GitSignsAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitSignsDelete", text = "┃", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "GitSignsDelete", text = "┃", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = { hl = "GitSignsChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
   },
   preview_config = {
      -- Options passed to nvim_open_win
      border = utils.border "FloatBorder",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 90,
   },
   signcolumn = true,
   numhl = false,
   linehl = false,
   show_deleted = false,
}

M.cmp = {
   window = {
      completion = {
         border = utils.border "CmpBorder",
      },
      documentation = {
         border = utils.border "CmpDocBorder",
      },
   },
   -- mapping = {
   --    -- Accept currently selected item.
   --    -- Set `select` to `false` to only confirm explicitly selected items.
   --    ["<CR>"] = nvimcmp.mapping.confirm {
   --       behavior = cmp.ConfirmBehavior.Insert,
   --       select = false,
   --    },
   -- },
}

M.bufferline = {
   options = {
      indicator_icon = "│",
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      separator_style = "thin",
      diagnostic = false,
      -- diagnostics = "nvim_lsp",
      custom_areas = false,
      show_tab_indicators = true,
      max_name_length = 15,
      tab_size = 25,
   },
}

M.blankline = {
   char = "│",
   -- show_current_context = false,
   -- show_current_context_start = true,
}

M.treesitter = {
   ensure_installed = {
      "python",
      "bash",
      "lua",
      "javascript",
      "typescript",
      "html",
      "css",
      "json",
      "toml",
      "markdown",
      "yaml",
      "hcl",
      "dockerfile",
   },
}

M.telescope = {
   defaults = {
      layout_config = {
         horizontal = {
            prompt_position = "top",
            preview_width = 0.6,
            results_width = 0.8,
         },
         width = 0.90,
         height = 0.80,
      },
   },
}

return M
