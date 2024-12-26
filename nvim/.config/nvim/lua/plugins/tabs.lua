return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  -- init = function()
  --   vim.g.barbar_auto_setup = false
  -- end,
  -- opts = {
  --   -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
  --   -- animation = true,
  --   -- insert_at_start = true,
  --   -- …etc.
  -- },
  config = function()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Next/prev buffer
    map('n', '<leader>bn', '<cmd>BufferNext<CR>', opts)
    map('n', '<leader>bp', '<cmd>BufferPrevious<CR>', opts)

    -- Close buffer
    map('n', '<leader>bw', '<cmd>BufferClose<CR>', opts)

    -- Select ith buffer
    map('n', '<leader>b1', '<cmd>BufferGoto 1<CR>', opts)
    map('n', '<leader>b2', '<cmd>BufferGoto 2<CR>', opts)
    map('n', '<leader>b3', '<cmd>BufferGoto 3<CR>', opts)
    map('n', '<leader>b4', '<cmd>BufferGoto 4<CR>', opts)
    map('n', '<leader>b5', '<cmd>BufferGoto 5<CR>', opts)
    map('n', '<leader>b6', '<cmd>BufferGoto 6<CR>', opts)
    map('n', '<leader>b7', '<cmd>BufferGoto 7<CR>', opts)
    map('n', '<leader>b8', '<cmd>BufferGoto 8<CR>', opts)
    map('n', '<leader>b9', '<cmd>BufferGoto 9<CR>', opts)
  end,
}
