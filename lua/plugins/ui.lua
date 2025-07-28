return {
  -- A collection of small QoL plugins for Neovim.
  {
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    ---@type snacks.Config
    opts = {
      indent = { enabled = true },
      explorer = { enabled = true },
      picker = { enabled = true },
      toggle = { enabled = true },
      zen = { enabled = true },
    },
    -- stylua: ignore
    keys = {
      { '<leader>E', function() Snacks.explorer() end, desc = 'File Explorer' },

      { '<leader><space>', function() Snacks.picker.smart() end, desc = 'Smart Find Files' },

      { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
      { '<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files' },

      { '<leader>fB', function() Snacks.picker.lines() end, desc = 'Buffer Lines' },
      { '<leader>fg', function() Snacks.picker.grep() end, desc = 'Grep' },
      { '<leader>fG', function() Snacks.picker.grep_buffers() end, desc = 'Grep Open Buffers' },
      { '<leader>fw', function() Snacks.picker.grep_word() end, desc = 'Visual selection or word', mode = { 'n', 'x' } },

      { '<leader>fc', function() Snacks.picker.command_history() end, desc = 'Command History' },
      { '<leader>fC', function() Snacks.picker.commands() end, desc = 'Commands' },
      { '<leader>fk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },

      { '<leader>fd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
      { '<leader>fD', function() Snacks.picker.lsp_declarations() end, desc = 'Goto Declaration' },
      { '<leader>fr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'References' },
      { '<leader>fi', function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementation' },
      { '<leader>ft', function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto Type Definition' },
      { '<leader>fs', function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols' },
      { '<leader>fS', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols' },

      -- { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics' },
      -- { '<leader>sD', function() Snacks.picker.diagnostics_buffer() end, desc = 'Buffer Diagnostics' },

      { '<leader>gb', function() Snacks.picker.git_branches() end, desc = 'Git Branches' },
      { '<leader>gl', function() Snacks.picker.git_log() end, desc = 'Git Log' },
      { '<leader>gL', function() Snacks.picker.git_log_line() end, desc = 'Git Log Line' },
      { '<leader>gs', function() Snacks.picker.git_status() end, desc = 'Git Status' },
      { '<leader>gS', function() Snacks.picker.git_stash() end, desc = 'Git Stash' },
      { '<leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git Diff (Hunks)' },
      { '<leader>gf', function() Snacks.picker.git_log_file() end, desc = 'Git Log File' },

      { '<leader>z', function() Snacks.zen() end, desc = 'Toggle Zen Mode' },
      { '<leader>Z', function() Snacks.zen.zoom() end, desc = 'Toggle Zoom' },
    },

    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>ts'
          Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>tw'
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>tN'
          Snacks.toggle.diagnostics():map '<leader>td'
          Snacks.toggle.line_number():map '<leader>tn'
          Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>tc'
          Snacks.toggle.treesitter():map '<leader>tT'
          Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>tb'
          Snacks.toggle.inlay_hints():map '<leader>th'
          Snacks.toggle.indent():map '<leader>ti'
          Snacks.toggle.dim():map '<leader>td'
        end,
      })
    end,
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
