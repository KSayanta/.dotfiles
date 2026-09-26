local vimapi = vim.api

vimapi.nvim_create_user_command('PackUpdate', ':lua vim.pack.update()', { desc = 'Update plugins' })

vimapi.nvim_create_user_command('PackCheckUpdate', ':lua vim.pack.update(nil, { offline = true })', { desc = 'Check plugins update' })

vim.api.nvim_create_user_command('PackDel', function(opts) vim.pack.del({ opts.fargs[1] }) end, { nargs = 1, desc = 'Delete a vim.pack plugin' })
