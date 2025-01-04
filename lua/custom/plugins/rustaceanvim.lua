return {
  "mrcjkb/rustaceanvim",
  version = '^5', -- Recommended
  lazy = false,
  config = function(_, _)
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {
      },
      -- LSP configuration
      server = {
        on_attach = function(client, buffer)
          require("lsp_on_attach")(client, buffer)

          -- Enable codelens refresh
          vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
            buffer = buffer,
            callback = function()
              vim.lsp.codelens.refresh({ bufnr = buffer })
            end,
          })
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            assist = {
              importMergeBehaviour = "full",
            },
          },
        },

      },
      -- DAP configuration
      dap = {
      },
    }
  end
}
