return {
  'tpope/vim-sleuth',
  { 'numToStr/Comment.nvim', opts = {} },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local opts = {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }
      local gs = require('gitsigns')
      gs.setup(opts)

      vim.keymap.set('n', '<leader>gn', function()
        gs.nav_hunk('next')
      end, { desc = 'Next Hunk' })

      vim.keymap.set('n', '<leader>gp', function()
        gs.nav_hunk('prev')
      end, { desc = 'Prev Hunk' })

      vim.keymap.set('n', '<leader>gd', function()
        gs.diffthis()
        vim.cmd('wincmd h')
      end, { desc = 'Diff this file' })
    end,
  },

  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {
    'FabijanZulj/blame.nvim',
    config = function()
      require('blame').setup({
        date_format = '%m-%d-%Y',
      })

      vim.keymap.set('n', '<leader>gb', function()
        vim.cmd('BlameToggle')
      end, { desc = 'Toggle [B]lame' })
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

  {
    'wakatime/vim-wakatime',
    lazy = false,
  },

  {
    -- Make all windows transparent
    'xiyaowong/transparent.nvim',
    lazy = false,
    config = function()
      require('transparent').setup({
        extra_groups = {
          'NormalFloat',
          'TeleScopeNormal',
          'TelescopeBorder',
          'TelescopePromptBorder',
          'TelescopePromptTitle',
          'WhichKeyNormal',
          'WhichKeyBorder',
          'NoiceSplitBorder',
          'FloatBorder',
          'FloatTitle',
          'FloatFooter',
          'LspInfoBorder',
        },
      })
      require('transparent').clear_prefix('bufferline')
    end,
  },

  {
    'kawre/leetcode.nvim',
    -- build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
    dependencies = {
      'nvim-telescope/telescope.nvim',
      -- "ibhagwan/fzf-lua",
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    opts = {
      lang = 'python3',
      injector = {
        ['python3'] = {
          before = true,
        },
      },
    },
  },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },

  -- NOTE: Too buggy for now check back in the future
  -- {
  --   'nvzone/typr',
  --   dependencies = 'nvzone/volt',
  --   opts = {},
  --   cmd = { 'Typr', 'TyprStats' },
  -- },
}
