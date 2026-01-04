local state = {
  floating = {
    buf = -1,
    win = -1,
    is_open = false,
  },
}

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Calculate the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create a buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
    vim.api.nvim_set_option_value('bufhidden', 'hide', { buf = buf })
  end

  -- Define window configuration
  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded',
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  -- Set transparency for floating window
  vim.api.nvim_set_option_value('winblend', 0, { win = win })

  -- Set background transparency for floating window
  vim.api.nvim_set_option_value('winhighlight', 'Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder', { win = win })

  -- Define highlight group for transparency
  vim.api.nvim_set_hl(0, 'FloatingTermNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'FloatingTermBorder', { bg = 'none' })

  return { buf = buf, win = win, is_open = opts.is_open }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window({ buf = state.floating.buf, is_open = true })
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end

    -- Enter insert mode after opening terminal
    vim.api.nvim_set_current_win(state.floating.win)
    vim.cmd('startinsert!')
  else
    vim.api.nvim_win_hide(state.floating.win)
    state.floating.is_open = false
  end
end

-- Auto command to close on buffer leave
vim.api.nvim_create_autocmd('BufLeave', {
  callback = function()
    if state.floating.is_open then
      vim.api.nvim_win_hide(state.floating.win)
      state.floating.is_open = false
    end
  end,
})

-- Create a user command for floating window with default dimensions
vim.api.nvim_create_user_command('Floaterminal', toggle_terminal, {})

-- Keymap
vim.keymap.set({ 'n', 't' }, '<space>`', toggle_terminal, { desc = 'Toggle terminal' })
