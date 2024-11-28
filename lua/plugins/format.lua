return {
  -- Autoformat
  {
    'stevearc/conform.nvim',
    config = function()
      local conform = require 'conform'

      conform.setup {
        formatters_by_ft = {
          lua = { 'stylua' },
        },
        default_format_opts = {
          lsp_format = 'fallback',
        },
        format_on_save = {},
      }

      vim.keymap.set('n', '<leader>bf', conform.format, { desc = '[b]uffer [f]ormat' })
    end,
  },

  -- Install formatters registered with conform.nvim via Mason.
  {
    'zapling/mason-conform.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'stevearc/conform.nvim',
    },
    opts = {},
  },
}
