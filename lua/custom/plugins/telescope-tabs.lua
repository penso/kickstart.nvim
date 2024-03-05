return {
  'LukasPietzschmann/telescope-tabs',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('telescope').load_extension 'telescope-tabs'
    require('telescope-tabs').setup {
      -- Your custom config :^)
    }
    local wk = require("which-key")
    wk.register({
      s = {
        name = "[S]earch",
        t = { "<cmd>lua require('telescope-tabs').list_tabs()<cr>", "[T]abs" },
      },
    }, { prefix = "<leader>" })
  end,
}
