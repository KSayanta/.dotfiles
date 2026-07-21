vim.pack.add({
  { src = _G.gh('eero-lehtinen/oklch-color-picker.nvim'), version = vim.version.range('*') },
})

require('oklch-color-picker').setup()

vim.keymap.set({ 'n' }, '<leader>c', function() require('oklch-color-picker').pick_under_cursor() end, { desc = '[C]olor pick under cursor' })
