return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ravitemer/mcphub.nvim',
  },
  config = function()
    require('codecompanion').setup {
      adapters = {
        qwen = function()
          return require('codecompanion.adapters').extend('openai_compatible', {
            name = 'qwen',
            env = {
              url = 'http://m4max.local:1234',
              chat_url = '/v1/chat/completions',
            },
            schema = {
              model = {
                default = 'qwen2.5-coder-3b-instruct',
              },
            },
          })
        end,
      },
      display = {
        action_palette = {
          width = 200,
          height = 20,
          prompt = 'Prompt ', -- Prompt used for interactive LLM calls
          provider = 'telescope', -- default|telescope|mini_pick
          opts = {
            show_default_actions = true, -- Show the default actions in the action palette?
            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
          },
        },
      },
      strategies = {
        chat = {
          adapter = 'qwen',
        },
        inline = {
          adapter = 'qwen',
        },
      },
    }
    vim.api.nvim_set_keymap('n', '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>z', '<cmd>CodeCompanionChat<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<Leader>z', '<cmd>CodeCompanionChat<cr>', { noremap = true, silent = true })
  end,
}
