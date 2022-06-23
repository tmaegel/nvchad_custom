-- lua/custom/mappings

local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
   n = {
      -- which-key
      ["<leader>wK"] = "",
      ["<leader>wk"] = "",
      -- telescope
      ["<leader>fw"] = "",
      ["<leader>tk"] = "",
      -- bufferline
      ["<leader>x"] = "",
      ["<S-b>"] = "",
      -- comment
      ["<leader>/"] = "",
      -- lspconfig
      ["d]"] = "",
      ["[d"] = "",
      ["<leader>f"] = "",
      ["<leader>gt"] = "",
      ["<leader>cm"] = "",
      -- nvterm
      ["<leader>h"] = "",
      ["<leader>v"] = "",
      ["<A-i>"] = "",
      ["<A-h>"] = "",
      ["<A-v>"] = "",
      -- nvimtree
      ["<C-n>"] = "",
      ["<leader>e"] = "",
      -- bufferline
      ["<S-b>"] = "",
      ["<leader>x"] = "",
   },
   v = {
      -- comment
      ["<leader>/"] = "",
   },
   t = {
      -- nvterm
      ["<A-i>"] = "",
      ["<A-h>"] = "",
      ["<A-v>"] = "",
   },
}

M.general = {
   n = {
      -- switch between windows
      ["<A-Left>"] = { "<C-w>h", " window left" },
      ["<A-Right>"] = { "<C-w>l", " window right" },
      ["<A-Down>"] = { "<C-w>j", " window down" },
      ["<A-Up>"] = { "<C-w>k", " window up" },
      -- swtich between tabpages
      ["<leader><Left>"] = { "<cmd> tabprevious <CR>", " tab left" },
      ["<leader><Right>"] = { "<cmd> tabnext <CR>", " tab right" },
      -- Remap: Insert new line without enter insert mode
      ["o"] = { "o<ESC>", "Insert new line after (without enter insert mode)" },
      ["O"] = { "O<ESC>", "Insert new line above (without enter insert mode)" },
      ["U"] = { "<cmd> redo<CR>", "Redo" },
      ["<leader>a"] = { "ggVG", "Select all text in curent buffer" },
      ["<leader>e"] = { "%", "Go to matching pair" },
      ["<leader>f"] = { "^", "Go to first character in line" },
      ["<leader>l"] = { "g_", "Go to last character in line" },
      -- buffer
      ["<TAB>"] = { "<cmd> bnext <CR>", "  cycle next buffer" },
      ["<S-Tab>"] = { "<cmd> bprevious <CR>", "  cycle prev buffer" },
      ["<leader>bn"] = { "<cmd> enew <CR>", "烙 new buffer" },
      ["<leader>bh"] = { "<cmd> sp <CR>", "烙 split window" },
      ["<leader>bv"] = { "<cmd> vsp <CR>", "烙 vertical split window" },
      -- close buffer + hide terminal buffer
      ["<leader>bq"] = {
         function()
            require("core.utils").close_buffer()
         end,
         "   close buffer",
      },
      -- tabs
      ["<leader>tn"] = { "<cmd> tabnew <CR>", "烙 new tab" },
      ["<leader>td"] = { "<cmd> tabclose <CR>", "  close tab" },
      ["<leader>tq"] = { "<cmd> windo bd <CR>", "  close tab and its buffers" },
      ["<leader>tm"] = { "<cmd> +tabmove <CR>", "  move tab to the right" },
      ["<leader>tM"] = { "<cmd> -tabmove <CR>", "  move tab to the left" },
   },
   x = {
      ["<leader>e"] = { "%", "Go to matching pair" },
   },
}

M.telescope = {
   n = {
      ["<leader>F"] = {
         function()
            vim.cmd("Telescope find_files default_text=" .. vim.fn.expand "<cword>")
         end,
         "   find file under cursor",
      },
      ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
      ["?"] = { "<cmd> Telescope grep_string <CR>", "   grep string under the cursor" },
      ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },
      ["<leader>fs"] = { "<cmd> Telescope search_history <CR>", "   lists searches that were executed recently" },
      ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "  git status" },
      ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
      ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "   git branches" },
   },
}

M.lspconfig = {
   n = {
      ["<leader>dN"] = {
         function()
            vim.diagnostic.goto_prev()
         end,
         "   goto prev",
      },
      ["<leader>dn"] = {
         function()
            vim.diagnostic.goto_next()
         end,
         "   goto_next",
      },
      ["<leader>df"] = {
         function()
            vim.diagnostic.open_float()
         end,
         "   floating diagnostic",
      },
   },
}

M.trouble = {
   n = {
      ["xx"] = { "<cmd> TroubleToggle <CR>", "Toggle trouble" },
      ["xw"] = { "<cmd> Trouble workspace_diagnostics <CR>", "Trouble workspace diagnostics" },
      ["xd"] = { "<cmd> Trouble document_diagnostics <CR>", "Trouble document diagnostics" },
      ["xl"] = { "<cmd> Trouble loclist <CR>", "Trouble location list" },
      ["xq"] = { "<cmd> Trouble quickfix <CR>", "Trouble quickfix list" },
      ["gR"] = { "<cmd> Trouble lsp_references <CR>", "Trouble lsp references" },
   },
}

M.gitsigns = {
   n = {
      ["<leader>G"] = { "<cmd> G <CR>", "Git status" },
      ["<leader>hn"] = { "<cmd> Gitsigns next_hunk <CR>", "Go to next hunk" },
      ["<leader>hN"] = { "<cmd> Gitsigns prev_hunk <CR>", "Go to prev hunk" },
      ["<leader>ha"] = { "<cmd> Gitsigns stage_hunk <CR>", "Stage hunk" },
      ["<leader>hA"] = { "<cmd> Gitsigns stage_buffer <CR>", "Stage buffer" },
      ["<leader>hu"] = { "<cmd> Gitsigns undo_stage_hunk <CR>", "Undo stage hunk" },
      ["<leader>hr"] = { "<cmd> Gitsigns reset_hunk <CR>", "Reset hunk" },
      ["<leader>hR"] = { "<cmd> Gitsigns reset_buffer <CR>", "Reset buffer" },
      ["<leader>hd"] = { "<cmd> Gitsigns diffthis <CR>", "Show diff" },
      ["<leader>hp"] = { "<cmd> Gitsigns preview_hunk <CR>", "Preview the hunk at the cursor position" },
   },
   v = {
      ["<leader>ha"] = { "<cmd> Gitsigns stage_hunk <CR>", "Stage hunk" },
      ["<leader>hr"] = { "<cmd> Gitsigns reset_hunk <CR>", "Reset hunk" },
   },
}

return M
