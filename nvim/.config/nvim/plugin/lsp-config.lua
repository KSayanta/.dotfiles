local servers = {
  'astro',
  'css_variables',
  'cssls',
  'cssmodules_ls',
  'emmet_language_server',
  'html',
  'lua_ls',
  'marksman',
  'ols',
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

vim.pack.add({
  { src = _G.gh('neovim/nvim-lspconfig') },
  { src = _G.gh('mason-org/mason.nvim') },
  { src = _G.gh('mason-org/mason-lspconfig.nvim') },
  { src = _G.gh('WhoIsSethDaniel/mason-tool-installer.nvim') },
})

require('mason').setup()

require('mason-lspconfig').setup({
  automatic_enable = false,
  automatic_installation = false,
  ensure_installed = servers,
})

require('mason-tool-installer').setup({ ensure_installed = tools })

vim.lsp.enable(servers)

-- Runs when a LSP attaches to a particular buffer
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

    -- Keymap to toggle inlay hints, if the language server supports them
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method('textDocument/inlayHint', event.buf) then
      map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })) end, '[T]oggle Inlay [H]ints')
    end
  end,
})
