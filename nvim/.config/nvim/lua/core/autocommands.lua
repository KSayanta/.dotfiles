local vimapi = vim.api
local augroup = vimapi.nvim_create_augroup('CustomConfig', {})

local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then output = 'No output from build command.' end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end

-- This autocommand runs after a plugin is installed or updated and runs the appropriate build command for that plugin if necessary.
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable('make') == 1 then
      run_build(name, { 'make' }, ev.data.path)
      return
    end

    if name == 'LuaSnip' then
      if vim.fn.has('win32') ~= 1 and vim.fn.executable('make') == 1 then run_build(name, { 'make', 'install_jsregexp' }, ev.data.path) end
      return
    end

    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
      return
    end
  end,
})

-- Highlight when yanking text
vimapi.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = augroup,
  callback = function() vim.hl.on_yank() end,
})

-- Return to last edit position
vimapi.nvim_create_autocmd('BufReadPost', {
  desc = 'Return to last edit position when opening files',
  group = augroup,
  callback = function()
    local mark = vimapi.nvim_buf_get_mark(0, '"')
    local line_count = vimapi.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then pcall(vimapi.nvim_win_set_cursor, 0, mark) end
  end,
})

-- Auto close terminal when exiting
vimapi.nvim_create_autocmd('TermClose', {
  desc = 'Close nvim terminal when exiting',
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then vimapi.nvim_buf_delete(0, {}) end
  end,
})
