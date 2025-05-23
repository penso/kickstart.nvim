return {
  'milanglacier/minuet-ai.nvim',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'Saghen/blink.cmp',
  },
  config = function()
    require('minuet').setup {
      request_timeout = 30000,
      context_window = 768,
      -- notify = 'debug', -- Enabled debug notifications
      provider = 'openai_compatible', -- Using standard OpenAI provider
      provider_options = {
        openai = {
          api_key = 'OPENAI_API_KEY',
          name = 'OpenAI',
          end_point = 'https://api.openai.com/v1/chat/completions', -- Standard OpenAI chat endpoint
          model = 'gpt-3.5-turbo', -- Standard chat model
          optional = {
            max_tokens = 256,
            top_p = 0.9,
          },
        },
        openai_compatible = {
          stream = true,
          api_key = 'TERM',
          name = 'ollama',
          end_point = 'http://m4max.local:1234/v1/chat/completions',
          model = 'deepseek-r1-distill-qwen-7b', -- 'qwen2.5-coder-3b-instruct',
          optional = {
            max_tokens = 256,
            top_p = 0.9,
          },
        },
      },
      -- Other options like n_completions can be added here if needed for OpenAI
      -- n_completions = 1,
    }
  end,
}
