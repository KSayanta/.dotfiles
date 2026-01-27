local ensure_enabled = {
  'astro',
  'css_variables',
  'cssls',
  'cssmodules_ls',
  'emmet_language_server',
  'html',
  'lua_ls',
  'mdx_analyzer',
  'svelte',
  'tailwindcss',
  'ts_ls',
  'zls',
}

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'saghen/blink.cmp',
  },

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local builtin = require('telescope.builtin')
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc, silent = true })
        end

        -- LSP Keybinds
        map('grn', vim.lsp.buf.rename, '[R]e[n]ame') -- Rename variable
        map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' }) -- Execute code action
        map('grr', builtin.lsp_references, '[G]oto [R]eferences') -- Find references
        map('gri', builtin.lsp_implementations, '[G]oto [I]mplementation') -- Jump to implementation
        map('grd', builtin.lsp_definitions, '[G]oto [D]efinition') -- Jump to the definition. <C-t> to jump back
        map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration') -- Jump to declaration
        map('grt', builtin.lsp_type_definitions, '[G]oto [T]ype Definition') -- Jump to the type defination
        map('gO', builtin.lsp_document_symbols, 'Open Document Symbols') -- Fuzzy find all the symbols in current document
        map('gW', builtin.lsp_dynamic_workspace_symbols, 'Open Workspace Symbols') -- Fuzzy find all the symbols in current workspace
      end,
    })

    -- Diagnostic Config
    vim.diagnostic.config({
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
      },
      virtual_lines = true,
      update_in_insert = false,
    })

    -- Enable servers
    vim.lsp.enable(ensure_enabled)
  end,
}
