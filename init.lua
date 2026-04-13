-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Set proper tab width
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Enable line breaks on word boundaries.
vim.opt.linebreak = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'
if vim.fn.has 'wsl' == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.diagnostic.config { jump = { on_jump = vim.diagnostic.open_float }, virtual_text = true }

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Plugins ]]
vim.pack.add {
  -- Colorscheme
  'https://github.com/catppuccin/nvim',

  -- Provides Nerd Font icons (glyphs)for use by Neovim plugins.
  'https://github.com/nvim-tree/nvim-web-devicons',

  -- A blazing fast and easy to configure Neovim statusline written in Lua.
  -- Depends on:
  --   nvim-tree/nvim-web-devicons
  'https://github.com/nvim-lualine/lualine.nvim',

  -- Highlight, edit, and navigate code.
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main', -- 'master' is archived
  },

  -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
  'https://github.com/mason-org/mason.nvim',

  -- default Nvim LSP client configurations for various LSP servers.
  'https://github.com/neovim/nvim-lspconfig',

  -- mason-lspconfig bridges mason.nvim with the lspconfig plugin.
  -- Depends on:
  --   mason-org/mason.nvim
  --   neovim/nvim-lspconfig
  'https://github.com/mason-org/mason-lspconfig.nvim',

  -- Useful lua functions.
  'https://github.com/nvim-lua/plenary.nvim',

  -- telescope.nvim is a highly extendable fuzzy finder over lists.
  -- Depends on:
  --   nvim-lua/plenary.nvim
  'https://github.com/nvim-telescope/telescope.nvim',

  -- Detect tabstop and shiftwidth automatically
  'https://github.com/tpope/vim-sleuth',

  -- Neovim plugin for automatically highlighting other uses of the word under
  -- the cursor using either LSP, Tree-sitter, or regex matching.
  'https://github.com/RRethy/vim-illuminate',

  -- Work with trailing whitespace
  'https://github.com/nvim-mini/mini.trailspace',

  -- This plugin adds indentation guides to Neovim.
  'https://github.com/lukas-reineke/indent-blankline.nvim',

  -- todo-comments is a lua plugin for Neovim >= 0.8.0 to highlight and search
  -- for todo comments like TODO, HACK, BUG in your code base.
  -- Depends on:
  --   nvim-lua/plenary.nvim
  --   nvim-telescope/telescope.nvim
  'https://github.com/folke/todo-comments.nvim',

  -- A super powerful autopair plugin for Neovim that supports multiple characters.
  'https://github.com/windwp/nvim-autopairs',

  -- Neovim plugin for splitting/joining blocks of code like arrays, hashes,
  -- statements, objects, dictionaries, etc.
  -- Depends on:
  --   nvim-treesitter/nvim-treesitter
  'https://github.com/Wansmer/treesj',

  -- More intuitive split pane management
  'https://github.com/mrjones2014/smart-splits.nvim',

  -- Useful plugin to show you pending keybinds.
  -- Depends on:
  --   nvim-tree/nvim-web-devicons
  'https://github.com/folke/which-key.nvim',

  -- Deep buffer integration for Git
  'https://github.com/lewis6991/gitsigns.nvim',

  -- Displays coverage information in the sign column.
  'https://github.com/andythigpen/nvim-coverage',

  -- nvim-cmp source for neovim's built-in language server client.
  'https://github.com/hrsh7th/cmp-nvim-lsp',

  -- A super powerful autopair plugin that supports multiple characters.
  'https://github.com/windwp/nvim-autopairs',

  -- A completion engine plugin for neovim written in Lua.
  -- Depends on:
  --   hrsh7th/nvim-cmp
  'https://github.com/hrsh7th/nvim-cmp',

  -- Lightweight yet powerful formatter plugin.
  'https://github.com/stevearc/conform.nvim',

  -- Install formatters registered with conform.nvim via Mason.
  -- Depends on:
  --   mason-org/mason.nvim
  --   stevearc/conform.nvim
  'https://github.com/zapling/mason-conform.nvim',

  -- Debug Adapter Protocol client implementation.
  'https://github.com/mfussenegger/nvim-dap',

  -- A library for asynchronous IO in Neovim, inspired by the asyncio library in Python.
  'https://github.com/nvim-neotest/nvim-nio',

  -- A UI for nvim-dap which provides a good out of the box configuration.
  -- Depends on:
  --   mfussenegger/nvim-dap
  --   nvim-neotest/nvim-nio
  'https://github.com/rcarriga/nvim-dap-ui',

  -- mason-nvim-dap bridges mason.nvim with the nvim-dap plugin.
  -- Depends on:
  --   mason-org/mason.nvim
  --   mfussenegger/nvim-dap
  'https://github.com/jay-babu/mason-nvim-dap.nvim',

  -- This plugin adds virtual text support to nvim-dap. nvim-treesitter is used
  -- to find variable definitions.
  -- Depends on:
  --   mfussenegger/nvim-dap
  --   nvim-treesitter/nvim-treesitter
  'https://github.com/theHamsta/nvim-dap-virtual-text',

  -- An extension for nvim-dap providing configurations for launching go debugger (delve) and debugging individual tests.
  -- Depends on:
  --   mfussenegger/nvim-dap
  'https://github.com/leoluz/nvim-dap-go',

  -- An asynchronous linter plugin complementary to the built-in Language Server Protocol support.
  'https://github.com/mfussenegger/nvim-lint',

  -- Install linters configured in nvim-lint.
  -- Depends on:
  --   mason-org/mason.nvim
  --   mfussenegger/nvim-lint
  'https://github.com/rshkarin/mason-nvim-lint',

  -- UI Component Library.
  'https://github.com/MunifTanjim/nui.nvim',

  -- A fancy, configurable, notification manager.
  'https://github.com/rcarriga/nvim-notify',

  -- Better UI for messages, cmdline and the popupmenu
  -- Depends on:
  --   nvim-treesitter/nvim-treesitter
  --   hrsh7th/nvim-cmp
  'https://github.com/folke/noice.nvim',
}

-- catppuccin/nvim
vim.cmd.colorscheme 'catppuccin-macchiato'

-- nvim-lualine/lualine.nvim
require('lualine').setup {}

-- nvim-treesitter/nvim-treesitter
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
    end
  end,
})

-- mason-org/mason.nvim
require('mason').setup()

-- mason-org/mason-lspconfig.nvim
require('mason-lspconfig').setup()

-- nvim-telescope/telescope.nvim
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[f]ind [b]uffers' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[f]ind with [g]rep' })
vim.keymap.set('n', '<leader>fD', builtin.diagnostics, { desc = '[f]ind [D]iagnostic' })
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, { desc = '[f]ind [d]efinition' })
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, { desc = '[f]ind [i]mplementation' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = '[f]ind [r]eferences' })
vim.keymap.set('n', '<leader>ft', builtin.lsp_type_definitions, { desc = '[f]ind [t]ype definition' })

-- nvim-mini/mini.trailspace
require('mini.trailspace').setup()

-- lukas-reineke/indent-blankline.nvim
require('ibl').setup()

-- folke/todo-comments.nvim
require('todo-comments').setup()
vim.keymap.set('n', '<leader>fc', '<CMD>TodoTelescope<CR>', { desc = '[f]ind TODO [c]omments' })

-- windwp/nvim-autopairs
require('nvim-autopairs').setup()

-- Wansmer/treesj
local treesj = require 'treesj'
treesj.setup {
  use_default_keymaps = false,
}
vim.keymap.set('n', 'gS', treesj.toggle, { desc = 'toggle block split' })

-- mrjones2014/smart-splits.nvim
local splits = require 'smart-splits'
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<A-h>', splits.resize_left)
vim.keymap.set('n', '<A-j>', splits.resize_down)
vim.keymap.set('n', '<A-k>', splits.resize_up)
vim.keymap.set('n', '<A-l>', splits.resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', splits.move_cursor_left)
vim.keymap.set('n', '<C-j>', splits.move_cursor_down)
vim.keymap.set('n', '<C-k>', splits.move_cursor_up)
vim.keymap.set('n', '<C-l>', splits.move_cursor_right)
vim.keymap.set('n', '<C-\\>', splits.move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set('n', '<leader>wh', splits.swap_buf_left, { desc = 'Swap windows left' })
vim.keymap.set('n', '<leader>wj', splits.swap_buf_down, { desc = 'Swap windows down' })
vim.keymap.set('n', '<leader>wk', splits.swap_buf_up, { desc = 'Swap windows up' })
vim.keymap.set('n', '<leader>wl', splits.swap_buf_right, { desc = 'Swap windows left' })

-- folke/which-key.nvim
require('which-key').setup {
  spec = {
    { '<leader>b', group = '[b]uffer' },
    { '<leader>f', group = '[f]ind' },
    { '<leader>g', group = '[g]it' },
    { '<leader>gh', group = '[g]it [h]unk' },
    { '<leader>t', group = '[t]oggle' },
    { '<leader>T', group = '[T]esting' },
    { '<leader>w', group = '[w]indow' },
  },
}

-- lewis6991/gitsigns.nvim
local gitsigns = require 'gitsigns'
gitsigns.setup()
vim.keymap.set('n', '<leader>ts', gitsigns.toggle_signs, { desc = '[t]oggle git [s]igns' })
vim.keymap.set('n', '<leader>tW', gitsigns.toggle_word_diff, { desc = '[t]oggle git [W]ord diff' })
vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, { desc = '[g]it [b]lame current line' })
vim.keymap.set('n', '<leader>ghp', gitsigns.preview_hunk, { desc = '[g]it [h]unk [p]review' })
vim.keymap.set('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[g]it [h]unk [r]eset' })

-- andythigpen/nvim-coverage
local coverage = require 'coverage'
coverage.setup { auto_reload = true }
vim.keymap.set('n', '<leader>tc', coverage.toggle, { desc = '[t]oggle test [c]overage' })

-- hrsh7th/cmp-nvim-lsp
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- hrsh7th/nvim-cmp
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
cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())

-- stevearc/conform.nvim
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

-- zapling/mason-conform.nvim
require('mason-conform').setup()

-- jay-babu/mason-nvim-dap.nvim
require('mason-nvim-dap').setup {
  ensure_installed = {},
  automatic_installation = true,
  handlers = nil,
}

-- theHamsta/nvim-dap-virtual-text
require('nvim-dap-virtual-text').setup {}

-- leoluz/nvim-dap-go
require('dap-go').setup()

-- mfussenegger/nvim-lint
local lint = require 'lint'
lint.linters_by_ft = {
  golang = { 'golangcilint' },
}
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    lint.try_lint()
  end,
})

-- rshkarin/mason-nvim-lint
require('mason-nvim-lint').setup()

-- folke/noice.nvim
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'noice' and kind == 'update' then
      if not ev.data.active then
        vim.cmd.packadd 'noice'
      end
      vim.cmd 'TSInstall vim regex lua bash markdown markdown_inline'
    end
  end,
})
require('noice').setup {
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  presets = {
    lsp_doc_border = true,
  },
}

-- A framework for interacting with tests within NeoVim.
-- {
--   'nvim-neotest/neotest',
--   dependencies = {
--     'nvim-neotest/nvim-nio',
--     'nvim-lua/plenary.nvim',
--     'antoinemadec/FixCursorHold.nvim',
--     'nvim-treesitter/nvim-treesitter',
--     'nvim-neotest/neotest-go',
--   },
--   config = function()
--     -- get neotest namespace (api call creates or returns namespace)
--     local neotest_ns = vim.api.nvim_create_namespace 'neotest'
--     vim.diagnostic.config({
--       virtual_text = {
--         format = function(diagnostic)
--           local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
--           return message
--         end,
--       },
--     }, neotest_ns)
--
--     local neotest = require 'neotest'
--
--     neotest.setup {
--       adapters = {
--         require 'neotest-go',
--       },
--     }
--
--     vim.keymap.set('n', '<leader>Tn', neotest.run.run, { desc = '[T]esting: run [n]earest test' })
--     vim.keymap.set('n', '<leader>Tf', function()
--       neotest.run.run(vim.fn.expand '%')
--     end, { desc = '[T]esting: run test [f]ile' })
--   end,
-- },

-- vim: ts=2 sts=2 sw=2 et
