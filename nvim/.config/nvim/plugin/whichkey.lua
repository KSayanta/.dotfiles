vim.pack.add({ _G.gh('folke/which-key.nvim') })

require('which-key').setup({
  delay = 0,
  preset = 'modern',
  sort = { 'manual' },
  icons = { mappings = vim.g.have_nerd_font },
  spec = {
    { '<leader>t', group = '[T]oggle' },
    { '<leader>w', group = '[W]orkspace' },
    { '<leader>g', group = '[G] NeoGit' },
    { '<leader>x', group = '[X] Trouble List' },
    { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
    { '<leader>h', group = '[H]unk', mode = { 'n', 'v' } },
    { '<leader>l', group = '[L]lama Actions', mode = { 'n', 'v' } },
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
})
