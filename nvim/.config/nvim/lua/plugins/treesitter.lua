return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
    -- require('nvim-ts-autotag').setup()
  end,
}
