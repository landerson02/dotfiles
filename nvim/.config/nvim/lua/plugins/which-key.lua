return {
  'folke/which-key.nvim', -- Shows possible key mappings
  event = 'VimEnter',
  config = function()
    require('which-key').setup()
    require('which-key').add({
      { '<leader>f', group = 'find' },
      { '<leader>g', group = 'git' },
      { '<leader>u', group = 'toggle' },
    })
  end,
}
