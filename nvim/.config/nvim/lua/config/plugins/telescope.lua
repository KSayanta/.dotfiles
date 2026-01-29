return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function() return vim.fn.executable('make') == 1 end,
    },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },

  config = function()
    require('telescope').setup({
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- Telescope keybinds
    local map = vim.keymap.set
    local builtin = require('telescope.builtin')

    map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    map('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    map('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    map('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    map({ 'n', 'v' }, '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    map('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    map('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    map('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    map('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
    map('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })

    -- Search in Neovim configuration files
    map('n', '<leader>sn', function() builtin.find_files({ cwd = vim.fn.stdpath('config') }) end, { desc = '[S]earch [N]eovim files' })

    -- Override default behavior and theme
    map(
      'n',
      '<leader>/',
      function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end,
      { desc = '[/] Fuzzily search in current buffer' }
    )

    -- Search in open files
    map(
      'n',
      '<leader>s/',
      function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        })
      end,
      { desc = '[S]earch [/] in Open Files' }
    )

    -- This runs on LSP attach per buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
      callback = function(event)
        local buf = event.buf
        map('n', 'grr', builtin.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })
        map('n', 'gri', builtin.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })
        map('n', 'grd', builtin.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })
        map('n', 'grt', builtin.lsp_type_definitions, { buffer = buf, desc = '[G]oto [T]ype Definition' })
        map('n', 'gO', builtin.lsp_document_symbols, { buffer = buf, desc = 'Open Document Symbols' })
        map('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Open Workspace Symbols' })
      end,
    })
  end,
}
