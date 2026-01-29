return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
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

    local servers = {
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

    require('mason-lspconfig').setup({
      automatic_enable = false,
      automatic_installation = false,
      ensure_installed = servers,
    })

    local tools = {
      'lua-language-server', -- Lua language server
      'stylua', -- Used to format Lua code
      'prettier', -- Used to format HTML, CSS, Javascript
      'prettierd', -- Used to format Javascript
      'xmlformatter', -- Used to format xml / svg
      -- 'eslint_d', -- Used to lint Javascript
      -- 'markdownlint', -- Used to lint Markdown
      -- 'stylelint', -- Used to lint CSS
      -- 'jsonlint', -- Used to lint JSON
      -- 'vale', -- Used to lint text
    }

    require('mason-tool-installer').setup({ ensure_installed = tools })

    vim.lsp.enable(servers)
  end,
}
