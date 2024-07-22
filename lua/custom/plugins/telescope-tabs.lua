return {
  'LukasPietzschmann/telescope-tabs',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('telescope').load_extension 'telescope-tabs'
    require('telescope-tabs').setup {
      -- Your custom config :^)
    }
    local wk = require("which-key")
    wk.add(
      {
        { "<leader>st", "<cmd>lua require('telescope-tabs').list_tabs()<cr>", desc = "[T]abs" },
      }
    )
  end,
}
