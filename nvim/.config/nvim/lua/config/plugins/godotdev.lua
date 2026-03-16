---@module 'lazy'
---@type LazySpec
return {
  'Mathijs-Bakker/godotdev.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-lspconfig', 'nvim-dap', 'nvim-dap-ui', 'nvim-treesitter' },
  ft = { 'gd', 'gdshader', 'gdscript' },
  config = function() vim.lsp.enable('gdscript') end,
}
