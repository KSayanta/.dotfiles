vim.pack.add({
  { src = _G.gh('nmac427/guess-indent.nvim') },
  { src = _G.gh('lukas-reineke/indent-blankline.nvim') },
})

require('guess-indent').setup()

require('ibl').setup({
  indent = { char = '┊' },
  whitespace = { remove_blankline_trail = false },
})
