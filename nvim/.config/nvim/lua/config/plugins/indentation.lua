return {
  -- Guess indent sizes
  {
    'nmac427/guess-indent.nvim',
    opts = {},
  },

  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    main = 'ibl',
    opts = {
      whitespace = {
        remove_blankline_trail = false,
      },
      indent = { char = '┊' },
    },
  },
}
