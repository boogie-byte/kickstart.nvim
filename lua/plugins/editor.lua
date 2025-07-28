return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

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
}
