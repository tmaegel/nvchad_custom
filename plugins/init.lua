-- lua/custom/plugins/init

return {
   ["nvim-telescope/telescope.nvim"] = {
      -- Disable lazy-loading for telescope
      module = "telescope",
      -- Pin release branch of telescope
      branch = "0.1.x",
   },
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
   },
   ["hrsh7th/nvim-cmp"] = {
      -- Disable friendly-snippets dependency
      after = "nvim-lspconfig",
      config = function()
         require "plugins.configs.cmp"
      end,
   },
   ["L3MON4D3/LuaSnip"] = {
      -- Disable friendly-snippets dependency
      wants = "nvim-lspconfig",
   },
   ["folke/trouble.nvim"] = {
      config = function()
         require "custom.plugins.trouble"
      end,
   },
   ["nanozuki/tabby.nvim"] = {
      after = "nvim-web-devicons",
      config = function()
         require "custom.plugins.tabby"
      end,
   },
   ["tpope/vim-fugitive"] = {},
   ["heavenshell/vim-pydocstring"] = {},
}
