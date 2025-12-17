return {
  -- A completion engine plugin for neovim written in Lua.
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'windwp/nvim-autopairs',
    },
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
          { name = 'lazydev', group_index = 0 },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
  },

  -- nvim-cmp source for neovim's built-in language server client.
  {
    'hrsh7th/cmp-nvim-lsp',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities(),
      vim.lsp.config('*', { capabilities = capabilities })
    end,
  },
}
