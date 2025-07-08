return {
  -- A completion engine plugin for neovim written in Lua.
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<CR>'] = cmp.mapping.confirm(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
        },
        sources = {
          { name = 'nvim_lsp' },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }
    end,
  },

  -- nvim-cmp source for neovim's built-in language server client.
  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    config = function()
      vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })
    end,
  },

  -- A super powerful autopair plugin for Neovim that supports multiple characters.
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('nvim-autopairs').setup()
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  -- default Nvim LSP client configurations for various LSP servers.
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
  },

  -- mason-lspconfig bridges mason.nvim with the lspconfig plugin.
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'neovim/nvim-lspconfig',
    },
  },
}
