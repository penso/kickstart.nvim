return {
  'milanglacier/minuet-ai.nvim',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'Saghen/blink.cmp',
  },
  config = function()
    require('minuet').setup {
      -- completion = { keyword_length = 1 },
      -- n_completions = 1, -- recommend for local model for resource saving
      -- I recommend you start with a small context window firstly, and gradually
      -- increase it based on your local computing power.
      -- context_window = 1024,
      -- notify = 'debug',
      request_timeout = 30000,
      context_window = 768,
      provider = 'openai_compatible', -- Switched to LM Studio provider
      provider_options = {
        openai_compatible = {
          api_key = 'PWD', -- This is often a placeholder for LM Studio if no auth is needed
          name = 'lmstudio',
          end_point = 'http://m4max.local:1234/v1/chat/completions', -- Using existing LM Studio endpoint
          -- end_point = 'http://localhost:1234/v1/chat/completions',
          model = 'qwen2.5-coder-3b-instruct', -- Using existing LM Studio model
          -- model = 'deepseek-r1-distill-qwen-7b',
          optional = {
            max_tokens = 256,
            top_p = 0.9,
          },
        },
      },
      -- provider = 'openai_fim_compatible', -- Commented out Ollama provider
      -- n_completions = 1, -- recommend for local model for resource saving
      -- I recommend you start with a small context window firstly, and gradually
      -- increase it based on your local computing power.
      -- provider_options = {
      --   openai_fim_compatible = {
      --     api_key = 'TERM',
      --     name = 'Ollama',
      --     -- end_point = 'http://localhost:11434/v1/completions',
      --     end_point = 'http://m4max.local:11434/v1/completions',
      --     model = 'qwen2.5-coder:7b',
      --     optional = {
      --       max_tokens = 256,
      --       top_p = 0.9,
      --     },
      --   },
      -- },
    }
  end,
}
