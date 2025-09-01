return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc, remap = true })
          end

          local builtin = require('telescope.builtin')

          map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gr', builtin.lsp_references, '[G]oto [R]eferences')
          map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
          map('gt', builtin.lsp_type_definitions, '[G]oto [T]ype Definition')
          map('<leader>fs', builtin.lsp_document_symbols, '[F]ind [S]ymbols')
          map('<leader>fw', builtin.lsp_dynamic_workspace_symbols, '[F]ind in [W]orkspace')
          map('<leader>r', vim.lsp.buf.rename, '[R]ename')

          -- Highlight references on hover
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- Change diagnostic symbols in the gutter
      local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
      local diagnostic_signs = {}
      for type, icon in pairs(signs) do
        diagnostic_signs[vim.diagnostic.severity[type]] = icon
      end
      vim.diagnostic.config({ signs = { text = diagnostic_signs } })

      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = {
        rust_analyzer = {},
        ts_ls = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {})
      require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

      require('lspconfig').basedpyright.setup({
        settings = {
          basedpyright = {
            analysis = {
              -- typeCheckingMode = 'basic', -- standard, strict, all, off, basic
              typeCheckingMode = 'off', -- standard, strict, all, off, basic
              autoSearchPaths = true,
              autoImportCompletions = true,
              -- diagnosticMode = 'workspace',
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            -- Avoid re-setting up if already active
            for _, client in pairs(vim.lsp.get_clients()) do
              if client.name == server_name then
                return
              end
            end
            local server = servers[server_name] or {}
            server.capabilities =
              vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
        ensure_installed = ensure_installed,
        automatic_enable = true,
      })
    end,
  },
}
