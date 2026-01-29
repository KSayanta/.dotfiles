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
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc, silent = true })
        end
        -- LSP Keybinds
        map('grn', vim.lsp.buf.rename, '[R]e[n]ame') -- Rename variable
        map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' }) -- Execute code action
        map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration') -- Jump to declaration
      end,
    })

    })

    -- Enable servers
    vim.lsp.enable(ensure_enabled)
  end,
}
