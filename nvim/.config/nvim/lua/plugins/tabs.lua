return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require('bufferline')
    --- @type bufferline.UserConfig
    local opts = {
      options = {
        style_preset = bufferline.style_preset.default,
        themable = true,
      },
    }
    bufferline.setup(opts)

    local map = vim.api.nvim_set_keymap
    local key_opts = { noremap = true, silent = true, desc = 'which_key_ignore' }

    map('n', '<leader>.', '<cmd>BufferLineCycleNext<CR>', key_opts)
    map('n', '<leader>>', '<cmd>BufferLineMoveNext<CR>', key_opts)
    map('n', '<leader>,', '<cmd>BufferLineCyclePrev<CR>', key_opts)
    map('n', '<leader><', '<cmd>BufferLineMovePrev<CR>', key_opts)
    map('n', '<leader>x', '<cmd>b#|bd#<CR>', key_opts)

    for i = 1, 9 do
      map('n', '<leader>' .. i, '<cmd>BufferLineGoToBuffer ' .. i .. '<CR>', key_opts)
    end
  end,
}
