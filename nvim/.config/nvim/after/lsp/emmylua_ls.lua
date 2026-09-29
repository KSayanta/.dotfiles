return {
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = false

    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.emmyrc.json') or vim.uv.fs_stat(path .. '/.luarc.json')) then
        client.config.settings = {}
      end
    end
  end,
  settings = {
    emmylua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = {
        globals = { 'vim', 'MiniIcons' },
        disable = { 'missing-fields' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        format = { enable = false },
      },
    },
  },
}
