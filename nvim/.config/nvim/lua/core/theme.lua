local themes = {
  'kanagawa',
  'tokyonight',
  'onedark',
}

local set_default_theme = function()
  vim.cmd.colorscheme('unokai')
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#333333' })
  vim.api.nvim_set_hl(0, 'Comment', { fg = '#aaaaaa', bg = 'none' })
  vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#74705d' })
  vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#777777' })

  -- Set transparency
  if vim.g.transparent_enabled then
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'PmenuExtra', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'PmenuKind', { bg = 'none' })
  end
end

if vim.g.custom_theme then
  set_default_theme()
else
  -- Load a random theme
  math.randomseed(os.time())
  vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = function()
      local theme = themes[math.random(#themes)]
      local ok, _ = pcall(vim.cmd.colorscheme, theme)
      if not ok then
        vim.notify('Failed to load colorscheme: ' .. theme, vim.log.levels.WARN)
        set_default_theme()
      end
    end,
  })
end
