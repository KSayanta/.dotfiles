return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    delay = 0,
    preset = 'modern',
    sort = { 'manual' },
    icons = { mappings = vim.g.have_nerd_font },
    spec = {
      { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>x', group = '[X] Trouble List' },
      { 'gr', group = 'LSP Actions', mode = { 'n' } },
    },
  },
}
