vim.pack.add({
  { src = _G.gh('L3MON4D3/LuaSnip'), version = vim.version.range('2.*') },
  { src = _G.gh('KSayanta/friendly-snippets'), version = 'addendum' },
})

require('luasnip').setup()

require('luasnip.loaders.from_vscode').lazy_load()

require('luasnip.loaders.from_snipmate').lazy_load({ paths = { './snippets' } })
