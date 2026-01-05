return {

  -- NOTE: Kanagawa
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup({
        transparent = vim.g.transparent_enabled,
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        typeStyle = {},
        dimInactive = false,
        terminalColors = true,
        -- add/modify theme and palette colors
        colors = {
          palette = {},
          theme = {
            wave = {},
            dragon = {},
            all = {
              ui = { bg_gutter = 'none' },
            },
          },
        },
        -- add/modify highlights
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            FloatTitle = { bg = 'none' },
            Pmenu = { fg = theme.ui.shade0, bg = 'none', blend = vim.o.pumblend },
            PmenuSel = { fg = 'none', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            PmenuExtra = { bg = 'none' },
            BlinkCmpMenuBorder = { bg = 'none' },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptBorder = { fg = theme.ui.special },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim },
            TelescopeResultsBorder = { fg = theme.ui.special },
            TelescopePreviewBorder = { fg = theme.ui.special },
          }
        end,
        theme = 'wave', -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = 'wave', -- try "dragon" !
        },
      })
    end,
  },

  -- NOTE: Tokyonight
  {
    'folke/tokyonight.nvim',
    name = 'folkeTokyonight',
    priority = 1000,
    config = function()
      local transparent = vim.g.transparent_enabled
      local bg = '#011628'
      local bg_dark = '#011423'
      local bg_highlight = '#143652'
      local bg_search = '#0A64AC'
      local bg_visual = '#275378'
      local fg = '#CBE0F0'
      local fg_dark = '#B4D0E9'
      local fg_gutter = '#627E97'
      local border = '#547998'

      require('tokyonight').setup({
        style = 'night',
        transparent = vim.g.transparent_enabled,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = transparent and 'transparent' or 'dark',
          floats = transparent and 'transparent' or 'dark',
        },
        on_colors = function(colors)
          colors.bg = transparent and colors.none or bg
          colors.bg_dark = transparent and colors.none or bg_dark
          colors.bg_float = transparent and colors.none or bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = transparent and colors.none or bg_dark
          colors.bg_statusline = transparent and colors.none or bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
          vim.api.nvim_set_hl(0, 'PmenuExtra', { fg = '#9d7cd8', bg = 'none' })
        end,
      })
    end,
  },

  -- NOTE: Onedark
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function()
      require('onedarkpro').setup({
        options = {
          transparency = vim.g.transparent_enabled,
          cursorline = true,
        },
        highlights = {},
      })
    end,
  },
}
