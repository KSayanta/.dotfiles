return {
  on_attach = function(client) client.server_capabilities.definitionProvider = false end,
}
