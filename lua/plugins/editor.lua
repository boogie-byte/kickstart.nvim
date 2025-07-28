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
        map('n', '<leader>td', gitsigns.toggle_deleted, '[t]oggle [d]eleted')

        map('n', '<leader>bs', gitsigns.stage_buffer, '[b]uffer [s]tage')
        map('n', '<leader>br', gitsigns.reset_buffer, '[b]uffer [r]eset')
        map('n', '<leader>hb', function()
          gitsigns.blame_line { full = true }
        end)
        map('n', '<leader>gd', gitsigns.diffthis, 'show [g]it [d]iff')
        map('n', '<leader>gD', function()
          gitsigns.diffthis '@'
        end, 'show [g]it [D]iff against HEAD')
      end,
    },
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',

      -- Native FZF sorter that uses compiled C to do the matching, supports fzf syntax
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
      },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local telescope = require 'telescope'

      telescope.setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      telescope.load_extension 'ui-select'
      telescope.load_extension 'fzf'

      local map = function(keys, func, desc)
        vim.keymap.set('n', '<leader>' .. keys, func, { desc = desc })
      end

      local builtin = require 'telescope.builtin'
      map('/', builtin.current_buffer_fuzzy_find, '[/] Fuzzily search in current buffer')

      map('fb', builtin.buffers, '[f]ind [b]uffers')
      map('fd', builtin.lsp_definitions, '[f]ind [d]efinitions')
      map('fD', builtin.diagnostics, '[f]ind [D]iagnostics') --FIXME: add a keymap for current buffer only (option bufnr=0)
      map('ff', builtin.find_files, '[f]ind [f]iles')
      map('fg', builtin.live_grep, '[f]ind by [g]rep')
      map('fG', function()
        builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in open files' }
      end, '[f]ind by [G]rep in open files')
      map('fh', builtin.help_tags, '[f]ind [h]elp')
      map('fi', builtin.lsp_implementations, '[f]ind [i]mplementations')
      map('fk', builtin.keymaps, '[f]ind [k]eymaps')
      map('fo', builtin.oldfiles, '[f]ind [o]ld files')
      map('fr', builtin.lsp_references, '[f]ind [r]references')
      map('fR', builtin.resume, '[f]ind [R]esume')
      map('fs', builtin.lsp_document_symbols, '[f]ind [s]ymbols in document')
      map('fS', builtin.lsp_dynamic_workspace_symbols, '[f]ind [S]ymbols in workspace')
      map('ft', builtin.lsp_type_definitions, '[f]ind [t]ype definitions')
      map('fT', builtin.builtin, '[f]ind [T]elescope builtin')
      map('fw', builtin.grep_string, '[f]ind current [w]ord')

      map('gb', builtin.git_branches, 'list [g]it [b]ranches')
      map('gc', builtin.git_commits, 'list [g]it [c]ommits')
      map('gC', builtin.git_bcommits, 'list [g]it [c]ommits for current buffer')
      map('gf', builtin.git_files, 'search [g]it [f]files fuzzily')
      map('gs', builtin.git_status, 'show [g]it [s]tatus')
      map('gS', builtin.git_stash, 'show [g]it [S]tash')
    end,
  },
}
