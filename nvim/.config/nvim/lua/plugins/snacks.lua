return {
  'folke/snacks.nvim',
  opts = {
    dashboard = {
      sections = {
        { section = 'header' },
        -- { pane = 1, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'keys', gap = 1, padding = 1 },
        -- {
        --   pane = 2,
        --   section = 'terminal',
        --   cmd = 'chafa ~/path/to/png --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1',
        --   height = 17,
        --   padding = 1,
        -- },
        { section = 'startup' },
      },
    },
    indent = {},
    -- lazygit = {
    --   configure = true,
    --   config = {
    --     gui = {
    --       nerdFontsVersion = '3',
    --     },
    --   },
    --   keys = {
    --     {
    --       '<leader>g',
    --       function()
    --         Snacks.lazygit()
    --       end,
    --       desc = 'Lazy[G]it',
    --     },
    --   },
    -- },
    notifier = {},
  },
}
