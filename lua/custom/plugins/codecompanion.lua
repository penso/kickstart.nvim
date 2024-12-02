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
      -- strategies = {
      --   chat = {
      --     adapter = "copilot",
      --   },
      --   inline = {
      --     adapter = "copilot",
      --   },
      --   agent = {
      --     adapter = "copilot",
      --   },
      -- },
    })
    vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<Leader>z", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<Leader>z", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionAdd<cr>", { noremap = true, silent = true })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end
}
