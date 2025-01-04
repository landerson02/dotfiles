return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  config = function()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true, desc = 'which_key_ignore' }

    for i = 1, 9 do
      map('n', '<leader>' .. i, '<cmd>BufferGoto ' .. i .. '<CR>', opts)
    end

    -- Next/prev buffer
    map('n', '<leader>l', '<cmd>BufferNext<CR>', opts)
    map('n', '<leader>h', '<cmd>BufferPrevious<CR>', opts)

    -- Close buffer
    map('n', '<leader>x', '<cmd>BufferClose<CR>', opts)
  end,
}
