return {
  -- Autoformat
  {
    'stevearc/conform.nvim',
    config = function()
      local conform = require 'conform'

      conform.setup {
        default_format_opts = {
          lsp_format = 'fallback',
        },
        formatters_by_ft = {
          lua = { 'stylua' },
          go = { 'goimports', 'gofumpt' },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = 'fallback',
        },
      }

      vim.keymap.set('n', '<leader>bf', conform.format, { desc = '[b]uffer [f]ormat' })
    end,
  },

  -- Install formatters registered with conform.nvim via Mason.
  {
    'zapling/mason-conform.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'stevearc/conform.nvim',
    },
    opts = {},
  },
}
