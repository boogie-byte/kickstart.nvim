return {
  -- Dead simple plugin to center the currently focused buffer to the middle of the screen.
  {
    'shortcuts/no-neck-pain.nvim',
    config = function()
      vim.keymap.set('', '<leader>C', require('no-neck-pain').toggle, { desc = '[C]entered window mode' })
    end,
  },

  -- This plugin adds indentation guides to Neovim.
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },

  -- A collection of small QoL plugins for Neovim.
  {
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
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
