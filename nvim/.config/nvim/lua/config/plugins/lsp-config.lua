local servers = {
  'astro',
  'css_variables',
  'cssls',
  'cssmodules_ls',
  'emmet_language_server',
  'html',
  'lua_ls',
  'marksman',
  'svelte',
  'tailwindcss',
  'tsgo',
  'zls',
}

local tools = {
  'stylua',
  'prettier',
  'prettierd',
  'xmlformatter',
  'gdscript-formatter',
  'jsonlint',
}

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
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
        map('grn', vim.lsp.buf.rename, '[R]e[n]ame All Instances')
        map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
        map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      end,
    })

    require('mason-lspconfig').setup({
      automatic_enable = false,
      automatic_installation = false,
      ensure_installed = servers,
    })

    require('mason-tool-installer').setup({ ensure_installed = tools })

    vim.lsp.enable(servers)
  end,
}
