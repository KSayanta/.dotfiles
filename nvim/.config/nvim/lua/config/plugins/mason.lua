return {
  'mason-org/mason.nvim',
  lazy = false,
  dependencies = {
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local mason_tool_installer = require('mason-tool-installer')

    mason.setup({
      ui = {
        icons = {
          package_installed = '✔️',
          package_pending = '⚠️',
          package_uninstalled = '❌️',
        },
      },
    })

    -- Mason LSP server install
    mason_lspconfig.setup({
      automatic_enable = false,
      automatic_installation = false,
      ensure_installed = {
        'astro',
        'css_variables',
        'cssls',
        'cssmodules_ls',
        'emmet_language_server',
        'html',
        'lua_ls',
        'mdx_analyzer',
        'tailwindcss',
        'ts_ls',
        'zls',
      },
    })

    -- Mason tools install
    mason_tool_installer.setup({
      ensure_installed = {
        'stylua', -- Used to format Lua code
        'prettier', -- Used to format HTML, CSS, Javascript
        'prettierd', -- Used to format Javascript
        'xmlformatter', -- Used to format xml / svg
        -- 'eslint_d', -- Used to lint Javascript
        -- 'markdownlint', -- Used to lint Markdown
        -- 'stylelint', -- Used to lint CSS
        -- 'jsonlint', -- Used to lint JSON
        -- 'vale', -- Used to lint text
      },
    })
  end,
}
