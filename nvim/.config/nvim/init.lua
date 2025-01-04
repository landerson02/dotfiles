-- Main Config

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- Get rid of netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Color stuff?
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- vim.opt.guicursor = 'n-v-c:block-Cursor/lCursor,ve:ver25-Cursor,o:hor50-Cursor'
vim.opt.guicursor = 'n-v-c:block,i:ver25'
vim.cmd [[autocmd VimLeave * set guicursor=a:ver25]]

vim.opt.mouse = 'a' -- Enables mouse mode

vim.opt.showmode = false -- Dont show mode twice

vim.opt.clipboard = 'unnamedplus' -- Sync clipboard with OS

vim.opt.breakindent = true -- Properly break lines

vim.opt.undofile = true -- Save undos

-- Remove case sensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes' -- keep signcolumn

vim.opt.updatetime = 250 -- Dec update time
vim.opt.timeoutlen = 300 -- For which-key popup

-- split directions
vim.opt.splitbelow = true
vim.opt.splitright = true

-- How whitespace is shown
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split' -- live substitutions

vim.opt.scrolloff = 10 -- Keep lines above/below cursor

-- Highlight on search + remove on <Esc>
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Terminal keybinds
vim.keymap.set('n', '<leader>t', '<cmd>sp<CR><cmd>terminal<CR>i', { desc = 'Open [T]erminal' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Close terminal' })

-- Disgnostic Keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Splits
vim.keymap.set('n', '|', '<cmd>vs<CR>')
vim.keymap.set('n', '\\', '<cmd>sp<CR>')

vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })

-- Window Navigation
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-w>.', '10<C-w>>', { desc = 'Increase Width 10X' })
vim.keymap.set('n', '<C-w>,', '10<C-w><', { desc = 'Decrease Width 10X' })

-- Highlight on yank autocommand
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Hightlight on yanking text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Install Lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Plugins
require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop / shiftwidth automatically

  { 'numToStr/Comment.nvim', opts = {} }, -- 'gc' to comment visual section

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'folke/which-key.nvim', -- Shows possible key mappings
    event = 'VimEnter',
    config = function()
      require('which-key').setup()
      require('which-key').add {
        { '<leader>f', group = 'find' },

        -- TODO: Add new keybinds
      }
    end,
  },
  -- {
  --   'folke/tokyonight.nvim', -- color scheme
  --   -- priority = 1000,
  --   init = function()
  --     vim.cmd.colorscheme 'tokyonight-night'
  --     -- vim.cmd.colorscheme 'tokyonight-day'
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  --   config = function()
  --     require('tokyonight').setup {
  --       style = 'night',
  --       transparent = true,
  --       on_colors = function(colors)
  --         vim.g.tokyonight_colors = colors
  --       end,
  --       on_highlights = function(highlights)
  --         vim.g.tokyonight_highlights = highlights
  --       end,
  --
  --       -- dim_inactive = {
  --       --   enable = false,
  --       --   level = 1,
  --       -- },
  --     }
  --   end,
  -- },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = 'dark',
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { 'italic' }, -- Change the style of comments
          conditionals = { 'italic' },
          loops = {},
          functions = {},
          keywords = { 'italic' },
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      }
      -- setup must be called before loading
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'wakatime/vim-wakatime',
    lazy = false,
  },

  {
    'FabijanZulj/blame.nvim',
    config = function()
      require('blame').setup {
        date_format = '%m-%d-%Y',
      }

      vim.keymap.set('n', '<leader>b', '<CMD>BlameToggle<CR>', { desc = 'Open git [B]lame' })
    end,
  },
  {
    'ThePrimeagen/vim-be-good',
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    -- -@module 'render-markdown'
    -- -@type render.md.UserConfig
    opts = {},
  },

  -- Latex stuff
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'skim'
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  -- import all other plugins
  { import = 'plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- NOTE: FIX AT SOME POINT
vim.keymap.set('n', '<leader>g', function()
  Snacks.lazygit()
end, { desc = 'Lazy[G]it' })

-- vim: ts=2 sts=2 sw=2 et
