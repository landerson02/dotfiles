return {
  'stevearc/oil.nvim',
  config = function()
    local oil = require 'oil'
    oil.setup {
      keymaps = {
        ['l'] = 'actions.select',
        ['h'] = 'actions.parent',
      },
    }
    vim.keymap.set('n', '<leader>o', oil.toggle_float, { desc = '[O]il' })

    -- Close on q
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'oil',
      callback = function()
        vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = true, silent = true })
      end,
    })
  end,
}
