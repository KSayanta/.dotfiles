require('optional.debug')

vim.pack.add({ _G.gh('NANDquark/nvim-dap-odin') })

require('nvim-dap-odin').setup({
  build_flags = '-debug',
  release_flags = '-o:speed',
  output_dir = './build',
  notifications = false,
})
