return {
  {
    'sphamba/smear-cursor.nvim',
    opts = {
      smear_between_neighbor_lines = true,
      smear_to_cmd = false,
    },
  },

  {
    'eandrju/cellular-automaton.nvim',
  },
  {
    'seandewar/killersheep.nvim',
    config = function()
      require('killersheep').setup({
        gore = true, -- Enables/disables blood and gore.
        keymaps = {
          move_left = 'h', -- Keymap to move cannon to the left.
          move_right = 'l', -- Keymap to move cannon to the right.
          shoot = '<Space>', -- Keymap to shoot the cannon.
        },
      })
    end,
  },
}
