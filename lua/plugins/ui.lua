return {
  -- Useful status updates for LSP.
  { 'j-hui/fidget.nvim', opts = {} },

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
    opts = {},
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
}
