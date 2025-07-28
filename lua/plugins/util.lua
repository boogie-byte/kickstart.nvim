return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
  { 'mason-org/mason.nvim', opts = {} },

  -- properly configure LuaLS for editing your Neovim config.
  { 'folke/lazydev.nvim', ft = 'lua', opts = {} },
}
