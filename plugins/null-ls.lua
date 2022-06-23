-- custom/plugins/null-ls

local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {

   -- PYTHON
   b.diagnostics.pylint,
   b.diagnostics.flake8,
   b.diagnostics.mypy,
   b.formatting.isort,
   b.formatting.black,

   -- SHELL / BASH
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
   b.formatting.shfmt.with {
      extra_args = {
         "-i",
         "2",
         "-s",
         "-bn",
         "-ci",
         "-sr",
      },
   },

   -- JAVASCRIPT, CSS & HTML
   b.formatting.prettier.with {
      filetypes = { "html", "css", "markdown" },
      extra_args = {
         "--no-bracket-spacing",
         "--print-width",
         "88",
         "--single-attribute-per-line",
      },
   },

   -- LUA
   b.formatting.stylua,

   -- YAML
   b.diagnostics.yamllint.with {
      extra_args = {
         "-d",
         "{extends: default, rules: {line-length: {max: 999}}}",
      },
   },

   -- OTHER
   b.formatting.trim_whitespace,
   b.formatting.trim_newlines,
}

null_ls.setup {
   debug = true,
   -- Format on save
   -- you can reuse a shared lspconfig on_attach callback here
   on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
         vim.cmd [[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]]
      end
   end,
   sources = sources,
}
