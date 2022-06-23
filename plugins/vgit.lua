-- custom/plugins/vgit

local present, vgit = pcall(require, "vgit")
local colors = require "custom.colors"

if not present then
   return
end

vgit.setup {
   keymaps = {
      ["n <leader>hN"] = "hunk_up",
      ["n <leader>hn"] = "hunk_down",
      ["n <leader>ha"] = "buffer_hunk_stage",
      ["n <leader>hr"] = "buffer_hunk_reset",
      ["n <leader>hA"] = "buffer_stage",
      ["n <leader>hR"] = "buffer_reset",
      ["n <leader>hU"] = "buffer_unstage",
      ["n <leader>hd"] = "buffer_diff_preview",
      ["n <leader>hD"] = "buffer_hunk_preview",
      ["n <leader>gx"] = "toggle_diff_preference",
      -- ['n <leader>gb'] = 'buffer_blame_preview',
      -- ['n <leader>gh'] = 'buffer_history_preview',
      -- ['n <leader>gg'] = 'buffer_gutter_blame_preview',
      -- ['n <leader>glu'] = 'project_hunks_preview',
      -- ['n <leader>gls'] = 'project_hunks_staged_preview',
      -- ['n <leader>gd'] = 'project_diff_preview',
      -- ['n <leader>gq'] = 'project_hunks_qf',
   },
   settings = {
      git = {
         cmd = "git", -- optional setting, not really required
         fallback_cwd = vim.fn.expand "$HOME",
         fallback_args = {
            "--git-dir",
            vim.fn.expand "$HOME/dots/yadm-repo",
            "--work-tree",
            vim.fn.expand "$HOME",
         },
      },
      hls = {
         GitBackground = "Normal",
         GitAppBar = { -- Hide GitAppBar
            bg = colors.bg_default,
            fg = colors.bg_default,
         },
         GitHeader = "StatusLine",
         GitFooter = "StatusLine",
         GitBorder = "LineNr",
         GitLineNr = "LineNr",
         GitComment = "Comment",
         GitSignsAddLn = "DiffAdd",
         GitSignsDeleteLn = "DiffDelete",
      },
      live_blame = {
         enabled = true,
         format = function(blame, git_config)
            local config_author = git_config["user.name"]
            local author = blame.author
            if config_author == author then
               author = "You"
            end
            local time = os.difftime(os.time(), blame.author_time) / (60 * 60 * 24 * 30 * 12)
            local time_divisions = {
               { 1, "years" },
               { 12, "months" },
               { 30, "days" },
               { 24, "hours" },
               { 60, "minutes" },
               { 60, "seconds" },
            }
            local counter = 1
            local time_division = time_divisions[counter]
            local time_boundary = time_division[1]
            local time_postfix = time_division[2]
            while time < 1 and counter ~= #time_divisions do
               time_division = time_divisions[counter]
               time_boundary = time_division[1]
               time_postfix = time_division[2]
               time = time * time_boundary
               counter = counter + 1
            end
            local commit_message = blame.commit_message
            if not blame.committed then
               author = "You"
               commit_message = "Uncommitted changes"
               return string.format(" %s • %s", author, commit_message)
            end
            local max_commit_message_length = 255
            if #commit_message > max_commit_message_length then
               commit_message = commit_message:sub(1, max_commit_message_length) .. "..."
            end
            return string.format(
               " %s, %s • %s",
               author,
               string.format("%s %s ago", time >= 0 and math.floor(time + 0.5) or math.ceil(time - 0.5), time_postfix),
               commit_message
            )
         end,
      },
      live_gutter = {
         enabled = true,
         edge_navigation = true, -- This allows users to navigate within a hunk
      },
      authorship_code_lens = {
         enabled = false,
      },
      scene = {
         diff_preference = "split", -- split or unified
      },
      diff_preview = {
         keymaps = {
            buffer_stage = "S",
            buffer_unstage = "U",
            buffer_hunk_stage = "s",
            buffer_hunk_unstage = "u",
            toggle_view = "t",
         },
      },
      project_diff_preview = {
         keymaps = {
            buffer_stage = "s",
            buffer_unstage = "u",
            buffer_hunk_stage = "gs",
            buffer_hunk_unstage = "gu",
            buffer_reset = "r",
            stage_all = "S",
            unstage_all = "U",
            reset_all = "R",
         },
      },
      signs = {
         priority = 10,
         definitions = {
            GitSignsAddLn = {
               linehl = "GitSignsAddLn",
               texthl = nil,
               numhl = nil,
               icon = nil,
               text = "",
            },
            GitSignsDeleteLn = {
               linehl = "GitSignsDeleteLn",
               texthl = nil,
               numhl = nil,
               icon = nil,
               text = "",
            },
            GitSignsAdd = {
               texthl = "GitSignsAdd",
               numhl = nil,
               icon = nil,
               linehl = nil,
               text = "┃",
            },
            GitSignsDelete = {
               texthl = "GitSignsDelete",
               numhl = nil,
               icon = nil,
               linehl = nil,
               text = "┃",
            },
            GitSignsChange = {
               texthl = "GitSignsChange",
               numhl = nil,
               icon = nil,
               linehl = nil,
               text = "┃",
            },
         },
         usage = {
            screen = {
               add = "GitSignsAddLn",
               remove = "GitSignsDeleteLn",
            },
            main = {
               add = "GitSignsAdd",
               remove = "GitSignsDelete",
               change = "GitSignsChange",
            },
         },
      },
      symbols = {
         void = "░",
      },
   },
}
