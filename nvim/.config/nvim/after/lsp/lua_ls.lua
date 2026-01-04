return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  single_file_support = true,
  settings = {
    Lua = {
      completion = { callSnippet = 'Replace' },
      diagnostics = { globals = { 'vim' }, disable = { 'missing-fields' } },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('config') .. '/lua'] = true,
        },
      },
    },
  },
}
