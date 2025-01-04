return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require('rustaceanvim.neotest')
      },
    }

    local wk = require("which-key")
    wk.add(
      {
        { "<leader>ct", desc = "[C]ode [T]est", icon = { icon = "󱞊" } },
        {
          "<leader>cto",
          function() require("neotest").output_panel.toggle() end,
          desc = "[C]ode [T]est [O]utput",
        },
        {
          "<leader>ctw",
          function() require("neotest").output.open({ enter = true }) end,
          desc = "[C]ode [T]est [W]indow",
        },
        {
          "<leader>cts",
          function() require("neotest").summary.toggle() end,
          desc = "[C]ode [T]est [S]ummary",
        },
        {
          "<leader>ctr",
          function() require("neotest").run.run() end,
          desc = "[C]ode [T]est [R]un current test",
        },
        {
          "<leader>ctf",
          function() require("neotest").run.run(vim.fn.expand("%")) end,
          desc = "[C]ode [T]est [F]ile ",
        },
      }
    );
  end
}
