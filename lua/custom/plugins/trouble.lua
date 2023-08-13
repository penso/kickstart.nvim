return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local wk = require("which-key")
    wk.register({
      t = {
        name = "[T]rouble",
        c = { "<cmd>TroubleClose<cr>", "[T]trouble [C]lose" },
        r = { "<cmd>TroubleRefresh<cr>", "[T]rouble [R]efresh" },
        t = { "<cmd>TroubleToggle<cr>", "[T]rouble [T]oggle" },
      },
    }, { prefix = "<leader>" })
  end
}
