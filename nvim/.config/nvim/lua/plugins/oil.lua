return {
  {
    'stevearc/oil.nvim',
    config = function()
      local oil = require('oil')
      oil.setup({
        keymaps = {
          ['l'] = 'actions.select',
          ['h'] = 'actions.parent',
          ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
        },
        win_options = {
          signcolumn = 'yes:2',
        },
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, bufnr)
            local ignored = {
              node_modules = true,
              ['.'] = true,
              ['..'] = true,
              ['.git'] = true,
              ['.DS_Store'] = true,
            }
            return ignored[name] == true
          end,
        },
        float = {
          -- Padding around the floating window
          padding = 20,
          -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          max_width = 0.6,
          max_height = 0.6,
          border = 'rounded',
        },
      })
      vim.keymap.set('n', '<leader>o', oil.toggle_float, { desc = '[O]il' })

      -- Close on q
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'oil',
        callback = function()
          vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = true, silent = true })
        end,
      })
    end,
  },
  {
    'refractalize/oil-git-status.nvim',

    dependencies = {
      'stevearc/oil.nvim',
    },

    config = true,
  },
}
