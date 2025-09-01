return {
  'quolpr/quicktest.nvim',
  config = function()
    local qt = require('quicktest')

    qt.setup({
      adapters = {
        require('quicktest.adapters.playwright')({}),
        require('quicktest.adapters.pytest')({
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      },
      default_win_mode = 'split',
      use_builtin_colorizer = true,
    })
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  keys = {
    {
      '<leader>tm',
      function()
        local qt = require('quicktest')
        qt.run_line()
      end,
      desc = '[T]est [M]ethod',
    },
    {
      '<leader>tf',
      function()
        local qt = require('quicktest')

        qt.run_file()
      end,
      desc = '[T]est [F]ile',
    },
    {
      '<leader>td',
      function()
        local qt = require('quicktest')

        qt.run_dir()
      end,
      desc = '[T]est [D]ir',
    },
    {
      '<leader>ta',
      function()
        local qt = require('quicktest')

        qt.run_all()
      end,
      desc = '[T]est [A]ll',
    },
    {
      '<leader>tp',
      function()
        local qt = require('quicktest')

        qt.run_previous()
      end,
      desc = '[T]est [P]revious',
    },
    {
      '<leader>tt',
      function()
        local qt = require('quicktest')

        qt.toggle_win('split')
      end,
      desc = '[T]est [T]oggle Window',
    },
    {
      '<leader>tc',
      function()
        local qt = require('quicktest')

        qt.cancel_current_run()
      end,
      desc = '[T]est [C]ancel',
    },
  },
}
