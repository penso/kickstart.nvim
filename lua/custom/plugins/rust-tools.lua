local mason_path       = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
local codelldb_adapter = {
  type = "server",
  port = "${port}",
  executable = {
    command = mason_path .. "bin/codelldb",
    args = { "--port", "${port}" },
    -- On windows you may have to uncomment this:
    -- detached = false,
  },
}

return {
  "simrat39/rust-tools.nvim",
  config = function()
    require("rust-tools").setup {
      tools = {
        -- quickfix, termopen, toggleterm, vimux
        executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
        reload_workspace_from_cargo_toml = true,
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          auto = false, -- using another plugin
          only_current_line = false,
          show_parameter_hints = true,
          parameter_hints_prefix = "<- ",
          other_hints_prefix = " => ",
          max_len_align = false,
          max_len_align_padding = 1,
          right_align = false,
          right_align_padding = 7,
          highlight = "Comment",
        },
        code_action_group = {
          enabled = true,
          border = "rounded",
          width = 80,
          opts = {
            width = 80,
          },
        },
        hover_actions = {
          border = "rounded",
          width = 80,
        },
        on_initialized = function()
          vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
            pattern = { "*.rs" },
            callback = function()
              local _, _ = pcall(vim.lsp.codelens.refresh)
            end,
          })
        end,
      },
      dap = {
        adapter = codelldb_adapter,
      },
      server = {
        on_attach = require("lsp_on_attach"),
        settings = {
          -- cargo = {
          --   allFeatures = true,
          --   runBuildScripts = true,
          -- },
          ["rust-analyzer"] = {
            assist = {
              importMergeBehaviour = "full",
              -- importPrefix = "plain",
            },
          }
        }
      },
    }
  end,
}
