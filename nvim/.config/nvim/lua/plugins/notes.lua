return {
  dir = '~/projects/notes.nvim',
  config = function()
    require('notes').setup {
      -- file_type = ".txt",
    }
  end,
}
