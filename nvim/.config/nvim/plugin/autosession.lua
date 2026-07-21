vim.pack.add({ _G.gh('rmagatti/auto-session') })

require('auto-session').setup({
  auto_restore = true,
  auto_save = true,
  allowed_dirs = { '~/Projects/' },
})

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

vim.keymap.set({ 'n' }, '<leader>wR', '<cmd>AutoSession search<CR>', { desc = '[R]estore Session' })
vim.keymap.set({ 'n' }, '<leader>wS', '<cmd>AutoSession save<CR>', { desc = '[S]ave Session' })
vim.keymap.set({ 'n' }, '<leader>wD', '<cmd>AutoSession delete<CR>', { desc = '[D]elete Session' })
