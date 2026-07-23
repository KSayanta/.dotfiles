vim.pack.add({ _G.gh('stevearc/conform.nvim') })

require('conform').setup({
  notify_on_error = false,

  format_on_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local disable_filetypes = { c = true, cpp = true, gdscript = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return { timeout_ms = 500 }
    end
  end,

  -- Use external formatters if configured below, otherwise use LSP formatting.
  -- Set to `false` to disable LSP formatting entirely.
  default_format_opts = {
    lsp_format = 'fallback',
  },

  -- External formatters
  formatters_by_ft = {
    css = { 'prettier' },
    gdscript = { 'gdscript-formatter' },
    html = { 'prettier' },
    javascript = { 'prettierd', 'injected' },
    javascriptreact = { 'prettierd', 'injected' },
    json = { 'prettier' },
    jsonc = { 'prettier' },
    lua = { 'stylua' },
    md = { 'prettierd', 'injected' },
    mdx = { 'prettierd', 'injected' },
    odin = { 'odinfmt' },
    svg = { 'xmlformat' },
    typescript = { 'prettierd', 'injected' },
    typescriptreact = { 'prettierd', 'injected' },
    xml = { 'xmlformat' },
    zig = { 'zig fmt' },
  },

  formatters = {
    odinfmt = {
      command = 'odinfmt',
      args = { '-stdin' },
      stdin = true,
    },
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
})

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format({ async = true }) end, { desc = '[F]ormat buffer' })
