-- custom/plugins/lspconfig

local M = {}

local lsp_symbol = require("custom.utils").lsp_symbol

-- To override float borders globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
   opts = opts or {}
   opts.border = opts.border or require("custom.utils").border "FloatBorder"
   return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Overwrite diagnostic icons
-- lsp_symbol("Error", "")
-- lsp_symbol("Info", "")
-- lsp_symbol("Hint", "")
-- lsp_symbol("Warn", "")
lsp_symbol "Error"
lsp_symbol "Info"
lsp_symbol "Hint"
lsp_symbol "Warn"

vim.diagnostic.config {
   underline = false,
   virtual_text = false,
   -- virtual_text = {
   --   prefix = "",
   --  source = "always",  -- Or "if_many"
   -- },
   float = {
      source = "always", -- Or "if_many"
   },
   signs = true,
}

-- Show line diagnostics automatically in hover window
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"
   -- lspservers with default config
   local servers = { "pyright", "bashls", "sumneko_lua", "tsserver" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         -- on_attach = function(client, bufnr)
         --   attach(client, bufnr)
         --   -- change gopls server capabilities
         --   if lsp == "pyright" then
         --     client.resolved_capabilities.document_range_formatting = true
         --   end
         -- end,
         settings = {

            --
            -- PYTHON
            -- https://github.com/microsoft/pyright/blob/main/docs/settings.md
            pyright = {
               disableLanguageServices = false,
               disableOrganizeImports = true,
            },
            python = {
               analysis = {
                  -- Automatically add common search paths like 'src'
                  autoSearchPaths = true,
                  -- Offer auto-import completions
                  autoImportCompletions = true,
                  -- etermines whether pyright analyzes (and reports errors for) all files in the workspace.
                  -- If this option is set to "openFilesOnly", pyright analyzes only open files.
                  diagnosticMode = "openFilesOnly", -- workspace, openFilesOnly
                  -- Determines whether pyright reads, parses and analyzes library code to extract
                  -- type information in the absence of type stub files. Type information will typically
                  -- be incomplete. We recommend using type stubs where possible. The default value for
                  -- this option is false.
                  useLibraryCodeForTypes = false,
                  -- Diagnostics / analysis
                  -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md
                  -- Available values: off, basic, strict
                  typeCheckingMode = "basic",
                  -- Oberwrite diagnostic settings
                  diagnosticSeverityOverrides = {
                     -- When inferring the type of a list, use strict type assumptions.
                     strictListInference = true,
                     -- When inferring the type of a dictionary’s keys and values, use strict type assumptions.
                     strictDictionaryInference = true,
                     -- When inferring the type of a set, use strict type assumptions.
                     strictSetInference = true,
                     -- PEP 484 indicates that when a function parameter is assigned a default value of None,
                     -- its type should implicitly be Optional even if the explicit type is not.
                     strictParameterNoneValue = true,
                     -- PEP 484 defines support for "# type: ignore" comments.
                     enableTypeIgnoreComments = true,
                     reportMissingTypeStubs = "warning",
                     reportWildcardImportFromLibrary = "warning",
                     reportInvalidTypeVarUse = "warning",
                     reportAssertAlwaysTrue = "warning",
                     reportSelfClsParameterName = "warning",
                     reportUnsupportedDunderAll = "warning",
                     reportImplicitStringConcatenation = "warning",
                     reportCallInDefaultInitializer = "warning",
                     reportUninitializedInstanceVariable = "none",
                     reportPropertyTypeMismatch = "information",
                     reportUnusedCallResult = "none",
                     -- reportMissingSuperCall = 'information',
                     -- reportUnnecessaryTypeIgnoreComment = 'information',
                  },
               },
            },

            --
            -- LUA
            --
            Lua = {
               format = {
                  enable = true,
               },
            },
         },
         capabilities = capabilities,
      }
   end
end

return M
