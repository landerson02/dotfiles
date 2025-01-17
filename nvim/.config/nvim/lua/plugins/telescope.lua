return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = true },
    },
    config = function()
      require('telescope').setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
        defaults = {
          file_ignore_patterns = {
            '.class',
            '.jpg',
            '.png',
            'node_modules',
            '.git',
          },
          selection_caret = '► ',
        },
      })
      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- Define mappings
      local tel = require('telescope.builtin')
      vim.keymap.set('n', '<leader>fd', tel.help_tags, { desc = '[F]ind [D]ocs' })
      vim.keymap.set('n', '<leader>fk', tel.keymaps, { desc = '[F]ind [Keymaps]' })
      vim.keymap.set('n', '<leader>ff', tel.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>fg', tel.live_grep, { desc = '[F]ind [G]rep' })
      vim.keymap.set('n', '<leader>fh', function()
        tel.find_files({ hidden = true })
      end, { desc = '[F]ind [H]idden' })

      vim.keymap.set('n', '<leader><leader>', function()
        require('telescope').extensions.smart_open.smart_open({
          cwd_only = true,
          result_limit = 10,
          layout_strategt = 'vertical',
          layout_config = {
            height = 15,
            width = 0.35,
          },
          previewer = false,
          results_title = false,
          prompt_title = false,
          prompt_prefix = '=> ',
          selection_caret = '►',
          entry_prefix = ' ',
        })
      end, { noremap = true, silent = true, desc = 'Smart Search' })

      vim.keymap.set('n', '<leader>fr', tel.git_files, { desc = '[F]ind [R]ecent files' })
      vim.keymap.set('n', '<leader>fb', tel.buffers, { desc = '[F]ind buffers' })

      vim.keymap.set('n', '<leader>fn', function()
        tel.find_files({ cwd = vim.fn.stdpath('config') })
      end, { desc = '[F]ind [N]eovim files' })

      vim.keymap.set('n', '<leader>fc', function()
        tel.find_files({
          cwd = vim.fn.expand('~/dotfiles'),
          hidden = true,
          prompt_title = 'Find Config Files',
        })
      end, { desc = '[F]ind [C]onfig files' })
    end,
  },
  {
    'danielfalk/smart-open.nvim',
    branch = '0.2.x',
    config = function()
      require('telescope').load_extension('smart_open')
    end,
    dependencies = {
      'kkharji/sqlite.lua',
      -- Only required if using match_algorithm fzf
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { 'nvim-telescope/telescope-fzy-native.nvim' },
    },
  },
}
