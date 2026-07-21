vim.pack.add({ _G.gh('nvim-mini/mini.nvim') })

if vim.g.have_nerd_font then
  require('mini.icons').setup()
  ---@diagnostic disable-next-line
  MiniIcons.mock_nvim_web_devicons()
end

require('mini.statusline').setup({ use_icons = vim.g.have_nerd_font })

require('mini.ai').setup({
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
})

require('mini.align').setup()

require('mini.pairs').setup()

require('mini.indentscope').setup()

require('mini.notify').setup({
  lsp_progress = { enable = false },
})

require('mini.comment').setup({
  options = {
    custom_commentstring = function() return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring end,
  },
})

local MiniTabline = require('mini.tabline')

MiniTabline.setup({
  show_icons = vim.g.have_nerd_font,
  format = function(buf_id, label)
    local suffix = vim.bo[buf_id].modified and '[+] ' or ''
    return MiniTabline.default_format(buf_id, label) .. suffix
  end,
})

require('mini.surround').setup({
  n_lines = 500,
  mappings = {
    add = 'sa', -- Add surrounding in Normal and Visual modes
    delete = 'sd', -- Delete surrounding
    find = 'sf', -- Find surrounding (to the right)
    find_left = 'sF', -- Find surrounding (to the left)
    highlight = 'sh', -- Highlight surrounding
    replace = 'sc', -- Replace surrounding
    suffix_last = 'l', -- Suffix to search with "prev" method
    suffix_next = 'n', -- Suffix to search with "next" method
  },
})

require('mini.hipatterns').setup({
  highlighters = {
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
  },
})

require('mini.files').setup({
  windows = { preview = true, width_preview = 50 },
  options = { permanent_delete = false },
})

vim.keymap.set('n', '<leader>e', ':lua MiniFiles.open()<CR>', { desc = 'Open Mini [e]xplorer' })
vim.keymap.set('n', '<leader>E', ':lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', { desc = 'Open Mini [E]xplorer in current file' })

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesWindowOpen',
  callback = function(args)
    local win_id = args.data.win_id
    local config = vim.api.nvim_win_get_config(win_id)
    vim.wo[win_id].winblend = 0
    config.border, config.title_pos = 'rounded', 'center'
    vim.api.nvim_win_set_config(win_id, config)
  end,
})

vim.keymap.set('n', '<leader>tc', ":lua require('mini.colors').interactive()<CR>", { desc = '[T]oggle mini colors interactive' })
