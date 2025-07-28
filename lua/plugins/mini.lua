return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      local minidiff = require 'mini.diff'
      minidiff.setup {
        view = {
          style = 'sign',
        },
        mappings = {
          apply = '<leader>ha',
          reset = '<leader>hr',
        },
      }
      vim.keymap.set('n', '<leader>tm', minidiff.toggle_overlay, { desc = 'Toggle MiniDiff' })

      local cursorword = require 'mini.cursorword'
      cursorword.setup()
      vim.cmd 'hi! link MiniCursorword Visual' -- use visual highlight group instead of underline
      vim.cmd 'hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE' -- do not highlight the word under cursor

      require('mini.git').setup()
      require('mini.icons').setup()
      require('mini.pairs').setup()
      require('mini.statusline').setup()
      require('mini.trailspace').setup()
    end,
  },
}
