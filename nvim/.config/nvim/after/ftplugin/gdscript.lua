require('optional.debug')

vim.pack.add({ _G.gh('Mathijs-Bakker/godotdev.nvim') })

require('godotdev').setup({
  formatter = 'gdscript-formatter',
  treesitter = { auto_setup = false },
})

vim.lsp.enable('gdscript')
