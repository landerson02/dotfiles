-- return {}
return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },

  opts = function()
    local opts = {
      window = {
        width = 30,
      },
    }
    return opts
  end,

  config = function()
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Open file [E]xplorer' })
  end,
}
