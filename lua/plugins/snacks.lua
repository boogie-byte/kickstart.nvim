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
}
