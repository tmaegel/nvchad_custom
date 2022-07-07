-- lua/custom/init

-- vim-python-virtualenv
-- vim.g.python3_host_prog = "/usr/bin/python3"

-- Global variable for custom configs to allow for custom luasnip snippets.
vim.g.luasnippets_path = "./lua/custom/snippets"

-- pydocstring
vim.g.pydocstring_doq_path = "~/.local/bin/doq"
vim.g.pydocstring_templates_path = "~/.config/nvim/lua/custom/pydocstring/templates/"

require "custom.autocmds"
