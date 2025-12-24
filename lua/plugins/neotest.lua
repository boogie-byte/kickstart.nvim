return {
  -- A framework for interacting with tests within NeoVim.
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'fredrikaverpil/neotest-golang',
    },
    config = function()
      local neotest = require 'neotest'
      local neotest_golang = require 'neotest-golang'

      neotest.setup {
        adapters = {
          neotest_golang {
            runner = 'gotestsum', -- Optional, but recommended
          },
        },
      }

      vim.keymap.set('n', '<leader>Tn', neotest.run.run, { desc = '[T]esting: run [n]earest test' })
      vim.keymap.set('n', '<leader>Tf', function()
        neotest.run.run(vim.fn.expand '%')
      end, { desc = '[T]esting: run test [f]ile' })
    end,
  },

  -- Reliable Neotest adapter for running Go tests in Neovim.
  {
    'fredrikaverpil/neotest-golang',
    dependencies = {
      'mason-org/mason.nvim',
    },
    version = '*', -- Optional, but recommended; track releases
    build = ':MasonInstall gotestsum',
  },
}
