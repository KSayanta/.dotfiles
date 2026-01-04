local vimapi = vim.api
local augroup = vimapi.nvim_create_augroup('CustomConfig', {})

-- Highlight when yanking text
vimapi.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = augroup,
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Return to last edit position
vimapi.nvim_create_autocmd('BufReadPost', {
  desc = 'Return to last edit position when opening files',
  group = augroup,
  callback = function()
    local mark = vimapi.nvim_buf_get_mark(0, '"')
    local line_count = vimapi.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vimapi.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto close terminal when exiting
vimapi.nvim_create_autocmd('TermClose', {
  desc = 'Close nvim terminal when exiting',
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vimapi.nvim_buf_delete(0, {})
    end
  end,
})
