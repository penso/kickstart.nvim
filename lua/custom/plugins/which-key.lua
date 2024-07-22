return
{
  'folke/which-key.nvim',
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  dependencies = {
    'echasnovski/mini.icons', -- Add the mini.icons plugin as a dependency
  },
  config = function()
    local wk = require("which-key")
    wk.setup {}

    wk.add({
      { "<leader>x", group = "Diagnostics" },
      { "<leader>e", icon = { icon = "󰈔", color = "cyan" } },
    })
  end,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
};
