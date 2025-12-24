return {
  -- A UI for nvim-dap which provides a good out of the box configuration.
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfusseneger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
  },

  -- mason-nvim-dap bridges mason.nvim with the nvim-dap plugin.
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    opts = {
      handlers = {}, -- this is to setup all ensured adapters automatically
    },
  },

  -- This plugin adds virtual text support to nvim-dap. nvim-treesitter is used
  -- to find variable definitions.
  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  },

  -- An extension for nvim-dap providing configurations for launching go debugger (delve) and debugging individual tests.
  {
    'leoluz/nvim-dap-go',
    opts = {},
  },
}
