return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup({ n_lines = 500 }) -- Better around/inside textobjs
  end,
}
