local languages = {
  'astro',
  'bash',
  'c',
  'css',
  'diff',
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
      vim.api.nvim_create_autocmd('FileType', {
        pattern = languages,
        callback = function() vim.treesitter.start() end,
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
