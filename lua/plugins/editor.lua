return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Automatically highlight other uses of the word under the cursor
  'RRethy/vim-illuminate',

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = false,
    },
  },

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      spec = {
        { '<leader>b', group = '[b]uffer' },
        { '<leader>c', group = '[c]ode' },
        { '<leader>d', group = '[d]ebug' },
        { '<leader>f', group = '[f]ile' },
        { '<leader>g', group = '[g]it' },
        { '<leader>h', group = '[h]unk', mode = { 'n', 'v' } },
        { '<leader>r', group = '[r]ename' },
        { '<leader>s', group = '[s]earch' },
        { '<leader>t', group = '[t]oggle' },
        { '<leader>w', group = '[w]indow' },
      },
    },
  },

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, keys, func, desc)
          local opts = {
            buffer = bufnr,
            desc = desc,
          }
          vim.keymap.set(mode, keys, func, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, 'Jump to next git [c]hange')

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, 'Jump to previous git [c]hange')

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, '[h]unk [s]tage]')
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, '[h]unk [s]tage]')
        map('n', '<leader>hr', gitsigns.reset_hunk, '[h]unk [r]eset')
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, '[h]unk [r]eset')
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, '[h]unk [u]nstage')
        map('n', '<leader>hp', gitsigns.preview_hunk, '[h]unk [p]review')

        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, '[t]oggle current line [b]lame')
        map('n', '<leader>tD', gitsigns.toggle_deleted, '[t]oggle [d]eleted')

        map('n', '<leader>bs', gitsigns.stage_buffer, '[b]uffer [s]tage')
        map('n', '<leader>br', gitsigns.reset_buffer, '[b]uffer [r]eset')
        map('n', '<leader>hb', function()
          gitsigns.blame_line { full = true }
        end)
      end,
    },
  },
}
