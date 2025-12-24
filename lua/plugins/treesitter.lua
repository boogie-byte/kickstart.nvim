return {
  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main', -- 'master' is archived
    lazy = false,
    build = ':TSUpdate',
  },
}
