return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = function(buf)
      local disable_filetypes = { c = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[buf].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- TODO: check if this works while commented
      -- javascript = { { 'prettierd', 'prettier' } },
      -- typescript = { { 'prettierd', 'prettier' } },
      python = { 'isort', 'black' },
    },
  },
}
