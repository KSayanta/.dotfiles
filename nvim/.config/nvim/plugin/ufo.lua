vim.pack.add({
  { src = _G.gh('kevinhwang91/nvim-ufo') },
  { src = _G.gh('kevinhwang91/promise-async') },
})

vim.o.foldenable = true
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldclose:'

local ftMap = {
  vim = 'indent',
  org = '',
  git = '',
}

require('ufo').setup({
  open_fold_hl_timeout = 100,
  provider_selector = function(_, filetype, _) return ftMap[filetype] or { 'treesitter', 'indent' } end,
  preview = {
    win_config = {
      border = { '', '─', '', '', '', '─', '', '' },
      winhighlight = 'Normal:Folded',
      winblend = 0,
    },
    mappings = {
      scrollB = '<C-b>',
      scrollF = '<C-f>',
      scrollU = '<C-u>',
      scrollD = '<C-d>',
      jumpTop = 'gg',
      jumpBot = 'G',
    },
  },
})
