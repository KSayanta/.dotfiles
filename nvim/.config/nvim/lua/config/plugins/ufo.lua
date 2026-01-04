return {
  'kevinhwang91/nvim-ufo',
  event = 'BufReadPost',
  dependencies = {
    'kevinhwang91/promise-async',
    'nvim-treesitter/nvim-treesitter',
  },
  open_fold_h1_timeout = 100,
  disabled = { 'org' }, -- disabled in file explorer
  init = function()
    vim.o.foldenable = true
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldclose:'
  end,
  opts = {
    provider_selector = function()
      return { 'treesitter', 'indent' }
    end,
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
  },
}
