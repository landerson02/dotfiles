return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
    -- autotag = { enable = true },
  },
  config = function(_, opts)
    --- @diagnostic disable-next-line
    require('nvim-treesitter.configs').setup(opts)

    require('nvim-ts-autotag').setup()
  end,
}
