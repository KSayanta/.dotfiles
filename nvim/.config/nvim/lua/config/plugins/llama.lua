local host = '192.168.0.111'
local port_fim = '8013'
local port_inst = '8012'

return {
  'ggml-org/llama.vim',
  init = function()
    vim.g.llama_config = {
      keymap_fim_trigger = '<C-e>',
      keymap_fim_accept_full = '<C-f>',
      keymap_fim_accept_line = '<C-L>',
      keymap_fim_accept_word = '<C-]>',
      keymap_inst_trigger = '<leader>li',
      keymap_inst_rerun = '<leader>lr',
      keymap_inst_continue = '<leader>lc',
      keymap_inst_accept = '<leader>la',
      keymap_inst_cancel = '<leader>lq',
      keymap_debug_toggle = '<leader>ld',

      enable_at_startup = false,
      auto_fim = false,
      endpoint_fim = 'http://' .. host .. ':' .. port_fim .. '/infill',
      endpoint_inst = 'http://' .. host .. ':' .. port_inst .. '/v1/chat/completions',
      -- stop_strings = { '\n' },

      -- For Reference :help llama_config
    }
  end,
  config = function() vim.keymap.set({ 'n' }, '<leader>lt', ':LlamaToggle<CR>', { desc = '[L]lama [T]oggle', silent = true }) end,
}
