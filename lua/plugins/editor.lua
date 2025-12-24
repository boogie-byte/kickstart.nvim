return {
  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main', -- 'master' is archived
    lazy = false,
    build = ':TSUpdate',
  },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Neovim plugin for automatically highlighting other uses of the word under
  -- the cursor using either LSP, Tree-sitter, or regex matching.
  'RRethy/vim-illuminate',

  -- Work with trailing whitespace
  { 'nvim-mini/mini.trailspace', version = false },

  -- This plugin adds indentation guides to Neovim.
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },

  -- todo-comments is a lua plugin for Neovim >= 0.8.0 to highlight and search
  -- for todo comments like TODO, HACK, BUG in your code base.
  {
    'folke/todo-comments.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    opts = {},
    keys = {
      { '<leader>fc', '<CMD>TodoTelescope<CR>', desc = '[f]ind TODO [c]omments' },
    },
  },

  -- A super powerful autopair plugin for Neovim that supports multiple characters.
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  -- Neovim plugin for splitting/joining blocks of code like arrays, hashes,
  -- statements, objects, dictionaries, etc.
  {
    'Wansmer/treesj',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local treesj = require 'treesj'
      treesj.setup {
        use_default_keymaps = false,
      }

      vim.keymap.set('n', 'gS', treesj.toggle, { desc = 'toggle block split' })
    end,
  },
}
