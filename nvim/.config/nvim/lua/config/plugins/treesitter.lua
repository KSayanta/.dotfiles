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
    build = ':TSUpdate',
    branch = 'main',
    dependencies = { 'windwp/nvim-ts-autotag' },
    config = function()
      require('nvim-treesitter').install(parsers)

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf, filetype = args.buf, args.match
          local lang = vim.treesitter.language.get_lang(filetype)

          if not lang then return end
          if not vim.treesitter.language.add(lang) then return end

          vim.treesitter.start(buf, lang)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
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
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
        per_filetype = {
          ['html'] = { enable_close = false },
        },
      })
    end,
  },
}
