vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remove netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Colors
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.mouse = 'a' -- Mouse support

vim.opt.showmode = false -- Don't show mode twice

vim.opt.clipboard = 'unnamedplus' -- System clipboard

vim.opt.breakindent = true -- Break lines correctly

vim.opt.undofile = true -- Persistent undo

-- Case insensitive searching unless caps
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes' -- Always show sign column

vim.opt.timeoutlen = 300 -- Faster timeout

-- Split Direction
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace
vim.opt.list = true
vim.cmd.listchars = {
  tab = '▸ ',
  trail = '·',
  extends = '❯',
}

vim.opt.inccommand = 'split' -- Show changes incrementally

vim.opt.scrolloff = 10 -- Lines above/below cursor

-- Highlight on search
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', function()
  vim.cmd('nohlsearch')
end)

-- Diagnostics
vim.keymap.set(
  'n',
  '[d',
  vim.diagnostic.goto_prev,
  { desc = 'Go to previous [D]iagnostic message' }
)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set(
  'n',
  '<leader>E',
  vim.diagnostic.open_float,
  { desc = 'Show diagnostic [E]rror messages' }
)

-- Splits
vim.keymap.set('n', '|', '<cmd>vs<CR>')
vim.keymap.set('n', '\\', '<cmd>sp<CR>')

-- Windows
vim.keymap.set('n', '<C-w>.', '10<C-w>>', { desc = 'Increase Width 10X' })
vim.keymap.set('n', '<C-w>,', '10<C-w><', { desc = 'Decrease Width 10X' })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yanking text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- CursorHold faster
vim.opt.updatetime = 200
