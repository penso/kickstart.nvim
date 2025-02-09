return {
  "milanglacier/minuet-ai.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("minuet").setup({
      -- completion = { keyword_length = 1 },
      -- n_completions = 1, -- recommend for local model for resource saving
      -- I recommend you start with a small context window firstly, and gradually
      -- increase it based on your local computing power.
      -- context_window = 1024,
      notify = 'debug',
      request_timeout = 30000,
      context_window = 768,
      -- provider = 'openai_compatible',
      -- provider_options = {
      --   openai_compatible = {
      --     api_key = 'PWD',
      --     name = 'lmstudio',
      --     end_point = 'http://m4max.local:1234/v1/chat/completions',
      --     -- end_point = 'http://localhost:1234/v1/chat/completions',
      --     model = 'qwen2.5-coder-3b-instruct',
      --     -- model = 'deepseek-r1-distill-qwen-7b',
      --     optional = {
      --       max_tokens = 256,
      --       top_p = 0.9,
      --     },
      --   },
      -- },
      provider = 'openai_fim_compatible',
      n_completions = 1, -- recommend for local model for resource saving
      -- I recommend you start with a small context window firstly, and gradually
      -- increase it based on your local computing power.
      provider_options = {
        openai_fim_compatible = {
          api_key = 'TERM',
          name = 'Ollama',
          -- end_point = 'http://localhost:11434/v1/completions',
          end_point = 'http://m4max.local:11434/v1/completions',
          model = 'qwen2.5-coder:7b',
          optional = {
            max_tokens = 256,
            top_p = 0.9,
          },
        },
      },
    })
  end
}
