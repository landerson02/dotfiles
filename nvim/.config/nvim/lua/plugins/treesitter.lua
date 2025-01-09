return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'html',
      'lua',
      'markdown',
      'markdown_inline',
      'html',
      'vim',
      'vimdoc',
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
