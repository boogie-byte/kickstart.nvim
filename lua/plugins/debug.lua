return {
  -- A UI for nvim-dap which provides a good out of the box configuration.
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup()

      dap.listeners.before.attach.dapui_config = dapui.open
      dap.listeners.before.launch.dapui_config = dapui.open
      dap.listeners.before.event_terminated.dapui_config = dapui.close
      dap.listeners.before.event_exited.dapui_config = dapui.close

      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { desc = desc })
      end

      map('<F5>', dap.continue, 'Start/Continue debugging')
      map('<F6>', dap.terminate, 'Stop debugging')
      map('<F10>', dap.step_over, 'Step over')
      map('<F11>', dap.step_into, 'Step into')
      map('<F12>', dap.step_out, 'Step out')
      map('<leader>db', dap.toggle_breakpoint, '[d]ebug: [t]oggle [b]reakpoint')
      map('<leader>dr', dap.repl.open, '[d]ebug: open [r]EPL')
      map('<leader>dl', dap.run_last, '[d]ebug: run [l]ast debugging session')
      map('<leader>du', dapui.toggle, '[d]ebug: toggle debug [u]I')
    end,
  },

  -- mason-nvim-dap bridges mason.nvim with the nvim-dap plugin.
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    opts = {
      ensure_installed = {
        'delve',
      },
      handlers = {}, -- this is to setup all ensured adapters automatically
    },
  },
}
