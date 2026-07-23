local debuggers = {
  'codelldb',
}

vim.pack.add({
  { src = _G.gh('mfussenegger/nvim-dap') },
  { src = _G.gh('nvim-neotest/nvim-nio') },
  { src = _G.gh('rcarriga/nvim-dap-ui') },
  { src = _G.gh('jay-babu/mason-nvim-dap.nvim') },
})

local dap = require('dap')

vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function() dap.set_breakpoint(vim.fn.input('Log point message: ')) end, { desc = 'Debug: Set Breakpoint Log Point' })
vim.keymap.set('n', '<F7>', function() dap.run_last() end, { desc = 'Debug: See last session result.' })

require('mason-nvim-dap').setup({
  automatic_installation = true,
  handlers = {},
  ensure_installed = debuggers,
})

local dapui = require('dapui')

dapui.setup({
  icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
  controls = {
    icons = {
      pause = '⏸',
      play = '▶',
      step_into = '⏎',
      step_over = '⏭',
      step_out = '⏮',
      step_back = 'b',
      run_last = '▶▶',
      terminate = '⏹',
      disconnect = '⏏',
    },
  },
})

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close
