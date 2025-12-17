return {
  -- Linting
  {
    'mfussenegger/nvim-lint',
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = {
        golang = { 'golangcilint' },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- Install linters configured in nvim-lint.
  {
    'rshkarin/mason-nvim-lint',
    dependencies = {
      'mason-org/mason.nvim',
      'mfussenegger/nvim-lint',
    },
    opts = {},
  },
}
