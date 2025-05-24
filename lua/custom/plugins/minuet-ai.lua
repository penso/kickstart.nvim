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
          model = 'qwen2.5-coder-3b-instruct',
          optional = {
            max_tokens = 256,
            top_p = 0.9,
          },
        },
        gemini = {
          model = 'gemini-2.0-flash',
          system = 'see [Prompt] section for the default value',
          few_shots = 'see [Prompt] section for the default value',
          chat_input = 'See [Prompt Section for default value]',
          stream = true,
          api_key = 'GEMINI_API_KEY',
          end_point = 'https://generativelanguage.googleapis.com/v1beta/models',
          optional = {
            generationConfig = {
              maxOutputTokens = 256,
              -- When using `gemini-2.5-flash`, it is recommended to entirely
              -- disable thinking for faster completion retrieval.
              thinkingConfig = {
                thinkingBudget = 0,
              },
            },
            safetySettings = {
              {
                -- HARM_CATEGORY_HATE_SPEECH,
                -- HARM_CATEGORY_HARASSMENT
                -- HARM_CATEGORY_SEXUALLY_EXPLICIT
                category = 'HARM_CATEGORY_DANGEROUS_CONTENT',
                -- BLOCK_NONE
                threshold = 'BLOCK_ONLY_HIGH',
              },
            },
          },
        },
      },
      -- Other options like n_completions can be added here if needed for OpenAI
      -- n_completions = 1,
    }
  end,
}
