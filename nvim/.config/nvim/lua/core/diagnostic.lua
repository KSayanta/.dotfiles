vim.diagnostic.config({
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  virtual_text = true,
  virtual_lines = false,
  update_in_insert = false,
  underline = { severity = vim.diagnostic.severity.ERROR },
  jump = { float = true },
})

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
