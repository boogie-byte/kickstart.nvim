return {
  -- default Nvim LSP client configurations for various LSP servers.
  'neovim/nvim-lspconfig',

  -- mason-lspconfig bridges mason.nvim with the lspconfig plugin.
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
  },
}
