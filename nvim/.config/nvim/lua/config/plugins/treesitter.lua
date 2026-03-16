local parsers = {
  'astro',
  'bash',
  'c',
  'css',
  'diff',
  'gdscript',
  'gdshader',
  'html',
  'javascript',
  'json',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'svelte',
  'typescript',
  'vim',
  'vimdoc',
  'zig',
}

return {
  -- NOTE: Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    dependencies = { 'windwp/nvim-ts-autotag' },
    config = function()
      require('nvim-treesitter').install(languages)
      -- vim.list_extend(languages, { 'typescriptreact', 'javascriptreact' })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = languages,
        callback = function() vim.treesitter.start() end,
      })
      require('nvim-treesitter.config').setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },

  -- NOTE: Autotag
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
      per_filetype = {
        html = { enable_close = false },
      },
    },
  },
}
