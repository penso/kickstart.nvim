return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",              -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" },  -- Optional: For prettier markdown rendering
    },
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        lmstudio = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "http://m4max.local:1234",
              chat_url = "/v1/chat/completions",
            },
            schema = {
              model = {
                default = "qwen2.5-coder-3b-instruct",
              },
            }
          })
        end,
        qwen = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            name = "qwen",
            env = {
              url = "http://m4max.local:1234",
              chat_url = "/v1/chat/completions",
            },
            schema = {
              model = {
                default = "qwen2.5-coder-3b-instruct",
              },
            },
          })
        end,
        -- ollama = function()
        --   return require("codecompanion.adapters").extend("openai_compatible", {
        --     env = {
        --       url = "http://m4max.local:11434", -- optional: default value is ollama url http://127.0.0.1:11434
        --       -- chat_url = "/v1/chat/completions",    -- optional: default value, override if different
        --     },
        --   })
        -- end,
      },
      display = {
        action_palette = {
          width = 200,
          height = 20,
          prompt = "Prompt ",                   -- Prompt used for interactive LLM calls
          provider = "telescope",               -- default|telescope|mini_pick
          opts = {
            show_default_actions = true,        -- Show the default actions in the action palette?
            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
          },
        },
      },
      strategies = {
        chat = {
          adapter = "qwen",
        },
        inline = {
          adapter = "qwen",
        },
      },
    })
    vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<Leader>z", "<cmd>CodeCompanionChat<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<Leader>z", "<cmd>CodeCompanionChat<cr>", { noremap = true, silent = true })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end
}
