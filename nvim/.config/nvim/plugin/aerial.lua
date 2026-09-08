vim.pack.add({ _G.gh('stevearc/aerial.nvim') })

require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
  end,

  -- Priority list of preferred backends for aerial.
  -- This can be a filetype map (see :help aerial-filetype-map)
  backends = { 'lsp', 'treesitter', 'markdown', 'asciidoc', 'man' },
  layout = {
    max_width = { 40, 0.25 },
    min_width = 25,
    default_direction = 'prefer_left',
    placement = 'edge',
  },

  -- List of enum values that configure when to auto-close the aerial window
  --   unfocus       - close aerial when you leave the original source window
  --   switch_buffer - close aerial when you change buffers in the source window
  --   unsupported   - close aerial when attaching to a buffer that has no symbol source
  close_automatic_events = { 'unsupported' },

  -- A list of all symbols to display. Set to false to display all symbols.
  -- This can be a filetype map (see :help aerial-filetype-map)
  -- To see all available values, see :help SymbolKind
  filter_kind = {
    ['_'] = {
      'Class',
      'Constructor',
      'Enum',
      'Event',
      'Function',
      'Interface',
      'Method',
      'Module',
      'Object',
      'Struct',
      'TypeParameter',
    },
    markdown = false,
  },

  -- Show box drawing characters for the tree hierarchy
  show_guides = true,
})

vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
