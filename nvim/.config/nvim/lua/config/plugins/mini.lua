return {
  {
    'nvim-mini/mini.nvim',
    version = '*',
    config = function()
      -- Tabline
      require('mini.tabline').setup({ show_icons = vim.g.have_nerd_font })

      -- Statusline
      require('mini.statusline').setup({ use_icons = vim.g.have_nerd_font })

      -- AI
      require('mini.ai').setup({ n_lines = 500 })

      -- Align
      require('mini.align').setup()

      -- Autopairs
      require('mini.pairs').setup()

      -- Surround
      require('mini.surround').setup({
        n_lines = 30,
        mappings = {
          add = 'sa', -- Add surrounding in Normal and Visual modes
          delete = 'sd', -- Delete surrounding
          find = 'sf', -- Find surrounding (to the right)
          find_left = 'sF', -- Find surrounding (to the left)
          highlight = 'sh', -- Highlight surrounding
          replace = 'sc', -- Replace surrounding
          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },
      })

      -- Todo Comment Coloring
      require('mini.hipatterns').setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = '%f[%w]()FIXME:()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()HACK:()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO:()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE:()%f[%W]', group = 'MiniHipatternsNote' },
        },
      })

      -- Files
      require('mini.files').setup({
        windows = { preview = true, width_preview = 50 },
        options = { permanent_delete = false },
      })

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesWindowOpen',
        callback = function(args)
          local win_id = args.data.win_id
          local config = vim.api.nvim_win_get_config(win_id)

          -- Customize window-local settings
          vim.wo[win_id].winblend = 0
          config.border, config.title_pos = 'rounded', 'center'
          vim.api.nvim_win_set_config(win_id, config)
        end,
      })
    end,
  },
}
