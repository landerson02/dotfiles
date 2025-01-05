return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup({ n_lines = 500 }) -- Better around/inside textobjs
    require('mini.surround').setup() -- add/delete/replace surroundings

    -- Status line
    local status_line = require('mini.statusline')
    status_line.setup({ use_icons = true })
    --- @diagnostic disable-next-line
    status_line.section_location = function()
      return '%21:%-2v'
    end
  end,
}
