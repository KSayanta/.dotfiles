return {
  init_options = {
    checker_args = '-strict-style',
    collections = {
      { name = 'shared', path = vim.fn.expand('$HOME/bin/odin') },
    },
  },
}
