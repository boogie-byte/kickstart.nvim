return {
  -- Linting
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('lint').linters_by_ft = {
        golang = { 'golangcilint' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          require('lint').try_lint()
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
