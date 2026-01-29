return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function() require('conform').format({ async = true, lsp_format = 'fallback' }) end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      zig = { 'zig fmt' },
      -- python = { "isort", "black" },
      html = { 'prettier' },
      css = { 'prettier' },
      javascript = { 'prettierd', 'injected' },
      typescript = { 'prettierd', 'injected' },
      javascriptreact = { 'prettierd', 'injected' },
      typescriptreact = { 'prettierd', 'injected' },
      json = { 'prettier' },
      jsonc = { 'prettier' },
      md = { 'prettierd', 'injected' },
      mdx = { 'prettierd', 'injected' },
      svg = { 'xmlformat' },
      xml = { 'xmlformat' },
    },

    formatters = {
      injected = {
        options = {
          -- Set to true to ignore errors
          ignore_errors = false,
          -- Map of treesitter language to filetype
          lang_to_ft = {
            bash = 'sh',
          },
          -- Map of treesitter language to file extension
          -- A temporary file name with this extension will be generated during formatting.
          lang_to_ext = {
            bash = 'sh',
            c_sharp = 'cs',
            elixir = 'exs',
            javascript = 'js',
            javascriptreact = 'jsx',
            typescriptreact = 'tsx',
            julia = 'jl',
            latex = 'tex',
            markdown = 'md',
            python = 'py',
            ruby = 'rb',
            rust = 'rs',
            teal = 'tl',
            typescript = 'ts',
          },
        },
      },
    },
  },
}
