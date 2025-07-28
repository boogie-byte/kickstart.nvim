return {
  -- A collection of small QoL plugins for Neovim.
  {
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      indent = {},
      zen = {},
    },
    keys = {
      {
        '<leader>z',
        function()
          Snacks.zen()
        end,
        desc = 'Toggle Zen Mode',
      },
      {
        '<leader>Z',
        function()
          Snacks.zen.zoom()
        end,
        desc = 'Toggle Zoom',
      },
    },
  },

  -- Set colorscheme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin-latte'
    end,
  },

  -- More intuitive split pane management
  {
    'mrjones2014/smart-splits.nvim',
    config = function()
      local splits = require 'smart-splits'

      -- resizing splits
      -- these keymaps will also accept a range,
      -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
      vim.keymap.set('n', '<A-h>', splits.resize_left)
      vim.keymap.set('n', '<A-j>', splits.resize_down)
      vim.keymap.set('n', '<A-k>', splits.resize_up)
      vim.keymap.set('n', '<A-l>', splits.resize_right)

      -- moving between splits
      vim.keymap.set('n', '<C-h>', splits.move_cursor_left)
      vim.keymap.set('n', '<C-j>', splits.move_cursor_down)
      vim.keymap.set('n', '<C-k>', splits.move_cursor_up)
      vim.keymap.set('n', '<C-l>', splits.move_cursor_right)
      vim.keymap.set('n', '<C-\\>', splits.move_cursor_previous)

      -- swapping buffers between windows
      vim.keymap.set('n', '<leader>wh', splits.swap_buf_left, { desc = 'Swap windows left' })
      vim.keymap.set('n', '<leader>wj', splits.swap_buf_down, { desc = 'Swap windows down' })
      vim.keymap.set('n', '<leader>wk', splits.swap_buf_up, { desc = 'Swap windows up' })
      vim.keymap.set('n', '<leader>wl', splits.swap_buf_right, { desc = 'Swap windows left' })
    end,
  },

  -- Pretty statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    opts = {
      options = {
        theme = 'catppuccin-latte',
      },
    },
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
