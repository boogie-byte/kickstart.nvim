return {
  -- Set colorscheme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
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

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      spec = {
        { '<leader>b', group = '[b]uffer' },
        { '<leader>f', group = '[f]ind' },
        { '<leader>g', group = '[g]it' },
        { '<leader>gh', group = '[g]it [h]unk' },
        { '<leader>t', group = '[t]oggle' },
        { '<leader>T', group = '[T]esting' },
        { '<leader>w', group = '[w]indow' },
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
      'rcarriga/nvim-notify',
      'nvim-treesitter/nvim-treesitter',
      'hrsh7th/nvim-cmp',
    },
    build = ':TSInstall vim regex lua bash markdown markdown_inline',
  },

  -- telescope.nvim is a highly extendable fuzzy finder over lists.
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local builtin = require 'telescope.builtin'

      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[f]ind [b]uffers' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]iles' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[f]ind with [g]rep' })
      vim.keymap.set('n', '<leader>fD', builtin.diagnostics, { desc = '[f]ind [D]iagnostic' })
      vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, { desc = '[f]ind [d]efinition' })
      vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, { desc = '[f]ind [i]mplementation' })
      vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = '[f]ind [r]eferences' })
      vim.keymap.set('n', '<leader>ft', builtin.lsp_type_definitions, { desc = '[f]ind [t]ype definition' })
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {},
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Deep buffer integration for Git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require 'gitsigns'
      gitsigns.setup()

      vim.keymap.set('n', '<leader>ts', gitsigns.toggle_signs, { desc = '[t]oggle git [s]igns' })
      vim.keymap.set('n', '<leader>tW', gitsigns.toggle_word_diff, { desc = '[t]oggle git [W]ord diff' })
      vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, { desc = '[g]it [b]lame current line' })
      vim.keymap.set('n', '<leader>ghp', gitsigns.preview_hunk, { desc = '[g]it [h]unk [p]review' })
      vim.keymap.set('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[g]it [h]unk [r]eset' })
    end,
  },

  -- Displays coverage information in the sign column.
  {
    'andythigpen/nvim-coverage',
    version = '*',
    config = function()
      local coverage = require 'coverage'

      coverage.setup {
        auto_reload = true,
      }

      vim.keymap.set('n', '<leader>tc', coverage.toggle, { desc = '[t]oggle test [c]overage' })
    end,
  },
}
