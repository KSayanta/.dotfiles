return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    { '<leader>wR', '<cmd>SessionSearch<CR>', desc = '[R]estore Session' },
    { '<leader>wS', '<cmd>SessionSave<CR>', desc = '[S]ave Session' },
  },
  config = function()
    require('auto-session').setup(
      ---@module 'auto-session'
      ---@type AutoSession.Config
      {
        auto_restore = true,
        auto_save = true,
        allowed_dirs = { '~/Projects/' },
      }
    )
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
  end,
}
