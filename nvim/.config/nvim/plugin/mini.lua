vim.pack.add({ _G.gh('nvim-mini/mini.nvim') })

require('mini.align').setup()

require('mini.pairs').setup()

require('mini.indentscope').setup()

-- MINI Icons
if vim.g.have_nerd_font then
  require('mini.icons').setup()
  MiniIcons.mock_nvim_web_devicons()
end

-- MINI Statusline
require('mini.statusline').setup({
  use_icons = vim.g.have_nerd_font,
})

-- MINI Ai
require('mini.ai').setup({
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
})

-- MINI Notify
require('mini.notify').setup({
  lsp_progress = { enable = false },
})

-- MINI Comment
require('mini.comment').setup({
  options = {
    custom_commentstring = function() return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring end,
  },
})

-- MINI Tabline
local MiniTabline = require('mini.tabline')
MiniTabline.setup({
  show_icons = vim.g.have_nerd_font,
  format = function(buf_id, label)
    local suffix = vim.bo[buf_id].modified and '[+] ' or ''
    return MiniTabline.default_format(buf_id, label) .. suffix
  end,
})

-- MINI Surround
require('mini.surround').setup({
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
  n_lines = 500,
})

-- MINI Hipatterns
require('mini.hipatterns').setup({
  highlighters = {
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
  },
})

-- MINI Files
require('mini.files').setup({
  windows = { preview = true, width_preview = 50 },
  options = { permanent_delete = false },
})

-- Customize window-local settings
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

--- Extra functions
-- Set current dir
local set_cwd = function()
  local path = (MiniFiles.get_fs_entry() or {}).path
  if path == nil then return vim.notify('Cursor is not on valid entry') end
  vim.fn.chdir(vim.fs.dirname(path))
end

-- Copy file path
local yank_path = function()
  local path = (MiniFiles.get_fs_entry() or {}).path
  if path == nil then return vim.notify('Cursor is not on valid entry') end
  vim.fn.setreg(vim.v.register, path)
end

-- Open in external program
local ui_open = function() vim.ui.open(MiniFiles.get_fs_entry().path) end

-- Filter nothing
local filter_show = function(_) return true end

-- Filter something
local filter_hide = function(fs_entry)
  -- Dotfiles
  local is_dotfile = vim.startswith(fs_entry.name, '.')
  if is_dotfile then return not is_dotfile end

  -- Godotfiles
  local patterns = { '.uid', '.import', '.godot' }
  for _, pattern in ipairs(patterns) do
    local is_godotfile = vim.endswith(fs_entry.name, pattern)
    if is_godotfile then return not is_godotfile end
  end

  -- Restfiles
  return true
end

-- Filter toggle dotfiles
local show_dotfiles = vim.g.dotfile_visible
local toggle_dotfiles = function()
  show_dotfiles = not show_dotfiles
  local new_filter = show_dotfiles and filter_show or filter_hide
  MiniFiles.refresh({ content = { filter = new_filter } })
end

-- Open mini files
local reveal = function(...)
  MiniFiles.open(...)
  local new_filter = show_dotfiles and filter_show or filter_hide
  MiniFiles.refresh({ content = { filter = new_filter } })
end

-- Setup custom binds
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local b = args.data.buf_id
    vim.keymap.set('n', '<leader>~', set_cwd, { buffer = b, desc = 'MINI: Set CWD' })
    vim.keymap.set('n', '<leader>X', ui_open, { buffer = b, desc = 'MINI: OS Open' })
    vim.keymap.set('n', '<leader>y', yank_path, { buffer = b, desc = 'MINI: Yank Path' })
    vim.keymap.set('n', '<leader>.', toggle_dotfiles, { buffer = b, desc = 'MINI: Toggle Dotfiles' })
  end,
})

-- Binds
vim.keymap.set('n', '<leader>e', reveal, { desc = 'Open Mini [e]xplorer' })
vim.keymap.set('n', '<leader>E', function() reveal(MiniFiles.get_latest_path()) end, { desc = 'Open Mini [E]xplorer last used path' })
vim.keymap.set('n', '\\', function() reveal(vim.api.nvim_buf_get_name(0)) end, { desc = 'Open Mini [E]xplorer in current file' })
vim.keymap.set('n', '<leader>tc', ":lua require('mini.colors').interactive()<CR>", { desc = '[T]oggle mini colors interactive' })
