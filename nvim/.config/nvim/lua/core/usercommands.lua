local vimapi = vim.api

vimapi.nvim_create_user_command('PackUpdate', ':lua vim.pack.update()', { desc = 'Update plugins' })

vimapi.nvim_create_user_command('CheckUpdate', ':lua vim.pack.update(nil, { offline = true })', { desc = 'Check plugins update' })
