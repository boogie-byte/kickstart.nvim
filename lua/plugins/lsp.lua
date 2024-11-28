return {
  -- nvim-cmp source for neovim's built-in language server client.
  'hrsh7th/cmp-nvim-lsp',

  -- A completion engine plugin for neovim written in Lua.
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
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
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }
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
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = {
        'gopls',
        'lua_ls',
      },
      handlers = {
        function(server_name)
          local lspconfig = require 'lspconfig'
          lspconfig[server_name].setup {
            on_attach = function(_, buffer)
              local map = function(keys, func, desc)
                local opts = {
                  buffer = buffer,
                  desc = desc,
                }
                vim.keymap.set('n', keys, func, opts)
              end

              map('K', vim.lsp.buf.hover, 'Hover Documentation')

              map('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
              map('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
              map('gr', vim.lsp.buf.references, '[g]oto [r]eferences')
              map('gy', vim.lsp.buf.type_definition, '[g]oto t[y]pe definition')

              map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
              map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            end,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
          }
        end,
      },
    },
  },
}
