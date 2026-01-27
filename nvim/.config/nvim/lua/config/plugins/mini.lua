return {
  'nvim-mini/mini.nvim',
  version = '*',
  config = function()
    -- NOTE: Statusline
    require('mini.statusline').setup({ use_icons = vim.g.have_nerd_font })

    -- NOTE: AI
    require('mini.ai').setup({ n_lines = 500 })

    -- NOTE: Align
    require('mini.align').setup()

    -- NOTE: Autopairs
    require('mini.pairs').setup()

    -- NOTE: Indentscope
    require('mini.indentscope').setup()

    -- NOTE: Notify
    require('mini.notify').setup()

    -- NOTE: Tabline
    local MiniTabline = require('mini.tabline')
    MiniTabline.setup({
      show_icons = vim.g.have_nerd_font,
      format = function(buf_id, label)
        local suffix = vim.bo[buf_id].modified and '[+] ' or ''
        return MiniTabline.default_format(buf_id, label) .. suffix
      end,
    })

    -- NOTE: Surround
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

    -- NOTE: Todo Comment Coloring
    require('mini.hipatterns').setup({
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
      },
    })

    -- NOTE: Files
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
  end,
}
