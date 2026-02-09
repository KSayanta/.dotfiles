return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    -- Snippet Engine
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = 'make install_jsregexp',
      dependencies = {
        -- Template snippets
        {
          'KSayanta/friendly-snippets',
          branch = 'test',
          config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
        },
      },
      opts = {},
    },
  },

  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      -- See :h blink-cmp-config-keymap
      preset = 'none',

      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide' },
      ['<Tab>'] = { 'select_and_accept', 'fallback' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

      ['<C-l>'] = { 'snippet_forward', 'fallback' },
      ['<C-h>'] = { 'snippet_backward', 'fallback' },

      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },

      -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
      --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    },

    appearance = { nerd_font_variant = 'mono' },

    completion = {
      -- Set `auto_show = true` to show the documentation after a delay.
      documentation = { auto_show = false, auto_show_delay_ms = 500 },

      -- nvim-cmp style completion
      menu = {
        draw = {
          columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'source_name' } },
        },
      },
    },

    snippets = { preset = 'luasnip' },
    signature = { enabled = false },
    fuzzy = { implementation = 'lua' },

    sources = {

      -- Dynamically picking providers by treesitter node/filetype
      default = function()
        local success, node = pcall(vim.treesitter.get_node)
        if success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
          return { 'buffer' }
        elseif vim.bo.filetype == 'lua' then
          return { 'lsp', 'path' }
        else
          return { 'lsp', 'path', 'snippets', 'buffer' }
        end
      end,

      providers = {
        snippets = { max_items = 3 },

        -- Make buffer compeletions appear at the end.
        buffer = {
          score_offset = -100,
          enabled = function()
            -- Filetypes for which buffer completions are enabled; add filetypes to extend:
            local enabled_filetypes = { 'markdown', 'text' }
            local filetype = vim.bo.filetype
            return vim.tbl_contains(enabled_filetypes, filetype)
          end,
        },
      },
    },
  },
}
