if vim.g.custom_theme then
  vim.cmd.colorscheme('unokai')
  -- Normal highlight
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#333333' })
  vim.api.nvim_set_hl(0, 'Comment', { fg = '#aaaaaa', bg = 'none' })

  -- Floating window
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'PmenuExtra', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'PmenuKind', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#74705d' })
  vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#777777' })
else
  require('core.current-theme')
end
