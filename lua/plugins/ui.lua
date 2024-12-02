return {
  -- A collection of small QoL plugins for Neovim.
  {
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- Detect OS dark mode automatically
  {
    'f-person/auto-dark-mode.nvim',
    lazy = false,
    priority = 1100, -- Make sure to load this before all the other start plugins.
    opts = {},
  },

  -- Set colorscheme
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'onedark'
    end,
  },

  -- Pretty statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Don't show the mode, since it's already in the status line
      vim.opt.showmode = false
      require('lualine').setup {
        theme = 'onedark',
      }
    end,
  },

  -- Better UI for messages, cmdline and the popupmenu
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        lsp_doc_border = true,
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'folke/snacks.nvim', -- for notifications to work
      'hrsh7th/nvim-cmp',
    },
  },
}
