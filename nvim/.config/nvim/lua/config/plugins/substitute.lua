return {
  'gbprod/substitute.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local substitute = require('substitute')
    local exchange = require('substitute.exchange')
    substitute.setup()

    local opts = { noremap = true }
    vim.keymap.set('n', 's', substitute.operator, opts) -- Substitute with motion
    vim.keymap.set('n', 'ss', substitute.line, opts) -- Substitute line under cursor
    vim.keymap.set('n', 'S', substitute.eol, opts) -- Substitute to end of line
    vim.keymap.set('x', 's', substitute.visual, opts) -- Substitute visual selection

    vim.keymap.set('n', 'sx', exchange.operator, opts) -- Exchange with motion
    vim.keymap.set('n', 'sxx', exchange.line, opts) -- Exchange line under cursor
    vim.keymap.set('x', 'X', exchange.visual, opts) -- Exchange in visual mode
    vim.keymap.set('n', 'sxc', exchange.cancel, opts) -- Exchange cancel
  end,
}
