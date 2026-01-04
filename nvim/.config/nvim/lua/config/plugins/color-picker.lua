return {
  'eero-lehtinen/oklch-color-picker.nvim',
  event = 'VeryLazy',
  version = '*',
  keys = {
    {
      '<leader>c',
      function()
        require('oklch-color-picker').pick_under_cursor()
      end,
      desc = '[C]olor pick under cursor',
    },
  },

  ---@type oklch.Opts
  opts = {},
}
