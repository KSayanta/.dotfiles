return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    { '<leader>wR', '<cmd>AutoSession search<CR>', desc = '[R]estore Session' },
    { '<leader>wS', '<cmd>AutoSession save<CR>', desc = '[S]ave Session' },
    { '<leader>wD', '<cmd>AutoSession delete<CR>', desc = '[D]elete Session' },
  },
  config = function()
    require('auto-session').setup({
      auto_restore = true,
      auto_save = true,
      allowed_dirs = { '~/Projects/' },
    })
    vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
  end,
}
