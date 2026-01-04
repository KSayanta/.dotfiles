return {
  cmd = { 'cssmodules-language-server' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  on_attach = function(client)
    client.server_capabilities.definitionProvider = false
  end,
}
