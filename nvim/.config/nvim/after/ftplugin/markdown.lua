-- Enable wrap and linebreak for window
vim.cmd('setlocal wrap linebreak')

-- Smaller textwidth
vim.cmd('setlocal textwidth=80')

-- Fold with tree-sitter
vim.cmd('setlocal foldmethod=expr foldexpr=v:lua.vim.treesitter.foldexpr()')
