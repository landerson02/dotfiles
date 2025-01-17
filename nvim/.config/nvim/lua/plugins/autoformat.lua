return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    -- format_on_save = function(buf)
    --   local disable_filetypes = { c = true }
    --   return {
    --     timeout_ms = 500,
    --     lsp_fallback = not disable_filetypes[vim.bo[buf].filetype],
    --   }
    -- end,
    format_after_save = function (bufnr)
      return { timeout_ms = 500, lsp_fallback = true, async = true }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      python = { 'isort', 'black' },
    },
  },
}
